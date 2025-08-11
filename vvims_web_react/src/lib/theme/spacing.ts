// Spacing system based on Flutter ScreenUtil
export const spacing = {
  // Base spacing units (similar to Flutter's .w and .h)
  xs: '4px',    // 4.w
  sm: '8px',    // 8.w
  md: '16px',   // 16.w
  lg: '24px',   // 24.w
  xl: '32px',   // 32.w
  xxl: '48px',  // 48.w
  
  // Component specific spacing
  buttonHeight: '56px',    // 56.h
  inputHeight: '48px',     // 48.h
  cardPadding: '24px',     // 24.w
  sectionSpacing: '32px',  // 32.h
  
  // Responsive spacing
  responsive: {
    xs: '8px',
    sm: '12px',
    md: '16px',
    lg: '20px',
    xl: '24px',
  }
} as const

export const borderRadius = {
  none: '0px',
  sm: '4px',
  md: '8px',
  lg: '12px',   // rounded-xl
  xl: '16px',
  full: '50%',
  button: '12px', // Based on Flutter borderRadius: 30
  input: '12px',
  card: '16px',
} as const 