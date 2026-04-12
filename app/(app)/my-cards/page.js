import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import MyCardsClient from './MyCardsClient'

export default async function MyCardsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: cards } = await supabase
    .from('cards')
    .select('*')
    .eq('user_id', user.id)
    .eq('is_system', false)
    .order('created_at', { ascending: false })

  return <MyCardsClient initialCards={cards || []} userId={user.id} />
}
