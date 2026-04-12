import { createClient } from '@/lib/supabase/server'
import ModulesClient from './ModulesClient'

export default async function AdminModulesPage() {
  const supabase = await createClient()
  const [{ data: levels }, { data: modules }] = await Promise.all([
    supabase.from('levels').select('id, name, label').order('order'),
    supabase.from('modules').select('id, level_id, name, description, total_cards, order, levels(name)').order('order'),
  ])
  return <ModulesClient initialModules={modules || []} levels={levels || []} />
}
