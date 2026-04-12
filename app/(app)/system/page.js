import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import SystemClient from './SystemClient'

export default async function SystemPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: levels } = await supabase
    .from('levels')
    .select('id, name, label, order')
    .order('order')

  const { data: modules } = await supabase
    .from('modules')
    .select('id, level_id, name, description, total_cards, order')
    .order('order')

  // Get user progress per module (count cards reviewed)
  const { data: progress } = await supabase
    .from('user_card_progress')
    .select('card_id, cards(module_id)')
    .eq('user_id', user.id)
    .neq('status', 'new')

  // Build map: moduleId -> reviewedCount
  const reviewedMap = {}
  progress?.forEach(p => {
    const mid = p.cards?.module_id
    if (mid) reviewedMap[mid] = (reviewedMap[mid] || 0) + 1
  })

  return <SystemClient levels={levels || []} modules={modules || []} reviewedMap={reviewedMap} />
}
