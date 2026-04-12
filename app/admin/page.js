import { createClient } from '@/lib/supabase/server'
import { Users, CreditCard, BookOpen, TrendingUp } from 'lucide-react'
import Card from '@/components/ui/Card'

export default async function AdminDashboard() {
  const supabase = await createClient()
  const today = new Date().toISOString().split('T')[0]

  const [
    { count: totalUsers },
    { count: totalCards },
    { count: todaySessions },
    { data: topModules },
  ] = await Promise.all([
    supabase.from('users').select('*', { count: 'exact', head: true }).eq('role', 'user'),
    supabase.from('cards').select('*', { count: 'exact', head: true }).eq('is_system', true),
    supabase.from('sessions').select('*', { count: 'exact', head: true }).gte('started_at', today),
    supabase.from('sessions')
      .select('module_id, modules(name, levels(name))')
      .not('module_id', 'is', null)
      .not('ended_at', 'is', null)
      .limit(100),
  ])

  // Count per module
  const modCount = {}
  topModules?.forEach(s => {
    const mid = s.module_id
    if (!modCount[mid]) modCount[mid] = { count: 0, name: s.modules?.name, level: s.modules?.levels?.name }
    modCount[mid].count++
  })
  const topList = Object.values(modCount).sort((a, b) => b.count - a.count).slice(0, 5)

  const metrics = [
    { label: 'Total User', value: totalUsers || 0, icon: Users, color: 'var(--accent)', bg: 'var(--accent-light)' },
    { label: 'Kartu Sistem', value: totalCards || 0, icon: CreditCard, color: 'var(--green)', bg: 'var(--green-light)' },
    { label: 'Sesi Hari Ini', value: todaySessions || 0, icon: TrendingUp, color: 'var(--amber)', bg: 'var(--amber-light)' },
    { label: 'Total Modul', value: 0, icon: BookOpen, color: '#8b5cf6', bg: '#f5f3ff' },
  ]

  return (
    <div className="page-enter space-y-6">
      <div>
        <h1 className="text-xl font-bold text-[var(--text-primary)]">Dashboard</h1>
        <p className="text-sm text-[var(--text-muted)] mt-0.5">Overview sistem EnglishAnki</p>
      </div>

      <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
        {metrics.map(({ label, value, icon: Icon, color, bg }) => (
          <Card key={label} className="p-4">
            <div className="w-9 h-9 rounded-[10px] flex items-center justify-center mb-3" style={{ background: bg }}>
              <Icon size={17} style={{ color }} />
            </div>
            <p className="text-2xl font-bold text-[var(--text-primary)]">{value}</p>
            <p className="text-xs text-[var(--text-muted)] mt-0.5">{label}</p>
          </Card>
        ))}
      </div>

      <div>
        <h2 className="text-sm font-semibold text-[var(--text-primary)] mb-3">Modul Terpopuler</h2>
        {topList.length === 0 ? (
          <p className="text-sm text-[var(--text-muted)]">Belum ada data sesi.</p>
        ) : (
          <Card className="divide-y divide-[var(--border)]">
            {topList.map((m, i) => (
              <div key={i} className="flex items-center justify-between px-4 py-3">
                <div className="flex items-center gap-3">
                  <span className="text-xs font-bold text-[var(--text-muted)] w-4">{i + 1}</span>
                  <div>
                    <p className="text-sm font-medium text-[var(--text-primary)]">{m.name}</p>
                    <p className="text-xs text-[var(--text-muted)]">Level {m.level}</p>
                  </div>
                </div>
                <span className="text-xs font-semibold bg-[var(--accent-light)] text-[var(--accent)] px-2.5 py-1 rounded-full">
                  {m.count} sesi
                </span>
              </div>
            ))}
          </Card>
        )}
      </div>
    </div>
  )
}
