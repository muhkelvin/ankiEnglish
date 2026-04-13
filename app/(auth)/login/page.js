'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { Mail, Lock, Eye, EyeOff, BookOpen, Brain, Zap } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import Button from '@/components/ui/Button'
import Input from '@/components/ui/Input'

const features = [
  { icon: Brain, title: 'Algoritma SM-2', desc: 'Sistem spaced repetition yang terbukti efektif seperti Anki.' },
  { icon: BookOpen, title: '3 Tipe Kartu', desc: 'Fill in blank, pilihan ganda, dan error correction.' },
  { icon: Zap, title: 'Belajar Efisien', desc: 'Review kartu tepat waktu sebelum kamu lupa.' },
]

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
    const { error } = await supabase.auth.signInWithPassword({ email: form.email, password: form.password })
    if (error) {
      setServerError('Email atau password salah. Coba lagi.')
      setLoading(false)
      return
    }
    router.push('/')
    router.refresh()
  }

  return (
    <div className="min-h-dvh flex" style={{ background: 'var(--bg)' }}>
      {/* Left panel - desktop only */}
      <div
        className="hidden md:flex flex-col justify-between w-[480px] flex-shrink-0 p-10"
        style={{ background: 'linear-gradient(160deg, #1841cc 0%, #2155e8 60%, #3b6cf7 100%)' }}
      >
        <div>
          <span
            className="text-2xl font-semibold text-white"
            style={{ fontFamily: "'Instrument Serif', serif" }}
          >
            EnglishAnki
          </span>
          <p className="text-blue-200 text-sm mt-1">Flashcard SRS · Belajar Grammar</p>
        </div>

        <div className="space-y-6">
          {features.map(({ icon: Icon, title, desc }) => (
            <div key={title} className="flex gap-4">
              <div className="w-10 h-10 rounded-[12px] bg-white/15 flex items-center justify-center flex-shrink-0">
                <Icon size={18} className="text-white" />
              </div>
              <div>
                <p className="text-white font-semibold text-sm mb-0.5">{title}</p>
                <p className="text-blue-200 text-sm leading-relaxed">{desc}</p>
              </div>
            </div>
          ))}
        </div>

        <p className="text-blue-300 text-xs">
          Konsisten 10 menit sehari lebih baik dari 1 jam seminggu sekali.
        </p>
      </div>

      {/* Right panel - form */}
      <div className="flex-1 flex items-center justify-center px-6 py-12">
        <div className="w-full max-w-sm page-enter">
          <div className="mb-8">
            <h1
              className="text-2xl font-semibold text-[var(--text-primary)] mb-1.5"
              style={{ fontFamily: "'Instrument Serif', serif" }}
            >
              Masuk ke akun
            </h1>
            <p className="text-sm text-[var(--text-muted)]">Belum punya akun?{' '}
              <Link href="/register" className="text-[var(--accent)] font-medium hover:underline">Daftar sekarang</Link>
            </p>
          </div>

          {serverError && (
            <div className="mb-5 px-4 py-3 bg-[var(--red-light)] border border-[var(--red-muted)] rounded-[var(--radius-sm)]">
              <p className="text-sm text-[var(--red)] font-medium">{serverError}</p>
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
            <div>
              <Input
                label="Password"
                type={showPass ? 'text' : 'password'}
                placeholder="••••••••"
                value={form.password}
                onChange={e => { setForm(p => ({ ...p, password: e.target.value })); setErrors(p => ({ ...p, password: '' })) }}
                error={errors.password}
                icon={<Lock size={15} />}
              />
              <button
                type="button"
                onClick={() => setShowPass(p => !p)}
                className="mt-1.5 text-xs text-[var(--text-muted)] hover:text-[var(--text-secondary)] flex items-center gap-1 transition-colors"
              >
                {showPass ? <EyeOff size={12} /> : <Eye size={12} />}
                {showPass ? 'Sembunyikan' : 'Tampilkan'} password
              </button>
            </div>

            <Button type="submit" fullWidth loading={loading} size="lg" className="mt-2">
              Masuk
            </Button>
          </form>
        </div>
      </div>
    </div>
  )
}
