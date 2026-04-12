'use client'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { clsx } from 'clsx'
import { BookOpen, LayoutGrid, PenSquare, BarChart2 } from 'lucide-react'

const tabs = [
  { label: 'Home', href: '/', icon: LayoutGrid },
  { label: 'Sistem', href: '/system', icon: BookOpen },
  { label: 'Saya', href: '/my-cards', icon: PenSquare },
  { label: 'Statistik', href: '/stats', icon: BarChart2 },
]

export default function Navbar() {
  const pathname = usePathname()

  return (
    <nav
      className="sticky top-0 z-50 bg-[var(--surface)]/90 backdrop-blur-md border-b border-[var(--border)]"
    >
      <div className="max-w-lg mx-auto px-4 py-2.5 flex items-center justify-between">
        <span
          className="font-semibold text-sm text-[var(--text-primary)] tracking-tight"
          style={{ fontFamily: "'Instrument Serif', serif" }}
        >
          EnglishAnki
        </span>

        <div className="flex items-center gap-0.5">
          {tabs.map(({ label, href, icon: Icon }) => {
            const active = pathname === href || (href !== '/' && pathname.startsWith(href))
            return (
              <Link
                key={href}
                href={href}
                className={clsx(
                  'flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-[8px] transition-all font-medium',
                  active
                    ? 'bg-[var(--accent)] text-white shadow-sm'
                    : 'text-[var(--text-secondary)] hover:bg-[var(--surface-2)] hover:text-[var(--text-primary)]'
                )}
              >
                <Icon size={13} strokeWidth={2.2} />
                {label}
              </Link>
            )
          })}
        </div>
      </div>
    </nav>
  )
}
