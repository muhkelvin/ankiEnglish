import { createClient } from '@/lib/supabase/server'
import { Users, BookOpen, TrendingUp } from 'lucide-react'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'

export default async function AdminUsersPage() {
  const supabase = await createClient()

  const { data: users } = await supabase
    .from('users')
    .select('id, name, email, role, created_at, last_active_at')
    .order('created_at', { ascending: false })

  // Sessions per user
  const { data: sessionData } = await supabase
    .from('sessions')
    .select('user_id, total_cards, count_good, count_easy')
    .not('ended_at', 'is', null)

  // Progress per user
  const { data: progressData } = await supabase
    .from('user_card_progress')
    .select('user_id')
    .neq('status', 'new')

  const statsMap = {}
  sessionData?.forEach(s => {
    if (!statsMap[s.user_id]) statsMap[s.user_id] = { sessions: 0, totalCards: 0, correct: 0 }
    statsMap[s.user_id].sessions++
    statsMap[s.user_id].totalCards += s.total_cards || 0
    statsMap[s.user_id].correct += (s.count_good || 0) + (s.count_easy || 0)
  })

  const reviewedMap = {}
  progressData?.forEach(p => {
    reviewedMap[p.user_id] = (reviewedMap[p.user_id] || 0) + 1
  })

  return (
    <div className="page-enter space-y-5">
      <div>
        <h1 className="text-xl font-bold text-[var(--text-primary)]">Statistik User</h1>
        <p className="text-sm text-[var(--text-muted)] mt-0.5">{users?.filter(u => u.role === 'user').length || 0} pelajar terdaftar</p>
      </div>

      <Card className="divide-y divide-[var(--border)]">
        {/* Header */}
        <div className="grid grid-cols-12 px-4 py-2.5 bg-[var(--surface-2)] rounded-t-[var(--radius)]">
          <span className="col-span-4 text-xs font-semibold text-[var(--text-muted)]">User</span>
          <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)]">Kartu</span>
          <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)]">Sesi</span>
          <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)]">Akurasi</span>
          <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)]">Terakhir</span>
        </div>

        {!users?.length ? (
          <div className="py-10 text-center text-sm text-[var(--text-muted)]">Belum ada user.</div>
        ) : users.map(user => {
          const s = statsMap[user.id] || { sessions: 0, totalCards: 0, correct: 0 }
          const accuracy = s.totalCards > 0 ? Math.round((s.correct / s.totalCards) * 100) : 0
          const lastActive = user.last_active_at
            ? new Date(user.last_active_at).toLocaleDateString('id-ID', { day: 'numeric', month: 'short' })
            : '—'

          return (
            <div key={user.id} className="grid grid-cols-12 items-center px-4 py-3">
              <div className="col-span-4 min-w-0">
                <div className="flex items-center gap-2">
                  <p className="text-sm font-medium text-[var(--text-primary)] truncate">{user.name}</p>
                  {user.role === 'admin' && <Badge variant="amber">Admin</Badge>}
                </div>
                <p className="text-xs text-[var(--text-muted)] truncate">{user.email}</p>
              </div>
              <span className="col-span-2 text-sm text-[var(--text-secondary)]">
                {reviewedMap[user.id] || 0}
              </span>
              <span className="col-span-2 text-sm text-[var(--text-secondary)]">
                {s.sessions}
              </span>
              <span className="col-span-2">
                {s.sessions > 0 ? (
                  <span className={`text-xs font-semibold px-2 py-0.5 rounded-full ${accuracy >= 70 ? 'bg-[var(--green-light)] text-[var(--green)]' : 'bg-[var(--amber-light)] text-[var(--amber)]'}`}>
                    {accuracy}%
                  </span>
                ) : <span className="text-xs text-[var(--text-muted)]">—</span>}
              </span>
              <span className="col-span-2 text-xs text-[var(--text-muted)]">{lastActive}</span>
            </div>
          )
        })}
      </Card>
    </div>
  )
}
