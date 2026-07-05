const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:4000/api';

async function request(path, { method = 'GET', body, token } = {}) {
  const headers = { 'Content-Type': 'application/json' };
  if (token) headers.Authorization = `Bearer ${token}`;

  const res = await fetch(`${API_URL}${path}`, {
    method,
    headers,
    body: body ? JSON.stringify(body) : undefined,
  });

  const data = await res.json().catch(() => ({}));

  if (!res.ok) {
    throw new Error(data.error || `Erreur ${res.status}`);
  }
  return data;
}

export const api = {
  register: (payload) => request('/auth/register', { method: 'POST', body: payload }),
  login: (payload) => request('/auth/login', { method: 'POST', body: payload }),
  me: (token) => request('/auth/me', { token }),

  searchTutors: (params = {}) => {
    const qs = new URLSearchParams(
      Object.fromEntries(Object.entries(params).filter(([, v]) => v !== '' && v != null))
    ).toString();
    return request(`/tutors${qs ? `?${qs}` : ''}`);
  },
  getTutor: (id) => request(`/tutors/${id}`),
  updateTutor: (id, payload, token) => request(`/tutors/${id}`, { method: 'PUT', body: payload, token }),
  addAvailability: (id, payload, token) =>
    request(`/tutors/${id}/availability`, { method: 'POST', body: payload, token }),

  getSubjects: () => request('/subjects'),

  createBooking: (payload, token) => request('/bookings', { method: 'POST', body: payload, token }),
  myBookings: (token) => request('/bookings/me', { token }),
  cancelBooking: (id, token) => request(`/bookings/${id}/cancel`, { method: 'PATCH', token }),

  addReview: (payload, token) => request('/reviews', { method: 'POST', body: payload, token }),

  getMaterials: (bookingId, token) => request(`/materials/booking/${bookingId}`, { token }),
  addMaterial: (payload, token) => request('/materials', { method: 'POST', body: payload, token }),
  deleteMaterial: (id, token) => request(`/materials/${id}`, { method: 'DELETE', token }),

  getContacts: (token) => request('/messages/contacts', { token }),
  getThread: (userId, token) => request(`/messages/thread/${userId}`, { token }),
  markThreadRead: (userId, token) => request(`/messages/thread/${userId}/read`, { method: 'PATCH', token }),
  sendMessage: (payload, token) => request('/messages', { method: 'POST', body: payload, token }),
  getUnreadCount: (token) => request('/messages/unread-count', { token }),

  // --- Cours ---
  getCourseCategories: () => request('/courses/categories'),
  getCourses: (params = {}) => {
    const qs = new URLSearchParams(params).toString();
    return request(`/courses${qs ? `?${qs}` : ''}`);
  },
  getCourse: (id) => request(`/courses/${id}`),
  getCourseProgress: (id, token) => request(`/courses/${id}/progress`, { token }),
  enrollCourse: (id, token) => request(`/courses/${id}/enroll`, { method: 'POST', token }),
  toggleFavorite: (id, token) => request(`/courses/${id}/favorite`, { method: 'POST', token }),
  getLesson: (lessonId, token) => request(`/courses/lessons/${lessonId}`, { token }),
  completeLesson: (lessonId, token) =>
    request(`/courses/lessons/${lessonId}/complete`, { method: 'POST', token }),
  getMyCourses: (token) => request('/courses/mine/enrolled', { token }),
};
