import { Routes, Route } from 'react-router-dom';
import Register from './pages/Register.jsx';
import Profile from './pages/Profile.jsx';
import {
  HomePage, LoginPage, SearchTutorsPage, TutorProfilePage, CalendarPage, ReservePage, BookingsPage,
  SessionDetailPage, VideoSessionPage, MaterialsPage, ForumPage, MessagesPage, ConversationPage, AlertsPage,
  CataloguePage, CourseDetailPage, CourseModulesPage, LessonPage, TutorialPage, BootcampsPage, CareerPrepPage,
  PersonalDevelopmentPage, PersonalProgramPage, PersonalBooksPage, BookReaderPage, EntrepreneurshipPage,
  BusinessPlanCoursePage, EntrepreneurToolkitPage, EntrepreneurProjectPage
} from './pages/StudyLinkPages.jsx';

export default function App(){return <Routes>
  <Route path="/" element={<HomePage/>}/><Route path="/login" element={<LoginPage/>}/><Route path="/register" element={<Register/>}/>
  <Route path="/search" element={<SearchTutorsPage/>}/><Route path="/tutors/:id" element={<TutorProfilePage/>}/><Route path="/calendar" element={<CalendarPage/>}/><Route path="/reserve/:id" element={<ReservePage/>}/>
  <Route path="/bookings" element={<BookingsPage/>}/><Route path="/session/:id" element={<SessionDetailPage/>}/><Route path="/video-session" element={<VideoSessionPage/>}/>
  <Route path="/materials" element={<MaterialsPage/>}/><Route path="/forum" element={<ForumPage/>}/><Route path="/messages" element={<MessagesPage/>}/><Route path="/messages/:id" element={<ConversationPage/>}/><Route path="/alerts" element={<AlertsPage/>}/>
  <Route path="/catalogue" element={<CataloguePage/>}/><Route path="/courses/:id" element={<CourseDetailPage/>}/><Route path="/courses/:id/modules" element={<CourseModulesPage/>}/><Route path="/lessons/:id" element={<LessonPage/>}/><Route path="/tutorials/:id" element={<TutorialPage/>}/>
  <Route path="/bootcamps" element={<BootcampsPage/>}/><Route path="/career-prep" element={<CareerPrepPage/>}/>
  <Route path="/personal-development" element={<PersonalDevelopmentPage/>}/><Route path="/personal-development/programs/:id" element={<PersonalProgramPage/>}/><Route path="/personal-development/books" element={<PersonalBooksPage/>}/><Route path="/personal-development/books/:id" element={<BookReaderPage/>}/>
  <Route path="/entrepreneurship" element={<EntrepreneurshipPage/>}/><Route path="/entrepreneurship/business-plan" element={<BusinessPlanCoursePage/>}/><Route path="/entrepreneurship/toolkit" element={<EntrepreneurToolkitPage/>}/><Route path="/entrepreneurship/project" element={<EntrepreneurProjectPage/>}/>
  <Route path="/profile" element={<Profile/>}/><Route path="*" element={<HomePage/>}/>
</Routes>}
