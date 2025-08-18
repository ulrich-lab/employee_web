export type Environment = 'fodecc' | 'cnps'

export interface EnvironmentConfig {
  // API Configuration
  apiServer: string
  apiEndpoint: string
  
  // GraphQL Configuration
  hasuraUrl: string
  hasuraWsUrl: string
  hasuraAdminSecret: string
  
  // Company Information
  companyName: string
  companyDisplayName: string
  
  // Geolocation Configuration
  useStaticLocation: boolean
  staticLocation: {
    lat: number
    long: number
  } | null
  
  // Upload Configuration
  uploadType: string
  
  // Date Format Configuration
  dateFormat: {
    timeFormat: string
    dateFormat: string
  }
  
  // GraphQL Schema Differences
  graphqlSchema: {
    fileField: string // 'file' for FODECC, 'fileByPhoto' for CNPS
  }
}

export const environments: Record<Environment, EnvironmentConfig> = {
  fodecc: {
    // API Configuration
    apiServer: 'https://giscardntchinda-vvim-backend.hf.space',
    apiEndpoint: '/api/v1/',
    
    // GraphQL Configuration
    hasuraUrl: 'https://faithful-lynx-39.hasura.app/v1/graphql',
    hasuraWsUrl: 'wss://faithful-lynx-39.hasura.app/v1/graphql',
    hasuraAdminSecret: 'XVJdrWUXH5hdGh8ET68HtwXVJdrWUXH5hdGh8ET68Htw',
    
    // Company Information
    companyName: 'FODECC',
    companyDisplayName: 'FODECC / CCODEF',
    
    // Geolocation Configuration
    useStaticLocation: false,
    staticLocation: null,
    
    // Upload Configuration
    uploadType: 'online',
    
    // Date Format Configuration
    dateFormat: {
      timeFormat: "HH'h'mm",
      dateFormat: 'EEEE d MMMM'
    },
    
    // GraphQL Schema Differences
    graphqlSchema: {
      fileField: 'file'
    }
  },
  
  cnps: {
    // API Configuration
    apiServer: 'http://172.17.15.28:30000',
    apiEndpoint: '/api/v1/',
    
    // GraphQL Configuration
    hasuraUrl: 'http://172.17.15.28:30011/v1/graphql',
    hasuraWsUrl: 'ws://172.17.15.28:30011/v1/graphql',
    hasuraAdminSecret: 'aFVeqGfcVsDTpS7efXQZ1rlMyIJugSBJ',
    
    // Company Information
    companyName: 'CNPS',
    companyDisplayName: 'CNPS',
    
    // Geolocation Configuration - Coordonnées statiques pour CNPS
    useStaticLocation: true,
    staticLocation: {
      lat: 3.8764544,
      long: 11.5146752
    },
    
    // Upload Configuration
    uploadType: 'local',
    
    // Date Format Configuration
    dateFormat: {
      timeFormat: 'HH:mm:ss.SSSSSS',
      dateFormat: 'EEEE d MMMM'
    },
    
    // GraphQL Schema Differences
    graphqlSchema: {
      fileField: 'fileByPhoto'
    }
  }
}

// Fonction pour obtenir la configuration de l'environnement actuel
export const getCurrentEnvironment = (): Environment => {
  // Côté serveur, utiliser NODE_ENV
  if (typeof window === 'undefined') {
    const env = process.env.NODE_ENV as Environment
    return env === 'cnps' ? 'cnps' : 'fodecc'
  }
  
  // Côté client, utiliser NEXT_PUBLIC_ENV
  const publicEnv = process.env.NEXT_PUBLIC_ENV as Environment
  if (publicEnv === 'cnps') {
    return 'cnps'
  }
  if (publicEnv === 'fodecc') {
    return 'fodecc'
  }
  
  // Fallback: détecter via les URLs de l'API
  const currentUrl = window.location.href
  if (currentUrl.includes('172.17.15.28')) {
    return 'cnps'
  }
  
  // Par défaut, FODECC
  return 'fodecc'
}

// Fonction pour obtenir la configuration actuelle
export const getCurrentConfig = (): EnvironmentConfig => {
  const env = getCurrentEnvironment()
  return environments[env]
}

// Fonction pour vérifier si on est en mode CNPS
export const isCNPS = (): boolean => {
  return getCurrentEnvironment() === 'cnps'
}

// Fonction pour vérifier si on est en mode FODECC
export const isFODECC = (): boolean => {
  return getCurrentEnvironment() === 'fodecc'
}
