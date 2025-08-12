/** @type {import('next').NextConfig} */

// Configuration de base
const baseConfig = {
  // Optimisations d'images
  images: {
    domains: [
      'faithful-lynx-39.hasura.app', 
      'localhost',
      '172.17.15.28' // Pour CNPS
    ],
    formats: ['image/webp', 'image/avif'],
    minimumCacheTTL: 60,
    deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
  },
  
  // Variables d'environnement
  env: {
    // Exposer l'environnement actuel côté client
    NEXT_PUBLIC_ENV: process.env.NODE_ENV,
    // Ces variables seront remplacées dynamiquement par la configuration d'environnement
    NEXT_PUBLIC_HASURA_URL: process.env.NODE_ENV === 'cnps' 
      ? 'http://172.17.15.28:30011/v1/graphql'
      : 'https://faithful-lynx-39.hasura.app/v1/graphql',
    NEXT_PUBLIC_HASURA_WS_URL: process.env.NODE_ENV === 'cnps'
      ? 'ws://172.17.15.28:30011/v1/graphql'
      : 'wss://faithful-lynx-39.hasura.app/v1/graphql',
    NEXT_PUBLIC_HASURA_ADMIN_SECRET: process.env.NODE_ENV === 'cnps'
      ? 'aFVeqGfcVsDTpS7efXQZ1rlMyIJugSBJ'
      : 'XVJdrWUXH5hdGh8ET68HtwXVJdrWUXH5hdGh8ET68Htw',
  },
  
  // Optimisations Webpack
  webpack: (config, { dev, isServer }) => {
    // Optimisations pour la production
    if (!dev && !isServer) {
      // Optimisation des chunks
      config.optimization.splitChunks = {
        chunks: 'all',
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/]/,
            name: 'vendors',
            chunks: 'all',
            priority: 10,
          },
          common: {
            name: 'common',
            minChunks: 2,
            chunks: 'all',
            priority: 5,
            reuseExistingChunk: true,
          },
        },
      }
      
      // Optimisation des modules
      config.optimization.moduleIds = 'deterministic'
      config.optimization.chunkIds = 'deterministic'
    }
    
    // Fallback pour Node.js modules
    config.resolve.fallback = {
      ...config.resolve.fallback,
      fs: false,
      net: false,
      tls: false,
    }
    
    // Optimisation des imports
    config.resolve.alias = {
      ...config.resolve.alias,
      '@': require('path').resolve(__dirname, 'src'),
    }
    
    return config
  },
  
  // Optimisations expérimentales
  experimental: {
    // Optimisation des imports de packages
    optimizePackageImports: [
      'lucide-react',
      '@radix-ui/react-icons',
      'framer-motion',
      'date-fns'
    ],
  },
  
  // Optimisations de compression
  compress: true,
  
  // Optimisations de performance
  poweredByHeader: false,
  
  // Configuration TypeScript
  typescript: {
    // Ignorer les erreurs TypeScript pendant le build (optionnel)
    ignoreBuildErrors: false,
  },
  
  // Configuration ESLint
  eslint: {
    // Ignorer les erreurs ESLint pendant le build (optionnel)
    ignoreDuringBuilds: false,
  },
  
  // Optimisations de cache
  generateEtags: false,
  
  // Optimisations de développement
  reactStrictMode: true,
}

// Configuration spécifique par environnement
const getConfig = () => {
  const isFodecc = process.env.NODE_ENV === 'fodecc'
  
  if (isFodecc) {
    // Configuration FODECC (pour export statique)
    return {
      ...baseConfig,
      output: 'export',
      // Pas de rewrites, redirects, headers pour l'export statique
    }
  } else {
    // Configuration CNPS (pour serveur local)
    return {
      ...baseConfig,
      // Pas d'export statique
      // Optimisations de sécurité
      headers: async () => {
        return [
          {
            source: '/(.*)',
            headers: [
              {
                key: 'X-Frame-Options',
                value: 'DENY',
              },
              {
                key: 'X-Content-Type-Options',
                value: 'nosniff',
              },
              {
                key: 'Referrer-Policy',
                value: 'origin-when-cross-origin',
              },
            ],
          },
        ]
      },
      
      // Optimisations de redirection
      async redirects() {
        return [
          {
            source: '/',
            destination: '/dashboard',
            permanent: false,
          },
        ]
      },
      
      // Optimisations de rewrites
      async rewrites() {
        return [
          {
            source: '/api/graphql',
            destination: process.env.NEXT_PUBLIC_HASURA_URL || 'https://faithful-lynx-39.hasura.app/v1/graphql',
          },
        ]
      },
    }
  }
}

const nextConfig = getConfig()

module.exports = nextConfig 