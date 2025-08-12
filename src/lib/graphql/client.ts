import { ApolloClient, InMemoryCache, createHttpLink, from } from '@apollo/client'
import { setContext } from '@apollo/client/link/context'
import { onError } from '@apollo/client/link/error'
import { split, HttpLink } from '@apollo/client'
import { getMainDefinition } from '@apollo/client/utilities'
import { GraphQLWsLink } from '@apollo/client/link/subscriptions'
import { createClient } from 'graphql-ws'
import { logger } from '@/lib/utils/logger'

// Configuration des URLs GraphQL
const getGraphQLConfig = () => {
  const hasuraUrl = process.env.NEXT_PUBLIC_HASURA_URL || 'https://faithful-lynx-39.hasura.app/v1/graphql'
  const hasuraWsUrl = process.env.NEXT_PUBLIC_HASURA_WS_URL || 'wss://faithful-lynx-39.hasura.app/v1/graphql'
  const adminSecret = process.env.NEXT_PUBLIC_HASURA_ADMIN_SECRET || 'XVJdrWUXH5hdGh8ET68HtwXVJdrWUXH5hdGh8ET68Htw'
  
  return { hasuraUrl, hasuraWsUrl, adminSecret }
}

const { hasuraUrl, hasuraWsUrl, adminSecret } = getGraphQLConfig()

// HTTP Link pour les queries et mutations
const httpLink = new HttpLink({
  uri: hasuraUrl,
  credentials: 'include',
})

// WebSocket Link pour les subscriptions
const wsLink = new GraphQLWsLink(
  createClient({
    url: hasuraWsUrl,
    connectionParams: {
      headers: {
        'x-hasura-admin-secret': adminSecret,
      },
    },
  })
)

// Auth Link pour ajouter les headers d'authentification
const authLink = setContext((_, { headers }) => {
  // Récupérer le token depuis localStorage
  const token = typeof window !== 'undefined' ? localStorage.getItem('authToken') : null
  
  return {
    headers: {
      ...headers,
      'x-hasura-admin-secret': adminSecret,
      ...(token && { authorization: token }),
    },
  }
})

// Error Link pour gérer les erreurs
const errorLink = onError(({ graphQLErrors, networkError, operation, forward }) => {
            if (graphQLErrors) {
        graphQLErrors.forEach(({ message, locations, path }) => {
          logger.error(`GraphQL error: ${message}`, 'GraphQL', {
            locations,
            path,
            operation: operation.operationName
          })
        })
      }

      if (networkError) {
        logger.error(`Network error: ${networkError.message}`, 'GraphQL', {
          operation: operation.operationName
        })
    
    // Si erreur d'authentification, rediriger vers login
    if ('statusCode' in networkError && networkError.statusCode === 401) {
      if (typeof window !== 'undefined') {
        localStorage.removeItem('authToken')
        window.location.href = '/login'
      }
    }
  }
})

// Split Link pour utiliser HTTP pour queries/mutations et WebSocket pour subscriptions
const splitLink = split(
  ({ query }) => {
    const definition = getMainDefinition(query)
    return (
      definition.kind === 'OperationDefinition' &&
      definition.operation === 'subscription'
    )
  },
  wsLink,
  from([errorLink, authLink, httpLink])
)

// Configuration du cache Apollo avec des politiques optimisées
const cache = new InMemoryCache({
  typePolicies: {
    Query: {
      fields: {
        // Politique pour les employés
        employee: {
          merge(existing, incoming) {
            return incoming
          }
        },
        // Politique pour les listes d'employés
        employees: {
          merge(existing = [], incoming) {
            return incoming
          }
        },
        // Politique pour les permissions
        leaves: {
          merge(existing = [], incoming) {
            return incoming
          }
        },
        // Politique pour les visiteurs
        visitors: {
          merge(existing = [], incoming) {
            return incoming
          }
        },
        // Politique pour les présences
        attendance: {
          merge(existing = [], incoming) {
            return incoming
          }
        },
        // Politique pour les conversations
        conversations: {
          merge(existing = [], incoming) {
            return incoming
          }
        },
        // Politique pour les messages
        messages: {
          merge(existing = [], incoming) {
            return incoming
          }
        }
      }
    },
    // Politiques pour les types spécifiques
    Employee: {
      keyFields: ['id'],
      fields: {
        leaves: {
          merge(existing = [], incoming) {
            return incoming
          }
        },
        attendance: {
          merge(existing = [], incoming) {
            return incoming
          }
        }
      }
    },
    Leave: {
      keyFields: ['id'],
      fields: {
        status: {
          read(status) {
            return status || 'pending'
          }
        }
      }
    },
    Visitor: {
      keyFields: ['id'],
      fields: {
        status: {
          read(status) {
            return status || 'PENDING'
          }
        }
      }
    },
    Attendance: {
      keyFields: ['id'],
      fields: {
        clock_in_time: {
          read(time) {
            return time || null
          }
        },
        clock_out_time: {
          read(time) {
            return time || null
          }
        }
      }
    },
    Conversation: {
      keyFields: ['id'],
      fields: {
        messages: {
          merge(existing = [], incoming) {
            return incoming
          }
        }
      }
    },
    Message: {
      keyFields: ['id'],
      fields: {
        created_at: {
          read(date) {
            return date || new Date().toISOString()
          }
        }
      }
    }
  },
  // Configuration générale du cache
  addTypename: true,
  resultCaching: true,
  canonizeResults: true
})

// Configuration du client Apollo avec des optimisations
export const apolloClient = new ApolloClient({
  link: splitLink,
  cache,
  name: 'vvims-web-client',
  version: '1.0.0',
  defaultOptions: {
    watchQuery: {
      errorPolicy: 'all',
      fetchPolicy: 'cache-and-network',
      notifyOnNetworkStatusChange: true,
      returnPartialData: false
    },
    query: {
      errorPolicy: 'all',
      fetchPolicy: 'cache-first',
      returnPartialData: false
    },
    mutate: {
      errorPolicy: 'all',
      awaitRefetchQueries: true
    }
  },
  // Configuration pour le développement
  connectToDevTools: process.env.NODE_ENV === 'development'
})

// Fonction utilitaire pour nettoyer le cache
export const clearApolloCache = () => {
  apolloClient.clearStore()
  logger.info('Apollo cache cleared')
}

// Fonction utilitaire pour réinitialiser le store
export const resetApolloStore = () => {
  apolloClient.resetStore()
  logger.info('Apollo store reset')
}

// Fonction utilitaire pour obtenir les statistiques du cache
export const getCacheStats = () => {
  const cache = apolloClient.cache
  const data = cache.extract()
  const keys = Object.keys(data)
  
  logger.info(`Cache statistics: ${keys.length} total entries`, 'ApolloClient', {
    totalEntries: keys.length,
    types: keys.reduce((acc, key) => {
      const type = key.split(':')[0]
      acc[type] = (acc[type] || 0) + 1
      return acc
    }, {} as Record<string, number>)
  })
  
  return {
    totalEntries: keys.length,
    types: keys.reduce((acc, key) => {
      const type = key.split(':')[0]
      acc[type] = (acc[type] || 0) + 1
      return acc
    }, {} as Record<string, number>)
  }
} 