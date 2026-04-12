'use client'
import { useState } from 'react'
import { Plus, Pencil, Trash2, Check, X } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import Card from '@/components/ui/Card'
import Button from '@/components/ui/Button'
import Badge from '@/components/ui/Badge'

export default function LevelsClient({ initialLevels, moduleCount }) {
  const [levels, setLevels] = useState(initialLevels)
  const [showForm, setShowForm] = useState(false)
  const [editId, setEditId] = useState(null)
  const [form, setForm] = useState({ name: '', label: '', order: '' })
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const supabase = createClient()

  function openNew() {
    setEditId(null)
    setForm({ name: '', label: '', order: String(levels.length + 1) })
    setError('')
    setShowForm(true)
  }

  function openEdit(level) {
    setEditId(level.id)
    setForm({ name: level.name, label: level.label, order: String(level.order) })
    setError('')
    setShowForm(true)
  }

  function cancel() { setShowForm(false); setEditId(null); setError('') }

  async function handleSave() {
    if (!form.name.trim() || !form.label.trim()) { setError('Kode dan label wajib diisi.'); return }
    setLoading(true)
    if (editId) {
      const { data, error: err } = await supabase
        .from('levels')
        .update({ name: form.name.toUpperCase(), label: form.label, order: Number(form.order) })
        .eq('id', editId)
        .select()
        .single()
      if (err) { setError(err.message); setLoading(false); return }
      setLevels(p => p.map(l => l.id === editId ? data : l))
    } else {
      const { data, error: err } = await supabase
        .from('levels')
        .insert({ name: form.name.toUpperCase(), label: form.label, order: Number(form.order) })
        .select()
        .single()
      if (err) { setError(err.message); setLoading(false); return }
      setLevels(p => [...p, data].sort((a, b) => a.order - b.order))
    }
    setShowForm(false); setEditId(null)
    setLoading(false)
  }

  async function handleDelete(id) {
    if (!confirm('Hapus level ini? Semua modul di level ini juga akan terpengaruh.')) return
    await supabase.from('levels').delete().eq('id', id)
    setLevels(p => p.filter(l => l.id !== id))
  }

  return (
    <div className="page-enter space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-[var(--text-primary)]">Kelola Level</h1>
          <p className="text-sm text-[var(--text-muted)] mt-0.5">Atur level A1–B2 dan urutannya</p>
        </div>
        <Button size="sm" onClick={openNew}><Plus size={13} /> Tambah Level</Button>
      </div>

      {/* Inline form */}
      {showForm && (
        <Card className="p-4 page-enter">
          <p className="text-sm font-semibold text-[var(--text-primary)] mb-3">
            {editId ? 'Edit Level' : 'Level Baru'}
          </p>
          {error && <p className="text-xs text-[var(--red)] mb-3">{error}</p>}
          <div className="grid grid-cols-3 gap-3 mb-4">
            <div>
              <label className="text-xs font-medium text-[var(--text-muted)] block mb-1">Kode</label>
              <input
                value={form.name}
                onChange={e => setForm(p => ({ ...p, name: e.target.value }))}
                placeholder="A1"
                maxLength={3}
                className="w-full border border-[var(--border)] rounded-[8px] px-3 py-2 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)] uppercase"
              />
            </div>
            <div>
              <label className="text-xs font-medium text-[var(--text-muted)] block mb-1">Label</label>
              <input
                value={form.label}
                onChange={e => setForm(p => ({ ...p, label: e.target.value }))}
                placeholder="Beginner"
                className="w-full border border-[var(--border)] rounded-[8px] px-3 py-2 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)]"
              />
            </div>
            <div>
              <label className="text-xs font-medium text-[var(--text-muted)] block mb-1">Urutan</label>
              <input
                type="number"
                value={form.order}
                onChange={e => setForm(p => ({ ...p, order: e.target.value }))}
                min={1}
                className="w-full border border-[var(--border)] rounded-[8px] px-3 py-2 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)]"
              />
            </div>
          </div>
          <div className="flex gap-2">
            <Button size="sm" onClick={handleSave} loading={loading}>
              <Check size={12} /> Simpan
            </Button>
            <Button size="sm" variant="secondary" onClick={cancel}>
              <X size={12} /> Batal
            </Button>
          </div>
        </Card>
      )}

      {/* Levels table */}
      <Card className="divide-y divide-[var(--border)]">
        <div className="grid grid-cols-12 px-4 py-2.5 bg-[var(--surface-2)] rounded-t-[var(--radius)]">
          <span className="col-span-1 text-xs font-semibold text-[var(--text-muted)]">#</span>
          <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)]">Kode</span>
          <span className="col-span-4 text-xs font-semibold text-[var(--text-muted)]">Label</span>
          <span className="col-span-3 text-xs font-semibold text-[var(--text-muted)]">Modul</span>
          <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)]">Aksi</span>
        </div>
        {levels.length === 0 ? (
          <div className="py-10 text-center text-sm text-[var(--text-muted)]">Belum ada level.</div>
        ) : levels.map(level => (
          <div key={level.id} className="grid grid-cols-12 items-center px-4 py-3">
            <span className="col-span-1 text-xs text-[var(--text-muted)]">{level.order}</span>
            <span className="col-span-2">
              <Badge variant="blue">{level.name}</Badge>
            </span>
            <span className="col-span-4 text-sm text-[var(--text-primary)]">{level.label}</span>
            <span className="col-span-3 text-sm text-[var(--text-secondary)]">
              {moduleCount[level.id] || 0} modul
            </span>
            <div className="col-span-2 flex gap-1">
              <button onClick={() => openEdit(level)}
                className="p-1.5 rounded-[6px] text-[var(--text-muted)] hover:bg-[var(--surface-2)] hover:text-[var(--accent)] transition-all">
                <Pencil size={13} />
              </button>
              <button onClick={() => handleDelete(level.id)}
                className="p-1.5 rounded-[6px] text-[var(--text-muted)] hover:bg-[var(--red-light)] hover:text-[var(--red)] transition-all">
                <Trash2 size={13} />
              </button>
            </div>
          </div>
        ))}
      </Card>
    </div>
  )
}
