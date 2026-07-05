import { Routes, Route, useLocation } from 'react-router-dom';
import BottomNav from './components/BottomNav.jsx';
import Home from './pages/Home.jsx';
import Login from './pages/Login.jsx';
import Register from './pages/Register.jsx';
import SearchTutors from './pages/SearchTutors.jsx';
import TutorProfile from './pages/TutorProfile.jsx';
import Bookings from './pages/Bookings.jsx';
import Materials from './pages/Materials.jsx';
import Messages from './pages/Messages.jsx';
import Session from './pages/Session.jsx';
import Profile from './pages/Profile.jsx';
import Catalog from './pages/Catalog.jsx';
import CourseDetail from './pages/CourseDetail.jsx';
import CourseContent from './pages/CourseContent.jsx';
import Lesson from './pages/Lesson.jsx';
import MyCourses from './pages/MyCourses.jsx';

// Pages en plein écran sans barre du bas (login, register, session visio)
const FULLSCREEN = ['/login', '/register'];

export default function App() {
  const location = useLocation();
  const hideNav = FULLSCREEN.includes(location.pathname) || location.pathname.startsWith('/session/');

  return (
    // Fond gris derrière le "téléphone"
    <div className="flex min-h-screen justify-center bg-[#E9EBF0] sm:py-6">
      {/* Cadre mobile centré */}
      <div className="relative flex h-[100dvh] w-full max-w-[430px] flex-col overflow-hidden bg-white sm:h-[900px] sm:rounded-[2.5rem] sm:border-8 sm:border-navy-950 sm:shadow-pop">
        {/* Contenu scrollable */}
        <div className={`flex-1 overflow-y-auto ${hideNav ? '' : 'pb-20'}`}>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />
            <Route path="/search" element={<SearchTutors />} />
            <Route path="/tutors/:id" element={<TutorProfile />} />
            <Route path="/bookings" element={<Bookings />} />
            <Route path="/materials" element={<Materials />} />
            <Route path="/messages" element={<Messages />} />
            <Route path="/session/:id" element={<Session />} />
            <Route path="/profile" element={<Profile />} />
            <Route path="/catalog" element={<Catalog />} />
            <Route path="/course/:id" element={<CourseDetail />} />
            <Route path="/course/:id/content" element={<CourseContent />} />
            <Route path="/lesson/:lessonId" element={<Lesson />} />
            <Route path="/my-courses" element={<MyCourses />} />
            <Route path="*" element={<div className="px-6 py-24 text-center text-ink/50">Page introuvable.</div>} />
          </Routes>
        </div>
        {!hideNav && <BottomNav />}
      </div>
    </div>
  );
}
