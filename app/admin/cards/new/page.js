import { createClient } from '@/lib/supabase/server'
import CardForm from '@/components/admin/CardForm'

export default async function NewCardPage() {
  const supabase = await createClient()
  const { data: modules } = await supabase
    .from('modules')
    .select('id, name, level_id, levels(name)')
    .order('order')
  return <CardForm modules={modules || []} />
}
