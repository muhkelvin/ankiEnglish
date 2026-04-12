import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import FlashcardSession from '@/components/flashcard/FlashcardSession'

export default async function FlashcardPage({ searchParams }) {
  const { moduleId, ownCards } = await searchParams
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  let cards = []
  let sessionTitle = ''

  if (ownCards === '1') {
    // User's own cards
    const { data } = await supabase
      .from('cards')
      .select('*')
      .eq('user_id', user.id)
      .eq('is_system', false)
    cards = data || []
    sessionTitle = 'Kartu Saya'
  } else if (moduleId) {
    // System cards for module
    const { data: mod } = await supabase
      .from('modules')
      .select('name, levels(name)')
      .eq('id', moduleId)
      .single()
    sessionTitle = mod ? `${mod.name} · ${mod.levels?.name}` : 'Modul'

    // Get all cards for this module
    const { data: allCards } = await supabase
      .from('cards')
      .select('*')
      .eq('module_id', moduleId)
      .eq('is_system', true)

    if (allCards) {
      const today = new Date().toISOString().split('T')[0]
      // Get progress for these cards
      const cardIds = allCards.map(c => c.id)
      const { data: progress } = await supabase
        .from('user_card_progress')
        .select('*')
        .eq('user_id', user.id)
        .in('card_id', cardIds)

      const progressMap = {}
      progress?.forEach(p => { progressMap[p.card_id] = p })

      // Separate review (due) vs new
      const dueCards = allCards.filter(c => {
        const p = progressMap[c.id]
        return p && p.status === 'review' && p.due_date <= today
      })
      const newCards = allCards.filter(c => !progressMap[c.id])

      // Build session: up to 10 review + 10 new = 20
      const sessionCards = [
        ...dueCards.slice(0, 10),
        ...newCards.slice(0, 10),
      ]

      // Attach progress to each card
      cards = sessionCards.map(c => ({
        ...c,
        progress: progressMap[c.id] || null,
      }))
    }
  }

  if (!cards.length) redirect(moduleId ? `/system` : '/my-cards')

  return (
    <FlashcardSession
      cards={cards}
      userId={user.id}
      moduleId={moduleId || null}
      sessionTitle={sessionTitle}
    />
  )
}
