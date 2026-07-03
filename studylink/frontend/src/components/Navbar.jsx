import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext.jsx';

const navLinkClass = ({ active }) =>
  `text-sm font-medium transition-colors ${
    active ? 'text-brand-600' : 'text-ink/60 hover:text-ink'
  }`;

export default function Navbar() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  return (
    <header className="sticky top-0 z-40 border-b border-black/5 bg-white/90 backdrop-blur">
      <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
        <Link to="/" className="flex items-center gap-2">
          <span className="flex h-8 w-8 items-center justify-center rounded-lg bg-brand-500 font-display text-lg font-semibold text-white">
            S
          </span>
          <span className="font-display text-xl font-semibold text-ink">Studylink</span>
        </Link>

        <nav className="hidden items-center gap-8 md:flex">
          <Link className={navLinkClass({ active: true })} to="/search">
            Rechercher un tuteur
          </Link>
          {user && (
            <Link className={navLinkClass({ active: false })} to="/bookings">
              Mes réservations
            </Link>
          )}
          {user && (
            <Link className={navLinkClass({ active: false })} to="/profile">
              Profil
            </Link>
          )}
        </nav>

        <div className="flex items-center gap-3">
          {user ? (
            <>
              <span className="hidden text-sm text-ink/60 sm:inline">
                Bonjour, {user.full_name.split(' ')[0]}
              </span>
              <button
                onClick={() => {
                  logout();
                  navigate('/');
                }}
                className="rounded-lg border border-black/10 px-4 py-2 text-sm font-medium text-ink transition hover:bg-black/5"
              >
                Déconnexion
              </button>
            </>
          ) : (
            <>
              <Link
                to="/login"
                className="rounded-lg px-4 py-2 text-sm font-medium text-ink transition hover:bg-black/5"
              >
                Connexion
              </Link>
              <Link
                to="/register"
                className="rounded-lg bg-brand-500 px-4 py-2 text-sm font-medium text-white shadow-card transition hover:bg-brand-600"
              >
                S'inscrire
              </Link>
            </>
          )}
        </div>
      </div>
    </header>
  );
}
