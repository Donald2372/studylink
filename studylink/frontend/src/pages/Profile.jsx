import { useEffect, useState } from 'react';
import { api } from '../api.js';
import { useAuth } from '../context/AuthContext.jsx';

export default function Profile() {
  const { user, token } = useAuth();
  const [tutorId, setTutorId] = useState(null);
  const [form, setForm] = useState({ headline: '', bio: '', hourlyRate: '', masteryLevel: '', yearsExperience: '' });
  const [slotForm, setSlotForm] = useState({ startTime: '', endTime: '' });
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    if (user?.role === 'tutor') {
      api
        .searchTutors({ search: user.full_name })
        .then(({ tutors }) => {
          const mine = tutors.find((t) => t.user_id === user.id);
          if (mine) {
            setTutorId(mine.tutor_id);
            setForm({
              headline: mine.headline || '',
              bio: '',
              hourlyRate: mine.hourly_rate,
              masteryLevel: mine.mastery_level || '',
              yearsExperience: mine.years_experience || '',
            });
          }
        })
        .catch(() => {});
    }
  }, [user]);

  async function handleSave(e) {
    e.preventDefault();
    setError('');
    setMessage('');
    try {
      await api.updateTutor(tutorId, form, token);
      setMessage('Profil mis à jour avec succès.');
    } catch (err) {
      setError(err.message);
    }
  }

  async function handleAddSlot(e) {
    e.preventDefault();
    setError('');
    setMessage('');
    try {
      await api.addAvailability(tutorId, slotForm, token);
      setMessage('Créneau ajouté à votre agenda.');
      setSlotForm({ startTime: '', endTime: '' });
    } catch (err) {
      setError(err.message);
    }
  }

  if (!user) {
    return <div className="mx-auto max-w-lg px-6 py-20 text-center text-ink/60">Connectez-vous pour accéder à votre profil.</div>;
  }

  return (
    <div className="mx-auto max-w-2xl px-6 py-10">
      <h1 className="font-display text-3xl font-semibold text-ink">Mon profil</h1>
      <p className="mt-1 text-ink/60">{user.email} · {user.role === 'tutor' ? 'Tuteur' : 'Élève'}</p>

      {message && <p className="mt-4 text-sm text-mint-500">{message}</p>}
      {error && <p className="mt-4 text-sm text-coral-600">{error}</p>}

      {user.role === 'tutor' && tutorId && (
        <>
          <form onSubmit={handleSave} className="mt-8 flex flex-col gap-4 rounded-xl2 border border-black/5 bg-white p-6 shadow-card">
            <h2 className="font-display text-lg font-semibold text-ink">Informations professionnelles</h2>
            <div>
              <label className="mb-1 block text-sm font-medium text-ink/80">Titre affiché</label>
              <input
                value={form.headline}
                onChange={(e) => setForm({ ...form, headline: e.target.value })}
                className="w-full rounded-lg border border-black/10 px-3 py-2 text-sm outline-none focus:border-brand-500"
                placeholder="ex : Master's Degree in Mathematics"
              />
            </div>
            <div>
              <label className="mb-1 block text-sm font-medium text-ink/80">Bio</label>
              <textarea
                value={form.bio}
                onChange={(e) => setForm({ ...form, bio: e.target.value })}
                rows={4}
                className="w-full rounded-lg border border-black/10 px-3 py-2 text-sm outline-none focus:border-brand-500"
              />
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="mb-1 block text-sm font-medium text-ink/80">Tarif horaire (€)</label>
                <input
                  type="number"
                  value={form.hourlyRate}
                  onChange={(e) => setForm({ ...form, hourlyRate: e.target.value })}
                  className="w-full rounded-lg border border-black/10 px-3 py-2 text-sm outline-none focus:border-brand-500"
                />
              </div>
              <div>
                <label className="mb-1 block text-sm font-medium text-ink/80">Années d'expérience</label>
                <input
                  type="number"
                  value={form.yearsExperience}
                  onChange={(e) => setForm({ ...form, yearsExperience: e.target.value })}
                  className="w-full rounded-lg border border-black/10 px-3 py-2 text-sm outline-none focus:border-brand-500"
                />
              </div>
            </div>
            <button className="mt-2 rounded-lg bg-brand-500 py-2.5 text-sm font-semibold text-white transition hover:bg-brand-600">
              Enregistrer
            </button>
          </form>

          <form onSubmit={handleAddSlot} className="mt-6 flex flex-col gap-4 rounded-xl2 border border-black/5 bg-white p-6 shadow-card">
            <h2 className="font-display text-lg font-semibold text-ink">Ajouter un créneau de disponibilité</h2>
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="mb-1 block text-sm font-medium text-ink/80">Début</label>
                <input
                  type="datetime-local"
                  required
                  value={slotForm.startTime}
                  onChange={(e) => setSlotForm({ ...slotForm, startTime: e.target.value })}
                  className="w-full rounded-lg border border-black/10 px-3 py-2 text-sm outline-none focus:border-brand-500"
                />
              </div>
              <div>
                <label className="mb-1 block text-sm font-medium text-ink/80">Fin</label>
                <input
                  type="datetime-local"
                  required
                  value={slotForm.endTime}
                  onChange={(e) => setSlotForm({ ...slotForm, endTime: e.target.value })}
                  className="w-full rounded-lg border border-black/10 px-3 py-2 text-sm outline-none focus:border-brand-500"
                />
              </div>
            </div>
            <button className="rounded-lg border border-brand-500 py-2.5 text-sm font-semibold text-brand-600 transition hover:bg-brand-50">
              Ajouter le créneau
            </button>
          </form>
        </>
      )}
    </div>
  );
}
