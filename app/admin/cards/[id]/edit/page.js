import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import CardForm from '@/components/admin/CardForm'

export default async function EditCardPage({ params }) {
  const { id } = await params
  const supabase = await createClient()
  const [{ data: card }, { data: modules }] = await Promise.all([
    supabase.from('cards').select('*').eq('id', id).single(),
    supabase.from('modules').select('id, name, level_id, levels(name)').order('order'),
  ])
  if (!card) notFound()
  return <CardForm card={card} modules={modules || []} />
}
