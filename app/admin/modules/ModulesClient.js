'use client'
import { useState } from 'react'
import { Plus, Pencil, Trash2, Check, X, ChevronDown } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import { clsx } from 'clsx'
import Card from '@/components/ui/Card'
import Button from '@/components/ui/Button'
import Badge from '@/components/ui/Badge'

const EMPTY_FORM = { level_id: '', name: '', description: '', order: '1' }

export default function ModulesClient({ initialModules, levels }) {
  const [modules, setModules] = useState(initialModules)
  const [showForm, setShowForm] = useState(false)
  const [editId, setEditId] = useState(null)
  const [form, setForm] = useState(EMPTY_FORM)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [filterLevel, setFilterLevel] = useState('')
  const supabase = createClient()

  const displayed = filterLevel ? modules.filter(m => m.level_id === filterLevel) : modules

  function openNew() {
    setEditId(null)
    setForm({ ...EMPTY_FORM, level_id: levels[0]?.id || '' })
    setError('')
    setShowForm(true)
  }

  function openEdit(mod) {
    setEditId(mod.id)
    setForm({ level_id: mod.level_id, name: mod.name, description: mod.description || '', order: String(mod.order) })
    setError('')
    setShowForm(true)
  }

  function cancel() { setShowForm(false); setEditId(null); setError('') }

  async function handleSave() {
    if (!form.level_id || !form.name.trim()) { setError('Level dan nama modul wajib diisi.'); return }
    setLoading(true)
    const payload = { level_id: form.level_id, name: form.name, description: form.description || null, order: Number(form.order) }

    if (editId) {
      const { data, error: err } = await supabase.from('modules').update(payload).eq('id', editId).select('*, levels(name)').single()
      if (err) { setError(err.message); setLoading(false); return }
      setModules(p => p.map(m => m.id === editId ? data : m))
    } else {
      const { data, error: err } = await supabase.from('modules').insert(payload).select('*, levels(name)').single()
      if (err) { setError(err.message); setLoading(false); return }
      setModules(p => [...p, data])
    }
    setShowForm(false); setEditId(null); setLoading(false)
  }

  async function handleDelete(id) {
    if (!confirm('Hapus modul ini? Semua kartu di modul ini juga akan terpengaruh.')) return
    await supabase.from('modules').delete().eq('id', id)
    setModules(p => p.filter(m => m.id !== id))
  }

  return (
    <div className="page-enter space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-[var(--text-primary)]">Kelola Modul</h1>
          <p className="text-sm text-[var(--text-muted)] mt-0.5">{modules.length} modul total</p>
        </div>
        <Button size="sm" onClick={openNew}><Plus size={13} /> Tambah Modul</Button>
      </div>

      {/* Filter */}
      <div className="flex gap-2 flex-wrap">
        <button
          onClick={() => setFilterLevel('')}
          className={clsx('px-3 py-1.5 rounded-full text-xs font-medium border transition-all',
            !filterLevel ? 'bg-[var(--accent)] text-white border-[var(--accent)]' : 'border-[var(--border)] text-[var(--text-secondary)] hover:border-[var(--border-hover)]'
          )}>Semua</button>
        {levels.map(l => (
          <button key={l.id}
            onClick={() => setFilterLevel(l.id)}
            className={clsx('px-3 py-1.5 rounded-full text-xs font-medium border transition-all',
              filterLevel === l.id ? 'bg-[var(--accent)] text-white border-[var(--accent)]' : 'border-[var(--border)] text-[var(--text-secondary)] hover:border-[var(--border-hover)]'
            )}>{l.name}</button>
        ))}
      </div>

      {/* Inline form */}
      {showForm && (
        <Card className="p-4 page-enter">
          <p className="text-sm font-semibold mb-3">{editId ? 'Edit Modul' : 'Modul Baru'}</p>
          {error && <p className="text-xs text-[var(--red)] mb-3">{error}</p>}
          <div className="grid grid-cols-2 gap-3 mb-3">
            <div>
              <label className="text-xs font-medium text-[var(--text-muted)] block mb-1">Level</label>
              <select value={form.level_id} onChange={e => setForm(p => ({ ...p, level_id: e.target.value }))}
                className="w-full border border-[var(--border)] rounded-[8px] px-3 py-2 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)]">
                <option value="">Pilih level</option>
                {levels.map(l => <option key={l.id} value={l.id}>{l.name} — {l.label}</option>)}
              </select>
            </div>
            <div>
              <label className="text-xs font-medium text-[var(--text-muted)] block mb-1">Urutan</label>
              <input type="number" value={form.order} onChange={e => setForm(p => ({ ...p, order: e.target.value }))} min={1}
                className="w-full border border-[var(--border)] rounded-[8px] px-3 py-2 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)]" />
            </div>
          </div>
          <div className="mb-3">
            <label className="text-xs font-medium text-[var(--text-muted)] block mb-1">Nama Modul</label>
            <input value={form.name} onChange={e => setForm(p => ({ ...p, name: e.target.value }))} placeholder="To Be, Simple Present..."
              className="w-full border border-[var(--border)] rounded-[8px] px-3 py-2 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)]" />
          </div>
          <div className="mb-4">
            <label className="text-xs font-medium text-[var(--text-muted)] block mb-1">Deskripsi (opsional)</label>
            <input value={form.description} onChange={e => setForm(p => ({ ...p, description: e.target.value }))} placeholder="is / am / are"
              className="w-full border border-[var(--border)] rounded-[8px] px-3 py-2 text-sm bg-[var(--surface)] focus:outline-none focus:border-[var(--accent)]" />
          </div>
          <div className="flex gap-2">
            <Button size="sm" onClick={handleSave} loading={loading}><Check size={12} /> Simpan</Button>
            <Button size="sm" variant="secondary" onClick={cancel}><X size={12} /> Batal</Button>
          </div>
        </Card>
      )}

      {/* Table */}
      <Card className="divide-y divide-[var(--border)]">
        <div className="grid grid-cols-12 px-4 py-2.5 bg-[var(--surface-2)] rounded-t-[var(--radius)]">
          <span className="col-span-1 text-xs font-semibold text-[var(--text-muted)]">#</span>
          <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)]">Level</span>
          <span className="col-span-4 text-xs font-semibold text-[var(--text-muted)]">Nama</span>
          <span className="col-span-2 text-xs font-semibold text-[var(--text-muted)]">Kartu</span>
          <span className="col-span-3 text-xs font-semibold text-[var(--text-muted)]">Aksi</span>
        </div>
        {displayed.length === 0 ? (
          <div className="py-10 text-center text-sm text-[var(--text-muted)]">Belum ada modul.</div>
        ) : displayed.map(mod => (
          <div key={mod.id} className="grid grid-cols-12 items-center px-4 py-3">
            <span className="col-span-1 text-xs text-[var(--text-muted)]">{mod.order}</span>
            <span className="col-span-2"><Badge variant="blue">{mod.levels?.name}</Badge></span>
            <div className="col-span-4">
              <p className="text-sm font-medium text-[var(--text-primary)] truncate">{mod.name}</p>
              {mod.description && <p className="text-xs text-[var(--text-muted)] truncate">{mod.description}</p>}
            </div>
            <span className="col-span-2 text-sm text-[var(--text-secondary)]">{mod.total_cards}</span>
            <div className="col-span-3 flex gap-1">
              <button onClick={() => openEdit(mod)}
                className="p-1.5 rounded-[6px] text-[var(--text-muted)] hover:bg-[var(--surface-2)] hover:text-[var(--accent)] transition-all">
                <Pencil size={13} />
              </button>
              <button onClick={() => handleDelete(mod.id)}
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
