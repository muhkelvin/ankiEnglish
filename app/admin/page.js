import { createClient } from '@/lib/supabase/server'
import { Users, CreditCard, BookOpen, TrendingUp } from 'lucide-react'

export default async function AdminDashboard() {
  const supabase = await createClient()
  const today = new Date().toISOString().split('T')[0]

  const [
    { count: totalUsers },
    { count: totalCards },
    { count: todaySessions },
    { data: modules },
    { data: topModules },
  ] = await Promise.all([
    supabase.from('users').select('*', { count: 'exact', head: true }).eq('role', 'user'),
    supabase.from('cards').select('*', { count: 'exact', head: true }).eq('is_system', true),
    supabase.from('sessions').select('*', { count: 'exact', head: true }).gte('started_at', today),
    supabase.from('modules').select('*', { count: 'exact', head: true }),
    supabase.from('sessions')
      .select('module_id, modules(name, levels(name))')
      .not('module_id', 'is', null)
      .not('ended_at', 'is', null)
      .limit(100),
  ])

  const modCount = {}
  topModules?.forEach(s => {
    const mid = s.module_id
    if (!modCount[mid]) modCount[mid] = { count: 0, name: s.modules?.name, level: s.modules?.levels?.name }
    modCount[mid].count++
  })
  const topList = Object.values(modCount).sort((a, b) => b.count - a.count).slice(0, 5)

  const metrics = [
    { label: 'Total Pelajar', value: totalUsers || 0, icon: Users, color: 'var(--accent)', bg: 'var(--accent-light)' },
    { label: 'Kartu Sistem', value: totalCards || 0, icon: CreditCard, color: 'var(--green)', bg: 'var(--green-light)' },
    { label: 'Sesi Hari Ini', value: todaySessions || 0, icon: TrendingUp, color: 'var(--amber)', bg: 'var(--amber-light)' },
    { label: 'Total Modul', value: (modules?.length || 0), icon: BookOpen, color: 'var(--purple)', bg: 'var(--purple-light)' },
  ]

  return (
    <div className="page-enter space-y-8">
      <div className="page-header">
        <h1>Dashboard</h1>
        <p>Overview sistem EnglishAnki</p>
      </div>

      <div className="card-grid-2">
        {metrics.map(({ label, value, icon: Icon, color, bg }) => (
          <div key={label} className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-5 shadow-[var(--shadow-sm)]">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-9 h-9 rounded-[10px] flex items-center justify-center" style={{ background: bg }}>
                <Icon size={17} style={{ color }} />
              </div>
              <p className="text-sm text-[var(--text-muted)]">{label}</p>
            </div>
            <p className="text-3xl font-bold text-[var(--text-primary)] tracking-tight">{value}</p>
          </div>
        ))}
      </div>

      <div>
        <p className="text-xs font-semibold text-[var(--text-muted)] uppercase tracking-widest mb-4">Modul Terpopuler</p>
        {topList.length === 0 ? (
          <p className="text-sm text-[var(--text-muted)]">Belum ada data sesi.</p>
        ) : (
          <div className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] shadow-[var(--shadow-sm)] overflow-hidden">
            {topList.map((m, i) => (
              <div key={i} className={`flex items-center justify-between px-5 py-4 ${i < topList.length - 1 ? 'border-b border-[var(--border)]' : ''}`}>
                <div className="flex items-center gap-4">
                  <span className="text-sm font-bold text-[var(--text-muted)] w-5 tabular-nums">{i + 1}</span>
                  <div>
                    <p className="text-sm font-semibold text-[var(--text-primary)]">{m.name}</p>
                    <p className="text-xs text-[var(--text-muted)]">Level {m.level}</p>
                  </div>
                </div>
                <span className="text-xs font-semibold bg-[var(--accent-light)] text-[var(--accent)] px-2.5 py-1 rounded-full border border-[var(--accent-muted)]">
                  {m.count} sesi
                </span>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}
