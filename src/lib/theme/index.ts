// Theme exports
export * from './colors'
export * from './spacing'
export * from './typography'

// Theme configuration
export const theme = {
  colors: {
    primary: '#386BF6',
    secondary: '#16DBCC',
    background: '#FFFFFF',
    text: '#0A183F',
    border: '#E3EBFF',
    success: '#52BD70',
    warning: '#FF8269',
    error: '#F96868',
  },
  spacing: {
    xs: '4px',
    sm: '8px',
    md: '16px',
    lg: '24px',
    xl: '32px',
  },
  borderRadius: {
    sm: '4px',
    md: '8px',
    lg: '12px',
    xl: '16px',
  },
  typography: {
    fontFamily: {
      sans: ['Inter', 'system-ui', 'sans-serif'],
    },
    fontSize: {
      xs: '12px',
      sm: '14px',
      base: '16px',
      lg: '18px',
      xl: '20px',
      '2xl': '24px',
    },
  },
} as const 