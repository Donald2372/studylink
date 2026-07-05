import { Link } from 'react-router-dom';

// Logo StudyLink : chapeau de diplômé bleu, fidèle aux maquettes
export function StudyLinkLogo({ size = 30 }) {
  return (
    <span className="flex items-center gap-2">
      <svg width={size} height={size} viewBox="0 0 32 32" fill="none">
        <path d="M16 5 2 11l14 6 11-4.7V20h2v-9z" fill="#2563EB" />
        <path d="M7 15v5c0 1.7 4 3.5 9 3.5s9-1.8 9-3.5v-5l-9 3.9z" fill="#2563EB" opacity="0.85" />
      </svg>
      <span className="text-xl font-extrabold tracking-tight text-brand-500">
        Study<span className="text-navy-900">Link</span>
      </span>
    </span>
  );
}

// En-tête simple : logo à gauche, cloche à droite (avec point rouge)
export function MobileHeader({ showBack = false, onBack, title, hasAlert = true, showMenu = false }) {
  return (
    <header className="flex items-center justify-between px-5 pb-2 pt-4">
      <div className="flex items-center gap-3">
        {showBack && (
          <button onClick={onBack} aria-label="Retour" className="text-ink">
            <svg width="24" height="24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="m15 5-7 7 7 7" />
            </svg>
          </button>
        )}
        {title ? (
          <span className="text-lg font-bold text-navy-900">{title}</span>
        ) : (
          <Link to="/"><StudyLinkLogo /></Link>
        )}
      </div>
      <div className="flex items-center gap-3">
        <Link to="/alerts" className="relative text-navy-900" aria-label="Notifications">
          <svg width="24" height="24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M18 8a6 6 0 0 0-12 0c0 7-3 9-3 9h18s-3-2-3-9" />
            <path d="M13.7 21a2 2 0 0 1-3.4 0" />
          </svg>
          {hasAlert && <span className="absolute right-0 top-0 h-2 w-2 rounded-full bg-coral-500" />}
        </Link>
        {showMenu && (
          <button aria-label="Menu" className="text-navy-900">
            <svg width="24" height="24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round">
              <circle cx="12" cy="5" r="0.5" /><circle cx="12" cy="12" r="0.5" /><circle cx="12" cy="19" r="0.5" />
            </svg>
          </button>
        )}
      </div>
    </header>
  );
}
