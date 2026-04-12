'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { Mail, Lock, User } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import Button from '@/components/ui/Button'
import Input from '@/components/ui/Input'

export default function RegisterPage() {
  const router = useRouter()
  const [form, setForm] = useState({ name: '', email: '', password: '', confirmPassword: '' })
  const [errors, setErrors] = useState({})
  const [loading, setLoading] = useState(false)
  const [serverError, setServerError] = useState('')

  function set(key) {
    return e => {
      setForm(p => ({ ...p, [key]: e.target.value }))
      setErrors(p => ({ ...p, [key]: '' }))
    }
  }

  function validate() {
    const e = {}
    if (!form.name.trim()) e.name = 'Nama wajib diisi'
    if (!form.email) e.email = 'Email wajib diisi'
    else if (!/\S+@\S+\.\S+/.test(form.email)) e.email = 'Format email tidak valid'
    if (!form.password) e.password = 'Password wajib diisi'
    else if (form.password.length < 6) e.password = 'Password minimal 6 karakter'
    if (form.password !== form.confirmPassword) e.confirmPassword = 'Password tidak cocok'
    return e
  }

  async function handleSubmit(e) {
    e.preventDefault()
    const errs = validate()
    if (Object.keys(errs).length) { setErrors(errs); return }

    setLoading(true)
    setServerError('')

    const supabase = createClient()
    const { data, error } = await supabase.auth.signUp({
      email: form.email,
      password: form.password,
      options: { data: { name: form.name } }
    })

    if (error) {
      setServerError(error.message)
      setLoading(false)
      return
    }

    // Insert into users table
    if (data.user) {
      await supabase.from('users').insert({
        id: data.user.id,
        name: form.name,
        email: form.email,
        role: 'user',
      })
    }

    router.push('/')
    router.refresh()
  }

  return (
    <div className="min-h-dvh flex items-center justify-center px-4" style={{ background: 'var(--bg)' }}>
      <div className="w-full max-w-sm page-enter">
        <div className="text-center mb-8">
          <h1 className="text-2xl font-semibold text-[var(--text-primary)] mb-1"
              style={{ fontFamily: "'Instrument Serif', serif" }}>
            EnglishAnki
          </h1>
          <p className="text-sm text-[var(--text-muted)]">Buat akun baru</p>
        </div>

        <div className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-6 shadow-[var(--shadow)]">
          {serverError && (
            <div className="mb-4 px-3.5 py-2.5 bg-[var(--red-light)] border border-red-100 rounded-[10px]">
              <p className="text-xs text-[var(--red)] font-medium">{serverError}</p>
            </div>
          )}

          <form onSubmit={handleSubmit} className="flex flex-col gap-4">
            <Input label="Nama lengkap" type="text" placeholder="Muhammad Kelvin"
              value={form.name} onChange={set('name')} error={errors.name}
              icon={<User size={15} />} />
            <Input label="Email" type="email" placeholder="kamu@email.com"
              value={form.email} onChange={set('email')} error={errors.email}
              icon={<Mail size={15} />} />
            <Input label="Password" type="password" placeholder="Min. 6 karakter"
              value={form.password} onChange={set('password')} error={errors.password}
              icon={<Lock size={15} />} />
            <Input label="Konfirmasi password" type="password" placeholder="Ulangi password"
              value={form.confirmPassword} onChange={set('confirmPassword')} error={errors.confirmPassword}
              icon={<Lock size={15} />} />
            <Button type="submit" fullWidth loading={loading} size="lg" className="mt-1">
              Buat Akun
            </Button>
          </form>
        </div>

        <p className="text-center text-xs text-[var(--text-muted)] mt-5">
          Sudah punya akun?{' '}
          <Link href="/login" className="text-[var(--accent)] font-medium hover:underline">
            Masuk di sini
          </Link>
        </p>
      </div>
    </div>
  )
}
