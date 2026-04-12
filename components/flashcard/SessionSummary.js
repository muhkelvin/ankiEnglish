'use client'
import { CheckCircle } from 'lucide-react'
import Button from '@/components/ui/Button'

export default function SessionSummary({ counts, total, onHome }) {
  const correct = counts.good + counts.easy
  const accuracy = total > 0 ? Math.round((correct / total) * 100) : 0

  return (
    <div className="min-h-dvh flex flex-col items-center justify-center px-4 page-enter">
      <div className="w-full max-w-sm text-center">
        <div className="w-16 h-16 bg-[var(--green-light)] rounded-full flex items-center justify-center mx-auto mb-5">
          <CheckCircle size={32} className="text-[var(--green)]" />
        </div>

        <h2 className="text-2xl font-bold text-[var(--text-primary)] mb-1">Sesi Selesai!</h2>
        <p className="text-sm text-[var(--text-muted)] mb-8">Kerja bagus, terus konsisten ya 💪</p>

        {/* Stats */}
        <div className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-5 mb-6 shadow-[var(--shadow-sm)]">
          <div className="grid grid-cols-2 gap-4 mb-4">
            <div className="text-center">
              <p className="text-3xl font-bold text-[var(--text-primary)]">{total}</p>
              <p className="text-xs text-[var(--text-muted)] mt-0.5">Total kartu</p>
            </div>
            <div className="text-center">
              <p className="text-3xl font-bold text-[var(--green)]">{accuracy}%</p>
              <p className="text-xs text-[var(--text-muted)] mt-0.5">Akurasi</p>
            </div>
          </div>

          <div className="grid grid-cols-4 gap-2">
            {[
              { key: 'again', label: 'Again', color: 'var(--red)', bg: 'var(--red-light)' },
              { key: 'hard', label: 'Hard', color: 'var(--amber)', bg: 'var(--amber-light)' },
              { key: 'good', label: 'Good', color: 'var(--green)', bg: 'var(--green-light)' },
              { key: 'easy', label: 'Easy', color: 'var(--accent)', bg: 'var(--accent-light)' },
            ].map(({ key, label, color, bg }) => (
              <div key={key} className="text-center py-2 rounded-[8px]" style={{ background: bg }}>
                <p className="text-lg font-bold" style={{ color }}>{counts[key]}</p>
                <p className="text-[10px]" style={{ color, opacity: 0.8 }}>{label}</p>
              </div>
            ))}
          </div>
        </div>

        <Button onClick={onHome} fullWidth size="lg">
          Kembali ke Home
        </Button>
      </div>
    </div>
  )
}
