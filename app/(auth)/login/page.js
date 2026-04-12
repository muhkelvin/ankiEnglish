'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { Mail, Lock, Eye, EyeOff } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import Button from '@/components/ui/Button'
import Input from '@/components/ui/Input'

export default function LoginPage() {
  const router = useRouter()
  const [form, setForm] = useState({ email: '', password: '' })
  const [errors, setErrors] = useState({})
  const [loading, setLoading] = useState(false)
  const [showPass, setShowPass] = useState(false)
  const [serverError, setServerError] = useState('')

  function validate() {
    const e = {}
    if (!form.email) e.email = 'Email wajib diisi'
    else if (!/\S+@\S+\.\S+/.test(form.email)) e.email = 'Format email tidak valid'
    if (!form.password) e.password = 'Password wajib diisi'
    return e
  }

  async function handleSubmit(e) {
    e.preventDefault()
    const errs = validate()
    if (Object.keys(errs).length) { setErrors(errs); return }

    setLoading(true)
    setServerError('')
    const supabase = createClient()
    const { error } = await supabase.auth.signInWithPassword({
      email: form.email,
      password: form.password,
    })

    if (error) {
      setServerError('Email atau password salah. Coba lagi.')
      setLoading(false)
      return
    }
    router.push('/')
    router.refresh()
  }

  return (
    <div className="min-h-dvh flex items-center justify-center px-4" style={{ background: 'var(--bg)' }}>
      <div className="w-full max-w-sm page-enter">
        {/* Logo */}
        <div className="text-center mb-8">
          <h1 className="text-2xl font-semibold text-[var(--text-primary)] mb-1"
              style={{ fontFamily: "'Instrument Serif', serif" }}>
            EnglishAnki
          </h1>
          <p className="text-sm text-[var(--text-muted)]">Masuk ke akunmu</p>
        </div>

        <div className="bg-[var(--surface)] border border-[var(--border)] rounded-[var(--radius)] p-6 shadow-[var(--shadow)]">
          {serverError && (
            <div className="mb-4 px-3.5 py-2.5 bg-[var(--red-light)] border border-red-100 rounded-[10px]">
              <p className="text-xs text-[var(--red)] font-medium">{serverError}</p>
            </div>
          )}

          <form onSubmit={handleSubmit} className="flex flex-col gap-4">
            <Input
              label="Email"
              type="email"
              placeholder="kamu@email.com"
              value={form.email}
              onChange={e => { setForm(p => ({ ...p, email: e.target.value })); setErrors(p => ({ ...p, email: '' })) }}
              error={errors.email}
              icon={<Mail size={15} />}
            />
            <Input
              label="Password"
              type={showPass ? 'text' : 'password'}
              placeholder="••••••••"
              value={form.password}
              onChange={e => { setForm(p => ({ ...p, password: e.target.value })); setErrors(p => ({ ...p, password: '' })) }}
              error={errors.password}
              icon={<Lock size={15} />}
              className="pr-10"
            />
            {/* Show/hide password overlay */}
            <button
              type="button"
              onClick={() => setShowPass(p => !p)}
              className="-mt-2 self-end text-xs text-[var(--text-muted)] hover:text-[var(--text-secondary)] flex items-center gap-1"
            >
              {showPass ? <EyeOff size={12} /> : <Eye size={12} />}
              {showPass ? 'Sembunyikan' : 'Tampilkan'} password
            </button>

            <Button type="submit" fullWidth loading={loading} size="lg" className="mt-1">
              Masuk
            </Button>
          </form>
        </div>

        <p className="text-center text-xs text-[var(--text-muted)] mt-5">
          Belum punya akun?{' '}
          <Link href="/register" className="text-[var(--accent)] font-medium hover:underline">
            Daftar sekarang
          </Link>
        </p>
      </div>
    </div>
  )
}
