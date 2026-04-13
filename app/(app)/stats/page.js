import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { BookOpen, Target, Calendar, TrendingUp } from 'lucide-react'

export default async function StatsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { count: totalReviewed } = await supabase
    .from('user_card_progress')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .neq('status', 'new')

  const { count: totalSessions } = await supabase
    .from('sessions')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .not('ended_at', 'is', null)

  const { data: sessionStats } = await supabase
    .from('sessions')
    .select('total_cards, count_good, count_easy')
    .eq('user_id', user.id)
    .not('ended_at', 'is', null)

  const totalCards = sessionStats?.reduce((a, s) => a + (s.total_cards || 0), 0) || 0
  const totalCorrect = sessionStats?.reduce((a, s) => a + (s.count_good || 0) + (s.count_easy || 0), 0) || 0
  const accuracy = totalCards > 0 ? Math.round((totalCorrect / totalCards) * 100) : 0

  const { data: recentSessions } = await supabase
    .from('sessions')
    .select('id, started_at, total_cards, count_good, count_easy, modules(name, levels(name))')
    .eq('user_id', user.id)
    .not('ended_at', 'is', null)
    .order('started_at', { ascending: false })
    .limit(10)

  const stats = [
    { label: 'Kartu Dipelajari', value: totalReviewed || 0, icon: BookOpen, color: 'var(--accent)', bg: 'var(--accent-light)' },
    { label: 'Total Sesi', value: totalSessions || 0, icon: Calendar, color: 'var(--green)', bg: 'var(--green-light)' },
    { label: 'Akurasi', value: `${accuracy}%`, icon: Target, color: 'var(--amber)', bg: 'var(--amber-light)' },
    { label: 'Kartu Dijawab', value: totalCards, icon: TrendingUp, color: 'var(--purple)', bg: 'var(--purple-light)' },
  ]

  return (
    <div className="page-enter space-y-8">
      <div className="page-header">
        <h1>Statistik</h1>
        <p>Perkembangan belajarmu</p>
      </div>

      <div className="card-grid-2">
        {stats.map(({ label, value, icon: Icon, color, bg }) => (
          <div key={label} className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-5 shadow-[var(--shadow-sm)]">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-9 h-9 rounded-[10px] flex items-center justify-center flex-shrink-0" style={{ background: bg }}>
                <Icon size={17} style={{ color }} />
              </div>
              <p className="text-sm text-[var(--text-muted)]">{label}</p>
            </div>
            <p className="text-3xl font-bold text-[var(--text-primary)] tracking-tight">{value}</p>
          </div>
        ))}
      </div>

      <div>
        <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-widest mb-4">Sesi Terakhir</p>

        {!recentSessions?.length ? (
          <div className="text-center py-16 bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] text-sm text-[var(--text-muted)]">
            Belum ada sesi
          </div>
        ) : (
          <div className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] shadow-[var(--shadow-sm)] overflow-hidden">
            <div className="grid grid-cols-12 px-5 py-3 bg-[var(--surface-2)] border-b border-[var(--border)]">
              <span className="col-span-5 text-xs font-semibold text-[var(--text-muted)]">Modul</span>
              <span className="col-span-3 text-xs font-semibold text-[var(--text-muted)]">Tanggal</span>
              <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)] text-center">Kartu</span>
              <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)] text-right">Akurasi</span>
            </div>
            {recentSessions.map((s, idx) => {
              const acc = s.total_cards > 0 ? Math.round(((s.count_good + s.count_easy) / s.total_cards) * 100) : 0
              const date = new Date(s.started_at).toLocaleDateString('id-ID', { day: 'numeric', month: 'short' })
              return (
                <div key={s.id} className={`grid grid-cols-12 items-center px-5 py-3.5 ${idx < recentSessions.length - 1 ? 'border-b border-[var(--border)]' : ''}`}>
                  <div className="col-span-5 min-w-0">
                    <p className="text-sm font-medium text-[var(--text-primary)] truncate">{s.modules?.name || 'Kartu Sendiri'}</p>
                    {s.modules?.levels?.name && (
                      <p className="text-xs text-[var(--text-muted)]">Level {s.modules.levels.name}</p>
                    )}
                  </div>
                  <span className="col-span-3 text-sm text-[var(--text-secondary)]">{date}</span>
                  <span className="col-span-2 text-sm text-[var(--text-secondary)] text-center tabular-nums">{s.total_cards}</span>
                  <span className="col-span-2 text-right">
                    <span className={`text-xs font-bold px-2.5 py-1 rounded-full ${acc >= 70 ? 'bg-[var(--green-light)] text-[var(--green)]' : 'bg-[var(--amber-light)] text-[var(--amber)]'}`}>
                      {acc}%
                    </span>
                  </span>
                </div>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}