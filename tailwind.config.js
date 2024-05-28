const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio')
  ],
  theme: {
    screens: {
      sm: '640px',
      md: '768px',
      lg: '1024px',
      xl: '1280px',
    },
    colors: {
      gray: colors.gray,
      red: colors.red,
      blue: colors.blue,
      yellow: colors.amber,
      green: colors.green,
      white: colors.white,
      black: colors.black,
      transparent: 'transparent',
    },
  }
}
