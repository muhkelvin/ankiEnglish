/**
 * SRS (Spaced Repetition System) calculations
 * Based on SM-2 algorithm — same as Anki
 */

export const RATING = {
  AGAIN: 'again',
  HARD: 'hard',
  GOOD: 'good',
  EASY: 'easy',
}

export const DEFAULT_EASE = 2.5
export const MIN_EASE = 1.3

/**
 * Calculate next interval and ease factor after a rating
 */
export function calculateNextSRS(current, rating) {
  let { interval_days, ease_factor, repetition_count } = current

  ease_factor = ease_factor ?? DEFAULT_EASE
  interval_days = interval_days ?? 0
  repetition_count = repetition_count ?? 0

  let newInterval
  let newEase = ease_factor
  let newStatus = 'learning'

  switch (rating) {
    case RATING.AGAIN:
      newInterval = 0
      newEase = Math.max(MIN_EASE, ease_factor - 0.2)
      newStatus = interval_days > 0 ? 'learning' : 'new'
      break

    case RATING.HARD:
      newInterval = Math.max(1, Math.floor(interval_days * ease_factor * 0.8))
      newEase = Math.max(MIN_EASE, ease_factor - 0.15)
      newStatus = 'review'
      break

    case RATING.GOOD:
      if (repetition_count === 0) {
        newInterval = 3
      } else {
        newInterval = Math.floor(interval_days * ease_factor)
      }
      newStatus = 'review'
      break

    case RATING.EASY:
      if (repetition_count === 0) {
        newInterval = 7
      } else {
        newInterval = Math.floor(interval_days * ease_factor * 1.3)
      }
      newEase = ease_factor + 0.15
      newStatus = 'review'
      break
  }

  const dueDate = new Date()
  dueDate.setDate(dueDate.getDate() + newInterval)

  return {
    interval_days: newInterval,
    ease_factor: newEase,
    repetition_count: rating === RATING.AGAIN ? repetition_count : repetition_count + 1,
    due_date: dueDate.toISOString().split('T')[0],
    status: newStatus,
  }
}

/**
 * Get human-readable interval label for rating buttons
 */
export function getIntervalLabel(current, rating) {
  const result = calculateNextSRS(current, rating)
  const days = result.interval_days

  if (days === 0) return '< 1 menit'
  if (days === 1) return '1 hari'
  if (days < 7) return `${days} hari`
  if (days < 30) return `${Math.round(days / 7)} minggu`
  return `${Math.round(days / 30)} bulan`
}

/**
 * Insert "again" card back into queue at position +3 to +5
 */
export function insertAgainCard(queue, currentIndex, card) {
  const offset = Math.floor(Math.random() * 3) + 3 // 3–5
  const insertAt = Math.min(currentIndex + offset, queue.length)
  const newQueue = [...queue]
  newQueue.splice(insertAt, 0, card)
  return newQueue
}
