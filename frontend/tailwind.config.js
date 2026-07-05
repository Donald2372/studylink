/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,jsx}'],
  theme: {
    extend: {
      colors: {
        ink: '#0F172A',
        brand: {
          50: '#EFF4FF',
          100: '#DBE6FF',
          200: '#BFD3FF',
          300: '#93B4FF',
          400: '#6090FF',
          500: '#2563EB',
          600: '#1D4FD8',
          700: '#1A44BD',
          800: '#1B3C99',
          900: '#1B3578',
        },
        navy: {
          900: '#0A1B3D',
          950: '#050E24',
        },
        coral: {
          400: '#FF8B6B',
          500: '#FF4D4F',
          600: '#EA4E27',
        },
        mint: {
          400: '#3ECF8E',
          500: '#22C55E',
        },
      },
      fontFamily: {
        display: ['"Inter"', 'system-ui', 'sans-serif'],
        sans: ['"Inter"', 'system-ui', 'sans-serif'],
      },
      boxShadow: {
        card: '0 1px 2px rgba(15, 23, 42, 0.04), 0 4px 12px rgba(15, 23, 42, 0.06)',
        pop: '0 8px 30px rgba(15, 23, 42, 0.12)',
        nav: '0 -1px 12px rgba(15, 23, 42, 0.06)',
      },
      borderRadius: {
        xl2: '1.25rem',
      },
    },
  },
  plugins: [],
};
