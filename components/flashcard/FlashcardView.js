'use client'
import { useState } from 'react'
import { clsx } from 'clsx'
import { getIntervalLabel, RATING } from '@/lib/srs'

const RATINGS = [
  { key: RATING.AGAIN, label: 'Again', color: 'border-[var(--red)] text-[var(--red)] hover:bg-[var(--red-light)]' },
  { key: RATING.HARD, label: 'Hard', color: 'border-[var(--amber)] text-[var(--amber)] hover:bg-[var(--amber-light)]' },
  { key: RATING.GOOD, label: 'Good', color: 'border-[var(--green)] text-[var(--green)] hover:bg-[var(--green-light)]' },
  { key: RATING.EASY, label: 'Easy', color: 'border-[var(--accent)] text-[var(--accent)] hover:bg-[var(--accent-light)]' },
]

export default function FlashcardView({ card, onRate, loading }) {
  const [flipped, setFlipped] = useState(false)
  const [selected, setSelected] = useState(null) // for MC

  const isMultipleChoice = card.type === 'multiple_choice' && card.options
  const options = isMultipleChoice ? JSON.parse(card.options) : []

  function handleFlip() {
    if (!isMultipleChoice) setFlipped(true)
  }

  function handleOptionSelect(idx) {
    if (selected !== null) return
    setSelected(idx)
    setFlipped(true)
  }

  function handleRate(rating) {
    if (loading) return
    onRate(rating)
  }

  return (
    <div className="flex flex-col gap-4 h-full">
      {/* The Card */}
      <div className="flip-card flex-1 min-h-64">
        <div className={clsx('flip-inner w-full h-full min-h-64', flipped && 'flipped')}>
          {/* Front */}
          <div className="flip-front absolute inset-0 bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] shadow-[var(--shadow)] p-6 flex flex-col">
            <div className="flex items-center gap-2 mb-4">
              <span className={clsx(
                'text-[10px] font-semibold px-2 py-0.5 rounded-full',
                card.type === 'fill_blank' ? 'bg-blue-50 text-blue-600' :
                card.type === 'multiple_choice' ? 'bg-purple-50 text-purple-600' :
                'bg-orange-50 text-orange-600'
              )}>
                {card.type === 'fill_blank' ? 'Fill in Blank' :
                 card.type === 'multiple_choice' ? 'Pilihan Ganda' : 'Error Correction'}
              </span>
            </div>

            <div className="flex-1 flex items-center justify-center">
              <p className="text-lg font-medium text-[var(--text-primary)] text-center leading-relaxed">
                {card.question}
              </p>
            </div>

            {/* MC Options */}
            {isMultipleChoice && (
              <div className="grid grid-cols-2 gap-2 mt-4">
                {options.map((opt, i) => (
                  <button
                    key={i}
                    onClick={() => handleOptionSelect(i)}
                    disabled={selected !== null}
                    className={clsx(
                      'py-2.5 px-3 rounded-[10px] text-sm font-medium border transition-all text-left',
                      selected === null
                        ? 'border-[var(--border)] text-[var(--text-primary)] hover:border-[var(--accent)] hover:bg-[var(--accent-light)]'
                        : selected === i
                          ? i === card.correct_index
                            ? 'border-[var(--green)] bg-[var(--green-light)] text-[var(--green)]'
                            : 'border-[var(--red)] bg-[var(--red-light)] text-[var(--red)]'
                          : i === card.correct_index
                            ? 'border-[var(--green)] bg-[var(--green-light)] text-[var(--green)]'
                            : 'border-[var(--border)] text-[var(--text-muted)] opacity-60'
                    )}
                  >
                    <span className="text-[10px] font-bold opacity-50 mr-1">{String.fromCharCode(65 + i)}.</span>
                    {opt}
                  </button>
                ))}
              </div>
            )}

            {/* Flip button for non-MC */}
            {!isMultipleChoice && !flipped && (
              <button
                onClick={handleFlip}
                className="mt-4 w-full py-2.5 border-2 border-dashed border-[var(--border)] rounded-[10px] text-sm text-[var(--text-muted)] font-medium hover:border-[var(--accent)] hover:text-[var(--accent)] transition-all"
              >
                Lihat Jawaban
              </button>
            )}
          </div>

          {/* Back */}
          <div className="flip-back absolute inset-0 bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] shadow-[var(--shadow)] p-6 flex flex-col">
            <div className="flex items-center gap-2 mb-4">
              <span className="text-[10px] font-semibold px-2 py-0.5 rounded-full bg-[var(--green-light)] text-[var(--green)]">
                Jawaban
              </span>
            </div>
            <div className="flex-1 flex items-center justify-center">
              <p className="text-base text-[var(--text-primary)] text-center leading-relaxed">
                {card.answer}
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Rating buttons — shown after flip */}
      {flipped && (
        <div className="grid grid-cols-4 gap-2 page-enter">
          {RATINGS.map(({ key, label, color }) => {
            const interval = getIntervalLabel(card.progress || {}, key)
            return (
              <button
                key={key}
                onClick={() => handleRate(key)}
                disabled={loading}
                className={clsx(
                  'flex flex-col items-center py-2.5 px-2 rounded-[10px] border-2 text-xs font-semibold transition-all btn-press disabled:opacity-50',
                  color
                )}
              >
                <span>{label}</span>
                <span className="text-[10px] font-normal opacity-70 mt-0.5">{interval}</span>
              </button>
            )
          })}
        </div>
      )}
    </div>
  )
}
