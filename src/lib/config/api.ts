import { getCurrentConfig } from './environments'

// Fonction pour obtenir la configuration API dynamique
export const getApiConfig = () => {
  const config = getCurrentConfig()
  
  return {
    // Base URL dynamique
    SERVER: config.apiServer,
    API_ENDPOINT: config.apiEndpoint,
    
    // Endpoints
    LOGIN: "/api/v1/login",
    LOGOUT: "/logout",
    REFRESH_TOKEN: "/refresh-token",
    PROFILE: "/me",
    DASHBOARD: "/dashboard",
    VISITORS: "/visitors",
    ATTENDANCE: "/attendance/user/status",
    EMPLOYEES: "/employee",
    
    // Timeout configuration
    TIMEOUT: 10000, // 10 secondes
    
    // Configuration d'environnement
    UPLOAD_TYPE: config.uploadType,
    USE_STATIC_LOCATION: config.useStaticLocation,
    STATIC_LOCATION: config.staticLocation,
  } as const
}

// Configuration API dynamique basée sur l'environnement
export const API_CONFIG = getApiConfig()

// Fonction pour construire l'URL complète
export const buildApiUrl = (endpoint: string): string => {
  const config = getApiConfig()
  return `${config.SERVER}${endpoint}`
}

// Fonction pour faire une requête avec timeout
export const apiRequest = async (
  url: string, 
  options: RequestInit = {}, 
  timeout?: number
): Promise<Response> => {
  const config = getApiConfig()
  const requestTimeout = timeout || config.TIMEOUT
  const controller = new AbortController()
  const timeoutId = setTimeout(() => controller.abort(), requestTimeout)
  
  try {
    const response = await fetch(url, {
      ...options,
      signal: controller.signal,
    })
    clearTimeout(timeoutId)
    return response
  } catch (error) {
    clearTimeout(timeoutId)
    if (error instanceof Error && error.name === 'AbortError') {
      throw new Error('La requête a pris trop de temps. Veuillez réessayer.')
    }
    throw error
  }
} 