import { createClient } from '@/lib/supabase/server'
import LevelsClient from './LevelsClient'

export default async function AdminLevelsPage() {
  const supabase = await createClient()
  const { data: levels } = await supabase
    .from('levels')
    .select('id, name, label, order')
    .order('order')

  // Count modules per level
  const { data: modules } = await supabase
    .from('modules')
    .select('id, level_id')

  const moduleCount = {}
  modules?.forEach(m => {
    moduleCount[m.level_id] = (moduleCount[m.level_id] || 0) + 1
  })

  return <LevelsClient initialLevels={levels || []} moduleCount={moduleCount} />
}
