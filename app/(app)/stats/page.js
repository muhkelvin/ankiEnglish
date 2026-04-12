import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { Flame, BookOpen, Target, Calendar } from 'lucide-react'
import Card from '@/components/ui/Card'

export default async function StatsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // Total cards reviewed
  const { count: totalReviewed } = await supabase
    .from('user_card_progress')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .neq('status', 'new')

  // Total sessions
  const { count: totalSessions } = await supabase
    .from('sessions')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .not('ended_at', 'is', null)

  // Accuracy from all sessions
  const { data: sessionStats } = await supabase
    .from('sessions')
    .select('total_cards, count_good, count_easy')
    .eq('user_id', user.id)
    .not('ended_at', 'is', null)

  const totalCards = sessionStats?.reduce((a, s) => a + (s.total_cards || 0), 0) || 0
  const totalCorrect = sessionStats?.reduce((a, s) => a + (s.count_good || 0) + (s.count_easy || 0), 0) || 0
  const accuracy = totalCards > 0 ? Math.round((totalCorrect / totalCards) * 100) : 0

  // Recent sessions (last 7)
  const { data: recentSessions } = await supabase
    .from('sessions')
    .select('id, started_at, total_cards, count_good, count_easy, modules(name, levels(name))')
    .eq('user_id', user.id)
    .not('ended_at', 'is', null)
    .order('started_at', { ascending: false })
    .limit(7)

  const stats = [
    { label: 'Kartu Dipelajari', value: totalReviewed || 0, icon: BookOpen, color: 'var(--accent)', bg: 'var(--accent-light)' },
    { label: 'Total Sesi', value: totalSessions || 0, icon: Calendar, color: 'var(--green)', bg: 'var(--green-light)' },
    { label: 'Akurasi', value: `${accuracy}%`, icon: Target, color: 'var(--amber)', bg: 'var(--amber-light)' },
  ]

  return (
    <div className="page-enter space-y-6">
      <div>
        <h2 className="text-lg font-semibold text-[var(--text-primary)]">Statistik</h2>
        <p className="text-sm text-[var(--text-muted)] mt-0.5">Perkembangan belajarmu</p>
      </div>

      {/* Stat cards */}
      <div className="grid grid-cols-3 gap-3">
        {stats.map(({ label, value, icon: Icon, color, bg }) => (
          <Card key={label} className="p-3 text-center">
            <div className="w-8 h-8 rounded-[8px] flex items-center justify-center mx-auto mb-2" style={{ background: bg }}>
              <Icon size={15} style={{ color }} />
            </div>
            <p className="text-xl font-bold text-[var(--text-primary)]">{value}</p>
            <p className="text-[10px] text-[var(--text-muted)] mt-0.5 leading-tight">{label}</p>
          </Card>
        ))}
      </div>

      {/* Recent sessions */}
      <div>
        <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-wider mb-3">Sesi Terakhir</p>
        {recentSessions?.length === 0 ? (
          <div className="text-center py-10 text-sm text-[var(--text-muted)]">Belum ada sesi</div>
        ) : (
          <div className="flex flex-col gap-2">
            {recentSessions?.map(s => {
              const acc = s.total_cards > 0 ? Math.round(((s.count_good + s.count_easy) / s.total_cards) * 100) : 0
              const date = new Date(s.started_at).toLocaleDateString('id-ID', { day: 'numeric', month: 'short' })
              return (
                <Card key={s.id} className="p-3.5">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm font-medium text-[var(--text-primary)]">
                        {s.modules?.name || 'Kartu Sendiri'}
                      </p>
                      <p className="text-xs text-[var(--text-muted)] mt-0.5">
                        {date} · {s.total_cards} kartu
                      </p>
                    </div>
                    <span className={`text-xs font-bold px-2.5 py-1 rounded-full ${acc >= 70 ? 'bg-[var(--green-light)] text-[var(--green)]' : 'bg-[var(--amber-light)] text-[var(--amber)]'}`}>
                      {acc}%
                    </span>
                  </div>
                </Card>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}
