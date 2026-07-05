import { Link, useLocation } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { useAuth } from '../context/AuthContext.jsx';
import { api } from '../api.js';

function TabIcon({ name, active }) {
  const s = { width: 24, height: 24, fill: 'none', stroke: 'currentColor', strokeWidth: active ? 2.4 : 2, strokeLinecap: 'round', strokeLinejoin: 'round' };
  switch (name) {
    case 'home':
      return <svg {...s}><path d="M3 10.5 12 3l9 7.5" /><path d="M5 9.5V20a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5" /></svg>;
    case 'courses':
      return <svg {...s}><path d="M3 5.5A1.5 1.5 0 0 1 4.5 4H11v16H4.5A1.5 1.5 0 0 1 3 18.5z" /><path d="M21 5.5A1.5 1.5 0 0 0 19.5 4H13v16h6.5a1.5 1.5 0 0 0 1.5-1.5z" /></svg>;
    case 'sessions':
      return <svg {...s}><circle cx="12" cy="12" r="9" /><path d="M10 9l5 3-5 3z" fill="currentColor" stroke="none" /></svg>;
    case 'messages':
      return <svg {...s}><path d="M21 11.5a8.38 8.38 0 0 1-8.5 8.5 8.5 8.5 0 0 1-3.8-.9L3 21l1.9-5.7A8.38 8.38 0 0 1 12.5 3 8.38 8.38 0 0 1 21 11.5z" /></svg>;
    case 'profile':
      return <svg {...s}><circle cx="12" cy="8" r="4" /><path d="M4 21c0-4 4-6 8-6s8 2 8 6" /></svg>;
    default:
      return null;
  }
}

const TABS = [
  { name: 'home', label: 'Accueil', to: '/' },
  { name: 'courses', label: 'Mes cours', to: '/my-courses' },
  { name: 'sessions', label: 'Sessions', to: '/bookings' },
  { name: 'messages', label: 'Messages', to: '/messages' },
  { name: 'profile', label: 'Profil', to: '/profile' },
];

export default function BottomNav() {
  const location = useLocation();
  const { user, token } = useAuth();
  const [unread, setUnread] = useState(0);

  useEffect(() => {
    if (!token) return setUnread(0);
    api.getUnreadCount(token).then(({ count }) => setUnread(count)).catch(() => {});
  }, [token, location.pathname]);

  function isActive(to) {
    if (to === '/') return location.pathname === '/';
    return location.pathname.startsWith(to);
  }

  return (
    <nav className="absolute bottom-0 left-0 right-0 z-40 border-t border-black/5 bg-white/95 px-2 pb-safe pt-2 shadow-nav backdrop-blur">
      <div className="flex items-center justify-around">
        {TABS.map((tab) => {
          const active = isActive(tab.to);
          return (
            <Link
              key={tab.name}
              to={tab.to}
              className={`relative flex flex-1 flex-col items-center gap-1 py-1 ${
                active ? 'text-brand-500' : 'text-ink/40'
              }`}
            >
              <span className="relative">
                <TabIcon name={tab.name} active={active} />
                {tab.name === 'messages' && unread > 0 && (
                  <span className="absolute -right-2 -top-1.5 flex h-4 min-w-4 items-center justify-center rounded-full bg-coral-500 px-1 text-[10px] font-bold text-white">
                    {unread > 9 ? '9+' : unread}
                  </span>
                )}
              </span>
              <span className={`text-[11px] ${active ? 'font-semibold' : 'font-medium'}`}>{tab.label}</span>
            </Link>
          );
        })}
      </div>
    </nav>
  );
}
