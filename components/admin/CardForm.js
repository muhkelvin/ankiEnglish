'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import Button from '@/components/ui/Button'
import Input from '@/components/ui/Input'
import { Plus, Trash2 } from 'lucide-react'

const TYPES = [
  { value: 'fill_blank', label: 'Fill in the Blank' },
  { value: 'multiple_choice', label: 'Pilihan Ganda' },
  { value: 'error_correction', label: 'Error Correction' },
]

export default function CardForm({ card, modules }) {
  const router = useRouter()
  const [form, setForm] = useState({
    module_id: card?.module_id || '',
    type: card?.type || 'fill_blank',
    question: card?.question || '',
    answer: card?.answer || '',
    options: card?.options ? JSON.parse(card.options) : ['', '', '', ''],
    correct_index: card?.correct_index ?? 0,
  })
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  function set(key) { return v => setForm(p => ({ ...p, [key]: v })) }

  async function handleSubmit(e) {
    e.preventDefault()
    if (!form.module_id || !form.question.trim() || !form.answer.trim()) {
      setError('Modul, pertanyaan, dan jawaban wajib diisi.')
      return
    }
    setLoading(true)
    const supabase = createClient()

    const payload = {
      module_id: form.module_id,
      type: form.type,
      question: form.question,
      answer: form.answer,
      is_system: true,
      options: form.type === 'multiple_choice' ? JSON.stringify(form.options.filter(Boolean)) : null,
      correct_index: form.type === 'multiple_choice' ? form.correct_index : null,
    }

    if (card) {
      await supabase.from('cards').update({ ...payload, updated_at: new Date().toISOString() }).eq('id', card.id)
    } else {
      await supabase.from('cards').insert(payload)
    }
    router.push('/admin/cards')
    router.refresh()
  }

  // Group modules by level
  const grouped = modules.reduce((acc, m) => {
    const lvl = m.levels?.name || 'Lainnya'
    if (!acc[lvl]) acc[lvl] = []
    acc[lvl].push(m)
    return acc
  }, {})

  return (
    <div className="page-enter max-w-xl">
      <div className="mb-6">
        <h1 className="text-xl font-bold text-[var(--text-primary)]">{card ? 'Edit Kartu' : 'Tambah Kartu'}</h1>
        <p className="text-sm text-[var(--text-muted)] mt-0.5">Isi semua field yang diperlukan</p>
      </div>

      {error && (
        <div className="mb-4 px-3.5 py-2.5 bg-[var(--red-light)] border border-red-100 rounded-[10px]">
          <p className="text-xs text-[var(--red)]">{error}</p>
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        {/* Module */}
        <div>
          <label className="text-sm font-medium text-[var(--text-primary)] block mb-1.5">Modul</label>
          <select
            value={form.module_id}
            onChange={e => set('module_id')(e.target.value)}
            className="w-full border border-[var(--border)] rounded-[10px] px-3.5 py-2.5 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)] focus:ring-2 focus:ring-[var(--accent)]/10"
          >
            <option value="">Pilih modul...</option>
            {Object.entries(grouped).map(([lvl, mods]) => (
              <optgroup key={lvl} label={lvl}>
                {mods.map(m => <option key={m.id} value={m.id}>{m.name}</option>)}
              </optgroup>
            ))}
          </select>
        </div>

        {/* Type */}
        <div>
          <label className="text-sm font-medium text-[var(--text-primary)] block mb-1.5">Tipe Kartu</label>
          <div className="flex gap-2">
            {TYPES.map(t => (
              <button
                key={t.value}
                type="button"
                onClick={() => set('type')(t.value)}
                className={`flex-1 text-xs py-2 rounded-[8px] border font-medium transition-all ${
                  form.type === t.value
                    ? 'bg-[var(--accent)] text-white border-[var(--accent)]'
                    : 'border-[var(--border)] text-[var(--text-secondary)] hover:border-[var(--border-hover)]'
                }`}
              >
                {t.label}
              </button>
            ))}
          </div>
        </div>

        <Input
          label="Pertanyaan / Depan Kartu"
          value={form.question}
          onChange={e => set('question')(e.target.value)}
          placeholder={form.type === 'fill_blank' ? 'She ___ a student.' : form.type === 'error_correction' ? 'We is friends. — Apa yang salah?' : 'Pilih jawaban yang benar:'}
        />

        <div>
          <label className="text-sm font-medium text-[var(--text-primary)] block mb-1.5">Jawaban / Belakang Kartu</label>
          <textarea
            value={form.answer}
            onChange={e => set('answer')(e.target.value)}
            rows={3}
            placeholder="Jawaban lengkap + penjelasan singkat"
            className="w-full border border-[var(--border)] rounded-[10px] px-3.5 py-2.5 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)] focus:ring-2 focus:ring-[var(--accent)]/10 resize-none"
          />
        </div>

        {/* MC Options */}
        {form.type === 'multiple_choice' && (
          <div>
            <label className="text-sm font-medium text-[var(--text-primary)] block mb-2">
              Opsi Jawaban <span className="text-[var(--text-muted)] font-normal">(klik radio = jawaban benar)</span>
            </label>
            <div className="space-y-2">
              {form.options.map((opt, i) => (
                <div key={i} className="flex items-center gap-2">
                  <input
                    type="radio"
                    name="correct"
                    checked={form.correct_index === i}
                    onChange={() => set('correct_index')(i)}
                    className="accent-[var(--green)]"
                  />
                  <input
                    type="text"
                    value={opt}
                    onChange={e => {
                      const o = [...form.options]
                      o[i] = e.target.value
                      set('options')(o)
                    }}
                    placeholder={`Opsi ${String.fromCharCode(65 + i)}`}
                    className="flex-1 border border-[var(--border)] rounded-[8px] px-3 py-2 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)]"
                  />
                </div>
              ))}
            </div>
          </div>
        )}

        <div className="flex gap-3 pt-2">
          <Button type="submit" loading={loading}>
            {card ? 'Simpan Perubahan' : 'Tambah Kartu'}
          </Button>
          <Button type="button" variant="secondary" onClick={() => router.back()}>Batal</Button>
        </div>
      </form>
    </div>
  )
}
