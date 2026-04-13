'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Plus, Pencil, Trash2, Play, X } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import Button from '@/components/ui/Button'
import Input from '@/components/ui/Input'

export default function MyCardsClient({ initialCards, userId }) {
  const router = useRouter()
  const [cards, setCards] = useState(initialCards)
  const [showForm, setShowForm] = useState(false)
  const [editCard, setEditCard] = useState(null)
  const [form, setForm] = useState({ front: '', back: '', category: '' })
  const [loading, setLoading] = useState(false)
  const supabase = createClient()

  function openNew() {
    setEditCard(null)
    setForm({ front: '', back: '', category: '' })
    setShowForm(true)
  }

  function openEdit(card) {
    setEditCard(card)
    setForm({ front: card.question, back: card.answer, category: card.category || '' })
    setShowForm(true)
  }

  async function handleSave() {
    if (!form.front.trim() || !form.back.trim()) return
    setLoading(true)
    if (editCard) {
      const { data } = await supabase
        .from('cards')
        .update({ question: form.front, answer: form.back, category: form.category || null, updated_at: new Date().toISOString() })
        .eq('id', editCard.id)
        .select()
        .single()
      setCards(p => p.map(c => c.id === editCard.id ? data : c))
    } else {
      const { data } = await supabase
        .from('cards')
        .insert({ user_id: userId, question: form.front, answer: form.back, category: form.category || null, type: 'fill_blank', is_system: false })
        .select()
        .single()
      setCards(p => [data, ...p])
    }
    setShowForm(false)
    setLoading(false)
  }

  async function handleDelete(id) {
    if (!confirm('Hapus kartu ini?')) return
    await supabase.from('cards').delete().eq('id', id)
    setCards(p => p.filter(c => c.id !== id))
  }

  return (
    <div className="page-enter space-y-8">
      {/* Page header */}
      <div className="page-header">
        <div className="flex items-start justify-between gap-4">
          <div>
            <h1>Kartu Saya</h1>
            <p>{cards.length} kartu tersimpan</p>
          </div>
          <div className="flex gap-2 flex-shrink-0 mt-1">
            {cards.length > 0 && (
              <Button variant="secondary" size="sm" onClick={() => router.push('/flashcard?ownCards=1')}>
                <Play size={13} /> Mulai Sesi
              </Button>
            )}
            <Button size="sm" onClick={openNew}>
              <Plus size={13} /> Tambah
            </Button>
          </div>
        </div>
      </div>

      {/* Form */}
      {showForm && (
        <div className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-5 shadow-[var(--shadow)] page-enter">
          <div className="flex items-center justify-between mb-4">
            <p className="text-base font-semibold text-[var(--text-primary)]">
              {editCard ? 'Edit Kartu' : 'Kartu Baru'}
            </p>
            <button onClick={() => setShowForm(false)} className="p-1.5 rounded-[8px] text-[var(--text-muted)] hover:bg-[var(--surface-2)] transition-all">
              <X size={16} />
            </button>
          </div>
          <div className="flex flex-col gap-4">
            <Input
              label="Depan (pertanyaan)"
              placeholder="Tulis pertanyaan atau kalimat..."
              value={form.front}
              onChange={e => setForm(p => ({ ...p, front: e.target.value }))}
            />
            <div>
              <label className="text-sm font-medium text-[var(--text-primary)] block mb-1.5">Belakang (jawaban)</label>
              <textarea
                value={form.back}
                onChange={e => setForm(p => ({ ...p, back: e.target.value }))}
                placeholder="Tulis jawaban atau penjelasan..."
                rows={3}
                className="w-full bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius-sm)] px-3.5 py-2.5 text-sm text-[var(--text-primary)] placeholder:text-[var(--text-muted)] focus:outline-none focus:border-[var(--accent)] focus:ring-2 focus:ring-[var(--accent)]/10 transition-all resize-none"
              />
            </div>
            <Input
              label="Kategori (opsional)"
              placeholder="Contoh: Tenses, Vocabulary..."
              value={form.category}
              onChange={e => setForm(p => ({ ...p, category: e.target.value }))}
            />
            <div className="flex gap-2 pt-1">
              <Button onClick={handleSave} loading={loading} size="sm">Simpan</Button>
              <Button variant="secondary" size="sm" onClick={() => setShowForm(false)}>Batal</Button>
            </div>
          </div>
        </div>
      )}

      {/* Empty state */}
      {cards.length === 0 && !showForm ? (
        <div className="text-center py-20 bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)]">
          <div className="text-5xl mb-4">✏️</div>
          <p className="text-base font-semibold text-[var(--text-primary)] mb-1.5">Belum ada kartu</p>
          <p className="text-sm text-[var(--text-muted)] mb-5">Tambah kartu pertamamu sekarang</p>
          <Button size="sm" onClick={openNew}><Plus size={13} /> Tambah Kartu</Button>
        </div>
      ) : (
        <div className="my-cards-grid">
          {cards.map(card => (
            <div
              key={card.id}
              className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-4 shadow-[var(--shadow-sm)] group relative hover:border-[var(--border-hover)] transition-all"
            >
              <div className="flex items-start justify-between gap-3">
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-semibold text-[var(--text-primary)] line-clamp-2 mb-1">{card.question}</p>
                  <p className="text-xs text-[var(--text-muted)] line-clamp-2 leading-relaxed">{card.answer}</p>
                  {card.category && (
                    <span className="inline-block mt-2 text-[10px] font-medium px-2 py-0.5 bg-[var(--surface-2)] text-[var(--text-muted)] rounded-full border border-[var(--border)]">
                      {card.category}
                    </span>
                  )}
                </div>
                <div className="flex gap-1 flex-shrink-0 opacity-0 group-hover:opacity-100 transition-opacity">
                  <button
                    onClick={() => openEdit(card)}
                    className="p-1.5 rounded-[6px] text-[var(--text-muted)] hover:bg-[var(--surface-2)] hover:text-[var(--accent)] transition-all"
                  >
                    <Pencil size={13} />
                  </button>
                  <button
                    onClick={() => handleDelete(card.id)}
                    className="p-1.5 rounded-[6px] text-[var(--text-muted)] hover:bg-[var(--red-light)] hover:text-[var(--red)] transition-all"
                  >
                    <Trash2 size={13} />
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
