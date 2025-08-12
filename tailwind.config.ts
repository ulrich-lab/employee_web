import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        // Primary colors based on Flutter app
        primary: {
          50: '#EEF3FF',
          100: '#E3EBFF',
          200: '#C7D7FF',
          300: '#A3C0FF',
          400: '#7BA3FF',
          500: '#386BF6', // Main primary color
          600: '#2E5AE8',
          700: '#2548D1',
          800: '#1F3BB3',
          900: '#1A3194',
        },
        secondary: {
          50: '#E6FDFB',
          100: '#CCFBF7',
          200: '#99F7EF',
          300: '#66F3E7',
          400: '#33EFDF',
          500: '#16DBCC', // Main secondary color
          600: '#12B0A4',
          700: '#0E857C',
          800: '#0A5A54',
          900: '#062F2C',
        },
        // Status colors
        success: '#52BD70',
        warning: '#FF8269',
        error: '#F96868',
        info: '#8157C6',
        
        // Text colors
        text: {
          primary: '#0A183F',
          secondary: '#959CB1',
          disabled: '#959CB1',
          white: '#FFFFFF',
        },
        
        // Background colors
        background: {
          primary: '#FFFFFF',
          secondary: '#F7F7F7',
          dark: '#121212',
        },
        
        // Border colors
        border: {
          primary: '#E3EBFF',
          secondary: '#D2D9E0',
        },
      },
      
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
      
      fontSize: {
        'xs': ['12px', { lineHeight: '16px' }],
        'sm': ['14px', { lineHeight: '20px' }],
        'base': ['16px', { lineHeight: '24px' }],
        'lg': ['18px', { lineHeight: '28px' }],
        'xl': ['20px', { lineHeight: '28px' }],
        '2xl': ['24px', { lineHeight: '32px' }],
        '3xl': ['28px', { lineHeight: '36px' }],
        '4xl': ['32px', { lineHeight: '40px' }],
        '5xl': ['36px', { lineHeight: '44px' }],
      },
      
      spacing: {
        'xs': '4px',
        'sm': '8px',
        'md': '16px',
        'lg': '24px',
        'xl': '32px',
        'xxl': '48px',
      },
      
      borderRadius: {
        'sm': '4px',
        'md': '8px',
        'lg': '12px',
        'xl': '16px',
        'full': '50%',
      },
      
      boxShadow: {
        'light': '0 2px 8px rgba(56, 107, 246, 0.1)',
        'medium': '0 4px 16px rgba(56, 107, 246, 0.15)',
        'heavy': '0 8px 32px rgba(56, 107, 246, 0.2)',
      },
      
      backgroundImage: {
        'primary-gradient': 'linear-gradient(135deg, #386BF6 0%, #5B7CF7 100%)',
        'background-gradient': 'linear-gradient(135deg, #386BF6 0%, #16DBCC 100%)',
      },
      
      screens: {
        'xs': '475px',
        'sm': '640px',
        'md': '768px',
        'lg': '1024px',
        'xl': '1280px',
        '2xl': '1536px',
      },
      
      animation: {
        'fade-in': 'fadeIn 0.5s ease-in-out',
        'slide-up': 'slideUp 0.3s ease-out',
        'scale-in': 'scaleIn 0.2s ease-out',
        'bounce-gentle': 'bounceGentle 2s infinite',
      },
      
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { transform: 'translateY(20px)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' },
        },
        scaleIn: {
          '0%': { transform: 'scale(0.95)', opacity: '0' },
          '100%': { transform: 'scale(1)', opacity: '1' },
        },
        bounceGentle: {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-5px)' },
        },
      },
    },
  },
  plugins: [],
}

export default config 