import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import HomeClient from './HomeClient'

export default async function HomePage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('users')
    .select('name, role')
    .eq('id', user.id)
    .single()

  // Cards due today
  const today = new Date().toISOString().split('T')[0]
  const { count: dueCount } = await supabase
    .from('user_card_progress')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .lte('due_date', today)
    .eq('status', 'review')

  // Last session
  const { data: lastSession } = await supabase
    .from('sessions')
    .select('id, module_id, total_cards, count_good, count_easy, modules(name, levels(name))')
    .eq('user_id', user.id)
    .order('started_at', { ascending: false })
    .limit(1)
    .maybeSingle()

  return (
    <HomeClient
      profile={profile}
      dueCount={dueCount || 0}
      lastSession={lastSession}
    />
  )
}
