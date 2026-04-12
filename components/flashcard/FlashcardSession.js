'use client'
import { useState, useCallback } from 'react'
import { useRouter } from 'next/navigation'
import { X } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import { calculateNextSRS, getIntervalLabel, insertAgainCard, RATING } from '@/lib/srs'
import FlashcardView from './FlashcardView'
import SessionSummary from './SessionSummary'

const BATCH = 20
const EXTEND = 10

export default function FlashcardSession({ cards: initial, userId, moduleId, sessionTitle }) {
  const router = useRouter()
  const [queue, setQueue] = useState(() => shuffle([...initial]).slice(0, BATCH))
  const [index, setIndex] = useState(0)
  const [ratings, setRatings] = useState([]) // { cardId, rating }
  const [counts, setCounts] = useState({ again: 0, hard: 0, good: 0, easy: 0 })
  const [sessionId, setSessionId] = useState(null)
  const [phase, setPhase] = useState('session') // 'session' | 'confirm' | 'summary'
  const [loading, setLoading] = useState(false)
  const [streakDots, setStreakDots] = useState([]) // 'good' | 'bad' | null

  const supabase = createClient()

  // Create session on first rating
  async function ensureSession() {
    if (sessionId) return sessionId
    const { data } = await supabase
      .from('sessions')
      .insert({ user_id: userId, module_id: moduleId })
      .select('id')
      .single()
    setSessionId(data.id)
    return data.id
  }

  const handleRating = useCallback(async (card, rating) => {
    setLoading(true)
    const sid = await ensureSession()

    // Update SRS progress
    const next = calculateNextSRS(card.progress || {}, rating)
    await supabase.from('user_card_progress').upsert({
      user_id: userId,
      card_id: card.id,
      ...next,
      last_reviewed: new Date().toISOString(),
    }, { onConflict: 'user_id,card_id' })

    // Log session card
    await supabase.from('session_cards').insert({
      session_id: sid,
      card_id: card.id,
      rating,
    })

    const newRatings = [...ratings, { cardId: card.id, rating }]
    const newCounts = { ...counts, [rating]: counts[rating] + 1 }
    const dot = (rating === RATING.AGAIN || rating === RATING.HARD) ? 'bad' : 'good'
    setRatings(newRatings)
    setCounts(newCounts)
    setStreakDots(p => [...p, dot])

    if (rating === RATING.AGAIN) {
      const newQueue = insertAgainCard(queue, index, { ...card, progress: { ...card.progress, ...next } })
      setQueue(newQueue)
      setIndex(i => i + 1)
    } else {
      setIndex(i => i + 1)
    }

    // Check if reached batch boundary
    const nextIndex = index + 1
    if (nextIndex >= queue.length && nextIndex % BATCH === 0) {
      setPhase('confirm')
    }

    setLoading(false)
  }, [index, queue, ratings, counts, sessionId, userId, moduleId])

  async function handleExtend() {
    // fetch more cards — for simplicity add more from remaining
    setPhase('session')
  }

  async function finishSession() {
    if (sessionId) {
      await supabase.from('sessions').update({
        ended_at: new Date().toISOString(),
        total_cards: ratings.length,
        count_again: counts.again,
        count_hard: counts.hard,
        count_good: counts.good,
        count_easy: counts.easy,
      }).eq('id', sessionId)
    }
    setPhase('summary')
  }

  if (phase === 'summary') {
    return <SessionSummary counts={counts} total={ratings.length} onHome={() => router.push('/')} />
  }

  if (phase === 'confirm') {
    return (
      <div className="min-h-dvh flex flex-col items-center justify-center px-4">
        <div className="w-full max-w-sm text-center page-enter">
          <div className="text-4xl mb-4">🎉</div>
          <h2 className="text-xl font-bold text-[var(--text-primary)] mb-2">
            {ratings.length} kartu selesai!
          </h2>
          <p className="text-sm text-[var(--text-muted)] mb-8">
            Mau lanjut {EXTEND} kartu lagi, atau cukup untuk hari ini?
          </p>
          <div className="flex flex-col gap-3">
            <button
              onClick={handleExtend}
              className="w-full bg-[var(--accent)] text-white py-3 rounded-[var(--radius)] text-sm font-semibold hover:bg-[var(--accent-hover)] transition-all"
            >
              Lanjut {EXTEND} kartu lagi 🔥
            </button>
            <button
              onClick={finishSession}
              className="w-full bg-[var(--surface)] text-[var(--text-secondary)] border border-[var(--border)] py-3 rounded-[var(--radius)] text-sm font-medium hover:bg-[var(--surface-2)] transition-all"
            >
              Cukup untuk hari ini
            </button>
          </div>
        </div>
      </div>
    )
  }

  const currentCard = queue[index]
  if (!currentCard) {
    finishSession()
    return null
  }

  const progress = ((index) / queue.length) * 100

  return (
    <div className="min-h-dvh flex flex-col bg-[var(--bg)]">
      {/* Header */}
      <div className="max-w-lg mx-auto w-full px-4 pt-4 pb-2">
        <div className="flex items-center justify-between mb-3">
          <p className="text-xs text-[var(--text-muted)] font-medium truncate">{sessionTitle}</p>
          <div className="flex items-center gap-3">
            <span className="text-xs font-semibold text-[var(--text-secondary)]">
              {index + 1} / {queue.length}
            </span>
            <button
              onClick={finishSession}
              className="p-1.5 rounded-[6px] text-[var(--text-muted)] hover:bg-[var(--surface-2)] transition-all"
            >
              <X size={15} />
            </button>
          </div>
        </div>

        {/* Progress bar */}
        <div className="h-1.5 bg-[var(--surface-2)] rounded-full overflow-hidden">
          <div
            className="h-full bg-[var(--accent)] rounded-full transition-all duration-500"
            style={{ width: `${progress}%` }}
          />
        </div>

        {/* Streak dots */}
        <div className="flex gap-1 mt-3 flex-wrap">
          {Array.from({ length: Math.min(queue.length, 20) }).map((_, i) => (
            <div
              key={i}
              className={`streak-dot ${i < streakDots.length ? streakDots[i] : ''} ${i === index ? 'active' : ''}`}
            />
          ))}
        </div>

        {/* Counters */}
        <div className="flex gap-3 mt-3">
          {[
            { key: 'again', label: 'Again', color: 'var(--red)' },
            { key: 'hard', label: 'Hard', color: 'var(--amber)' },
            { key: 'good', label: 'Good', color: 'var(--green)' },
            { key: 'easy', label: 'Easy', color: 'var(--accent)' },
          ].map(({ key, label, color }) => (
            <div key={key} className="flex items-center gap-1">
              <span className="text-xs font-bold" style={{ color }}>{counts[key]}</span>
              <span className="text-[10px] text-[var(--text-muted)]">{label}</span>
            </div>
          ))}
        </div>
      </div>

      {/* Card */}
      <div className="flex-1 max-w-lg mx-auto w-full px-4 py-4">
        <FlashcardView
          key={currentCard.id + index}
          card={currentCard}
          onRate={(rating) => handleRating(currentCard, rating)}
          loading={loading}
        />
      </div>
    </div>
  )
}

function shuffle(arr) {
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]]
  }
  return arr
}
