'use client'

import React, { Component, ReactNode } from 'react'
import { AlertCircle, RefreshCw, Home } from 'lucide-react'
import { Button } from './button'
import { Card, CardContent, CardHeader, CardTitle } from './card'
import { logger } from '@/lib/utils/logger'

interface ErrorBoundaryState {
  hasError: boolean
  error?: Error
  errorInfo?: React.ErrorInfo
}

interface ErrorBoundaryProps {
  children: ReactNode
  fallback?: ReactNode
  onError?: (error: Error, errorInfo: React.ErrorInfo) => void
  context?: string
}

class ErrorBoundary extends Component<ErrorBoundaryProps, ErrorBoundaryState> {
  constructor(props: ErrorBoundaryProps) {
    super(props)
    this.state = { hasError: false }
  }

  static getDerivedStateFromError(error: Error): ErrorBoundaryState {
    return { hasError: true, error }
  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    const { onError, context } = this.props
    
    // Logger l'erreur
    logger.error(`Error boundary caught an error: ${error.message}`, 'ErrorBoundary', {
      stack: error.stack,
      componentStack: errorInfo.componentStack,
      context
    })

    // Appeler le callback personnalisé si fourni
    if (onError) {
      onError(error, errorInfo)
    }

    this.setState({
      error,
      errorInfo
    })
  }

  handleRetry = () => {
    this.setState({ hasError: false, error: undefined, errorInfo: undefined })
  }

  handleGoHome = () => {
    if (typeof window !== 'undefined') {
      window.location.href = '/dashboard'
    }
  }

  render() {
    if (this.state.hasError) {
      const { fallback, context } = this.props
      const { error, errorInfo } = this.state

      // Si un fallback personnalisé est fourni, l'utiliser
      if (fallback) {
        return fallback
      }

      // Fallback par défaut
      return (
        <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
          <Card className="max-w-md w-full">
            <CardHeader className="text-center">
              <div className="mx-auto mb-4 p-3 bg-red-100 rounded-full w-fit">
                <AlertCircle className="h-8 w-8 text-red-600" />
              </div>
              <CardTitle className="text-xl font-bold text-gray-900">
                Oups ! Quelque chose s'est mal passé
              </CardTitle>
            </CardHeader>
            
            <CardContent className="space-y-4">
              <p className="text-gray-600 text-center">
                Une erreur inattendue s'est produite. Veuillez réessayer ou retourner à l'accueil.
              </p>
              
              {process.env.NODE_ENV === 'development' && error && (
                <details className="bg-gray-100 p-3 rounded-lg">
                  <summary className="cursor-pointer font-medium text-gray-700 mb-2">
                    Détails de l'erreur (développement)
                  </summary>
                  <div className="text-xs text-gray-600 space-y-2">
                    <div>
                      <strong>Message:</strong> {error.message}
                    </div>
                    {errorInfo && (
                      <div>
                        <strong>Stack:</strong>
                        <pre className="mt-1 bg-gray-200 p-2 rounded text-xs overflow-auto">
                          {errorInfo.componentStack}
                        </pre>
                      </div>
                    )}
                    {context && (
                      <div>
                        <strong>Contexte:</strong> {context}
                      </div>
                    )}
                  </div>
                </details>
              )}
              
              <div className="flex gap-3">
                <Button
                  onClick={this.handleRetry}
                  className="flex-1 bg-blue-600 hover:bg-blue-700"
                >
                  <RefreshCw className="h-4 w-4 mr-2" />
                  Réessayer
                </Button>
                
                <Button
                  onClick={this.handleGoHome}
                  variant="outline"
                  className="flex-1"
                >
                  <Home className="h-4 w-4 mr-2" />
                  Accueil
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )
    }

    return this.props.children
  }
}

// Composant optimisé avec React.memo pour les erreurs simples
interface ErrorDisplayProps {
  error: Error
  onRetry?: () => void
  onGoHome?: () => void
  context?: string
}

const ErrorDisplay = React.memo<ErrorDisplayProps>(({ 
  error, 
  onRetry, 
  onGoHome, 
  context 
}) => {
  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <Card className="max-w-md w-full">
        <CardHeader className="text-center">
          <div className="mx-auto mb-4 p-3 bg-red-100 rounded-full w-fit">
            <AlertCircle className="h-8 w-8 text-red-600" />
          </div>
          <CardTitle className="text-xl font-bold text-gray-900">
            Erreur
          </CardTitle>
        </CardHeader>
        
        <CardContent className="space-y-4">
          <p className="text-gray-600 text-center">
            {error.message || 'Une erreur s\'est produite'}
          </p>
          
          {context && (
            <p className="text-sm text-gray-500 text-center">
              Contexte: {context}
            </p>
          )}
          
          <div className="flex gap-3">
            {onRetry && (
              <Button
                onClick={onRetry}
                className="flex-1 bg-blue-600 hover:bg-blue-700"
              >
                <RefreshCw className="h-4 w-4 mr-2" />
                Réessayer
              </Button>
            )}
            
            {onGoHome && (
              <Button
                onClick={onGoHome}
                variant="outline"
                className="flex-1"
              >
                <Home className="h-4 w-4 mr-2" />
                Accueil
              </Button>
            )}
          </div>
        </CardContent>
      </Card>
    </div>
  )
})

ErrorDisplay.displayName = 'ErrorDisplay'

// Hook pour utiliser l'ErrorBoundary dans les composants fonctionnels
export const useErrorHandler = (context?: string) => {
  const handleError = React.useCallback((error: Error, errorInfo?: React.ErrorInfo) => {
    logger.error(`Error caught by useErrorHandler: ${error.message}`, context || 'useErrorHandler', {
      stack: error.stack,
      componentStack: errorInfo?.componentStack
    })
  }, [context])

  return { handleError }
}

// Composant de chargement optimisé
export const LoadingSpinner = React.memo(() => (
  <div className="min-h-screen bg-gray-50 flex items-center justify-center">
    <div className="text-center">
      <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
      <p className="text-gray-600">Chargement...</p>
    </div>
  </div>
))

LoadingSpinner.displayName = 'LoadingSpinner'

// Composant de fallback pour les erreurs de réseau
export const NetworkError = React.memo<{ onRetry?: () => void }>(({ onRetry }) => (
  <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
    <Card className="max-w-md w-full">
      <CardHeader className="text-center">
        <div className="mx-auto mb-4 p-3 bg-yellow-100 rounded-full w-fit">
          <AlertCircle className="h-8 w-8 text-yellow-600" />
        </div>
        <CardTitle className="text-xl font-bold text-gray-900">
          Problème de connexion
        </CardTitle>
      </CardHeader>
      
      <CardContent className="space-y-4">
        <p className="text-gray-600 text-center">
          Impossible de se connecter au serveur. Vérifiez votre connexion internet et réessayez.
        </p>
        
        {onRetry && (
          <Button
            onClick={onRetry}
            className="w-full bg-blue-600 hover:bg-blue-700"
          >
            <RefreshCw className="h-4 w-4 mr-2" />
            Réessayer
          </Button>
        )}
      </CardContent>
    </Card>
  </div>
))

NetworkError.displayName = 'NetworkError'

export { ErrorBoundary, ErrorDisplay }
export default ErrorBoundary
