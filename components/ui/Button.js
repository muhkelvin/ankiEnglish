'use client'
import { clsx } from 'clsx'

const variants = {
  primary: 'bg-[var(--accent)] text-white hover:bg-[var(--accent-hover)] shadow-sm',
  secondary: 'bg-[var(--surface)] text-[var(--text-primary)] border border-[var(--border)] hover:border-[var(--border-hover)] hover:bg-[var(--surface-2)]',
  ghost: 'text-[var(--text-secondary)] hover:bg-[var(--surface-2)] hover:text-[var(--text-primary)]',
  danger: 'bg-[var(--red)] text-white hover:bg-red-700',
  success: 'bg-[var(--green)] text-white hover:bg-green-700',
}

const sizes = {
  sm: 'text-xs px-3 py-1.5 rounded-[8px]',
  md: 'text-sm px-4 py-2 rounded-[10px]',
  lg: 'text-sm px-5 py-2.5 rounded-[12px]',
  xl: 'text-base px-6 py-3 rounded-[var(--radius)]',
}

export default function Button({
  children,
  variant = 'primary',
  size = 'md',
  className,
  loading,
  disabled,
  fullWidth,
  ...props
}) {
  return (
    <button
      className={clsx(
        'inline-flex items-center justify-center gap-2 font-medium transition-all btn-press',
        'disabled:opacity-50 disabled:cursor-not-allowed',
        variants[variant],
        sizes[size],
        fullWidth && 'w-full',
        className
      )}
      disabled={disabled || loading}
      {...props}
    >
      {loading ? (
        <>
          <svg className="animate-spin w-4 h-4" fill="none" viewBox="0 0 24 24">
            <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
            <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
          </svg>
          Memuat...
        </>
      ) : children}
    </button>
  )
}
