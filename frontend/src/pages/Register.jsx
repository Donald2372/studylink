import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { api } from '../api.js';
import { useAuth } from '../context/AuthContext.jsx';

export default function Register() {
  const { login } = useAuth();
  const navigate = useNavigate();
  const [form, setForm] = useState({ fullName: '', email: '', password: '', role: 'student' });
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e) {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      const { token, user } = await api.register(form);
      login(token, user);
      navigate('/search');
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="mx-auto flex min-h-[80vh] max-w-md flex-col justify-center px-6 py-12">
      <h1 className="font-display text-3xl font-semibold text-ink">Créer un compte</h1>
      <p className="mt-2 text-ink/60">Rejoignez Studylink en tant qu'élève ou tuteur.</p>

      <form onSubmit={handleSubmit} className="mt-8 flex flex-col gap-4">
        <div className="grid grid-cols-2 gap-3">
          {[
            { value: 'student', label: 'Je suis élève' },
            { value: 'tutor', label: 'Je suis tuteur' },
          ].map((opt) => (
            <button
              type="button"
              key={opt.value}
              onClick={() => setForm({ ...form, role: opt.value })}
              className={`rounded-lg border px-4 py-3 text-sm font-medium transition ${
                form.role === opt.value
                  ? 'border-brand-500 bg-brand-50 text-brand-700'
                  : 'border-black/10 text-ink/60 hover:bg-black/5'
              }`}
            >
              {opt.label}
            </button>
          ))}
        </div>

        <div>
          <label className="mb-1 block text-sm font-medium text-ink/80">Nom complet</label>
          <input
            required
            value={form.fullName}
            onChange={(e) => setForm({ ...form, fullName: e.target.value })}
            className="w-full rounded-lg border border-black/10 px-4 py-2.5 outline-none transition focus:border-brand-500"
            placeholder="Jean Dupont"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium text-ink/80">Email</label>
          <input
            type="email"
            required
            value={form.email}
            onChange={(e) => setForm({ ...form, email: e.target.value })}
            className="w-full rounded-lg border border-black/10 px-4 py-2.5 outline-none transition focus:border-brand-500"
            placeholder="vous@exemple.com"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium text-ink/80">Mot de passe</label>
          <input
            type="password"
            required
            minLength={6}
            value={form.password}
            onChange={(e) => setForm({ ...form, password: e.target.value })}
            className="w-full rounded-lg border border-black/10 px-4 py-2.5 outline-none transition focus:border-brand-500"
            placeholder="6 caractères minimum"
          />
        </div>

        {error && <p className="text-sm text-coral-600">{error}</p>}

        <button
          type="submit"
          disabled={loading}
          className="mt-2 rounded-lg bg-brand-500 py-3 text-sm font-semibold text-white shadow-card transition hover:bg-brand-600 disabled:opacity-60"
        >
          {loading ? 'Création du compte...' : 'Créer mon compte'}
        </button>
      </form>

      <p className="mt-6 text-center text-sm text-ink/60">
        Déjà un compte ?{' '}
        <Link to="/login" className="font-medium text-brand-600 hover:underline">
          Se connecter
        </Link>
      </p>
    </div>
  );
}
