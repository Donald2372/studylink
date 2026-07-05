import { Routes, Route } from 'react-router-dom';
import HomePage from './pages/dashboard/HomePage.jsx';
import LoginPage from './pages/auth/LoginPage.jsx';
import SearchTutorsPage from './pages/tutors/SearchTutorsPage.jsx';
import TutorProfilePage from './pages/tutors/TutorProfilePage.jsx';
import CalendarPage from './pages/sessions/CalendarPage.jsx';
import ReservePage from './pages/sessions/ReservePage.jsx';
import BookingsPage from './pages/sessions/BookingsPage.jsx';
import SessionDetailPage from './pages/sessions/SessionDetailPage.jsx';
import VideoSessionPage from './pages/sessions/VideoSessionPage.jsx';
import MaterialsPage from './pages/materials/MaterialsPage.jsx';
import ForumPage from './pages/community/ForumPage.jsx';
import MessagesPage from './pages/messages/MessagesPage.jsx';
import ConversationPage from './pages/messages/ConversationPage.jsx';
import AlertsPage from './pages/notifications/AlertsPage.jsx';
import CataloguePage from './pages/learning/CataloguePage.jsx';
import CourseDetailPage from './pages/learning/CourseDetailPage.jsx';
import CourseModulesPage from './pages/learning/CourseModulesPage.jsx';
import LessonPage from './pages/learning/LessonPage.jsx';
import TutorialPage from './pages/learning/TutorialPage.jsx';
import BootcampsPage from './pages/bootcamps/BootcampsPage.jsx';
import CareerPrepPage from './pages/career/CareerPrepPage.jsx';
import PersonalDevelopmentPage from './pages/personal-development/PersonalDevelopmentPage.jsx';
import PersonalProgramPage from './pages/personal-development/PersonalProgramPage.jsx';
import PersonalBooksPage from './pages/personal-development/PersonalBooksPage.jsx';
import BookReaderPage from './pages/personal-development/BookReaderPage.jsx';
import EntrepreneurshipPage from './pages/entrepreneurship/EntrepreneurshipPage.jsx';
import BusinessPlanCoursePage from './pages/entrepreneurship/BusinessPlanCoursePage.jsx';
import EntrepreneurToolkitPage from './pages/entrepreneurship/EntrepreneurToolkitPage.jsx';
import EntrepreneurProjectPage from './pages/entrepreneurship/EntrepreneurProjectPage.jsx';
import Register from './pages/Register.jsx';
import Profile from './pages/Profile.jsx';

export default function App(){return <Routes>
  <Route path="/" element={<HomePage/>}/>
  <Route path="/login" element={<LoginPage/>}/>
  <Route path="/register" element={<Register/>}/>
  <Route path="/search" element={<SearchTutorsPage/>}/>
  <Route path="/tutors/:id" element={<TutorProfilePage/>}/>
  <Route path="/calendar" element={<CalendarPage/>}/>
  <Route path="/reserve/:id" element={<ReservePage/>}/>
  <Route path="/bookings" element={<BookingsPage/>}/>
  <Route path="/session/:id" element={<SessionDetailPage/>}/>
  <Route path="/video-session" element={<VideoSessionPage/>}/>
  <Route path="/materials" element={<MaterialsPage/>}/>
  <Route path="/forum" element={<ForumPage/>}/>
  <Route path="/messages" element={<MessagesPage/>}/>
  <Route path="/messages/:id" element={<ConversationPage/>}/>
  <Route path="/alerts" element={<AlertsPage/>}/>
  <Route path="/catalogue" element={<CataloguePage/>}/>
  <Route path="/courses/:id" element={<CourseDetailPage/>}/>
  <Route path="/courses/:id/modules" element={<CourseModulesPage/>}/>
  <Route path="/lessons/:id" element={<LessonPage/>}/>
  <Route path="/tutorials/:id" element={<TutorialPage/>}/>
  <Route path="/bootcamps" element={<BootcampsPage/>}/>
  <Route path="/career-prep" element={<CareerPrepPage/>}/>
  <Route path="/personal-development" element={<PersonalDevelopmentPage/>}/>
  <Route path="/personal-development/programs/:id" element={<PersonalProgramPage/>}/>
  <Route path="/personal-development/books" element={<PersonalBooksPage/>}/>
  <Route path="/personal-development/books/:id" element={<BookReaderPage/>}/>
  <Route path="/entrepreneurship" element={<EntrepreneurshipPage/>}/>
  <Route path="/entrepreneurship/business-plan" element={<BusinessPlanCoursePage/>}/>
  <Route path="/entrepreneurship/toolkit" element={<EntrepreneurToolkitPage/>}/>
  <Route path="/entrepreneurship/project" element={<EntrepreneurProjectPage/>}/>
  <Route path="/profile" element={<Profile/>}/>
  <Route path="*" element={<HomePage/>}/>
</Routes>}
