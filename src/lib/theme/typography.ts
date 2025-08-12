// Typography system based on Flutter app
export const typography = {
  // Font sizes (similar to Flutter's fontSize)
  xs: '12px',
  sm: '14px',
  base: '16px',
  lg: '18px',
  xl: '20px',
  '2xl': '24px',
  '3xl': '28px',
  '4xl': '32px',
  '5xl': '36px',
  
  // Font weights
  light: '300',
  normal: '400',
  medium: '500',
  semibold: '600',
  bold: '700',
  extrabold: '800',
  
  // Line heights
  tight: '1.25',
  lineHeight: '1.5',
  relaxed: '1.75',
  
  // Letter spacing
  letterSpacingTight: '-0.025em',
  letterSpacingNormal: '0em',
  wide: '0.025em',
  wider: '0.05em',
} as const

export const fontFamily = {
  sans: ['Inter', 'system-ui', 'sans-serif'],
  mono: ['JetBrains Mono', 'monospace'],
} as const 