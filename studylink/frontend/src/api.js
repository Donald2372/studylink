const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:4000/api';

async function request(path, { method = 'GET', body, token } = {}) {
  const isFormData = body instanceof FormData;
  const headers = {};
  if (!isFormData) headers['Content-Type'] = 'application/json';
  if (token) headers.Authorization = `Bearer ${token}`;

  const res = await fetch(`${API_URL}${path}`, {
    method,
    headers,
    body: body ? (isFormData ? body : JSON.stringify(body)) : undefined,
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
  getCourses: (params = {}) => {
    const qs = new URLSearchParams(
      Object.fromEntries(Object.entries(params).filter(([, v]) => v !== '' && v != null))
    ).toString();
    return request(`/content/courses${qs ? `?${qs}` : ''}`);
  },
  getCourse: (id) => request(`/content/courses/${id}`),
  getPublicMaterials: (params = {}) => {
    const qs = new URLSearchParams(
      Object.fromEntries(Object.entries(params).filter(([, v]) => v !== '' && v != null))
    ).toString();
    return request(`/content/materials${qs ? `?${qs}` : ''}`);
  },
  getTutorials: () => request('/content/tutorials'),
  getTutorial: (id) => request(`/content/tutorials/${id}`),

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
  sendMessageWithFile: ({ recipientId, content, file }, token) => {
    const form = new FormData();
    form.append('recipientId', recipientId);
    if (content) form.append('content', content);
    if (file) form.append('file', file);
    return request('/messages', { method:'POST', body:form, token });
  },
  getUnreadCount: (token) => request('/messages/unread-count', { token }),

  adminDashboard: (token) => request('/admin/dashboard', { token }),
  adminCategories: (token, universe='') => request(`/admin/categories${universe ? `?universe=${encodeURIComponent(universe)}` : ''}`, { token }),
  adminUsers: (token) => request('/admin/users', { token }),
  adminSetUserRole: (id, role, token) => request(`/admin/users/${id}/role`, { method:'PATCH', body:{role}, token }),
  adminList: (resource, token) => request(`/admin/${resource}`, { token }),
  adminCreate: (resource, payload, token) => request(`/admin/${resource}`, { method:'POST', body:payload, token }),
  adminUpdateCourse: (id, payload, token) => request(`/admin/courses/${id}`, { method:'PUT', body:payload, token }),
  adminSetCourseStatus: (id, status, token) => request(`/admin/courses/${id}/status`, { method:'PATCH', body:{status}, token }),
  adminDelete: (resource, id, token) => request(`/admin/${resource}/${id}`, { method:'DELETE', token }),
  adminCourseStructure: (id, token) => request(`/admin/courses/${id}/structure`, { token }),
  adminAddModule: (courseId, payload, token) => request(`/admin/courses/${courseId}/modules`, { method:'POST', body:payload, token }),
  adminDeleteModule: (id, token) => request(`/admin/modules/${id}`, { method:'DELETE', token }),
  adminAddLesson: (moduleId, payload, token) => request(`/admin/modules/${moduleId}/lessons`, { method:'POST', body:payload, token }),
  adminDeleteLesson: (id, token) => request(`/admin/lessons/${id}`, { method:'DELETE', token }),
  adminAddTutorialStep: (id, payload, token) => request(`/admin/tutorials/${id}/steps`, { method:'POST', body:payload, token }),
  adminAddProgramDay: (id, payload, token) => request(`/admin/personal-programs/${id}/days`, { method:'POST', body:payload, token }),
  adminUpload: (kind, file, token) => { const form = new FormData(); form.append('file', file); return request(`/admin/uploads/${kind}`, { method:'POST', body:form, token }); },
  adminAddCourseFile: (courseId, payload, token) => request(`/admin/courses/${courseId}/files`, { method:'POST', body:payload, token }),
  adminCourseFiles: (courseId, token) => request(`/admin/courses/${courseId}/files`, { token }),
  adminDeleteCourseFile: (id, token) => request(`/admin/course-files/${id}`, { method:'DELETE', token }),
};
