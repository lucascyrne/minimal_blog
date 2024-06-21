// tailwind.config.js
module.exports = {
  content: [
    './app/views/**/*.{html,erb}',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.{js,jsx,ts,tsx}',
    // Adicione mais padrões se você tiver outros diretórios onde classes Tailwind são usadas.
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
