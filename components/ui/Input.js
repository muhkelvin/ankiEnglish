import { clsx } from 'clsx'

export default function Input({ label, error, icon, className, ...props }) {
  return (
    <div className="flex flex-col gap-1.5">
      {label && (
        <label className="text-sm font-medium text-[var(--text-primary)]">
          {label}
        </label>
      )}
      <div className="relative">
        {icon && (
          <div className="absolute left-3 top-1/2 -translate-y-1/2 text-[var(--text-muted)]">
            {icon}
          </div>
        )}
        <input
          className={clsx(
            'w-full bg-[var(--surface)] border border-[var(--border)] rounded-[10px]',
            'px-3.5 py-2.5 text-sm text-[var(--text-primary)]',
            'placeholder:text-[var(--text-muted)]',
            'focus:outline-none focus:border-[var(--accent)] focus:ring-2 focus:ring-[var(--accent)]/10',
            'transition-all',
            icon && 'pl-10',
            error && 'border-[var(--red)] focus:border-[var(--red)] focus:ring-[var(--red)]/10',
            className
          )}
          {...props}
        />
      </div>
      {error && (
        <p className="text-xs text-[var(--red)]">{error}</p>
      )}
    </div>
  )
}
