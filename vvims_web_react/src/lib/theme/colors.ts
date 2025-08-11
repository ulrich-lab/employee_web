// Theme colors based on Flutter app
export const colors = {
  // Primary colors
  primary: '#386BF6', // AppColor.primaryColor
  secondary: '#16DBCC', // kSecondaryColor
  
  // Background colors
  background: '#FFFFFF', // AppColor.white
  backgroundLight: '#F7F7F7', // AppColor.greyBck
  backgroundDark: '#121212',
  
  // Text colors
  textPrimary: '#0A183F', // AppColor.nameColor
  textSecondary: '#959CB1', // AppColor.hintColor
  textDisabled: '#959CB1',
  textWhite: '#FFFFFF',
  
  // Status colors
  success: '#52BD70', // AppColor.greenColor
  warning: '#FF8269', // AppColor.orangeColor
  error: '#F96868', // AppColor.redColor
  info: '#8157C6', // AppColor.violetColor
  
  // Border colors
  border: '#E3EBFF', // AppColor.borderColor
  borderLight: '#D2D9E0', // AppColor.dividerColor
  
  // Special colors
  calendarBackground: '#E5E9F4', // AppColor.backgroundCalendar
  orangeBackground: '#FEE1E1', // AppColor.orangeBackground
  checkBackground: '#E4ECFF', // AppColor.bgCheckColor
  imageBackground: '#EEF3FF', // AppColor.imagebackground
  
  // Gradients
  primaryGradient: 'linear-gradient(135deg, #386BF6 0%, #5B7CF7 100%)',
  backgroundGradient: 'linear-gradient(135deg, #386BF6 0%, #16DBCC 100%)',
  
  // Shadows
  shadowLight: '0 2px 8px rgba(56, 107, 246, 0.1)',
  shadowMedium: '0 4px 16px rgba(56, 107, 246, 0.15)',
  shadowHeavy: '0 8px 32px rgba(56, 107, 246, 0.2)',
} as const

export type ColorKey = keyof typeof colors 