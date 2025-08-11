// Logger centralisé pour remplacer console.log/error/warn
type LogLevel = 'debug' | 'info' | 'warn' | 'error'

interface LogEntry {
  level: LogLevel
  message: string
  timestamp: string
  context?: string
  data?: any
}

class Logger {
  private isDevelopment = process.env.NODE_ENV === 'development'
  private isProduction = process.env.NODE_ENV === 'production'
  private logs: LogEntry[] = []

  private formatMessage(level: LogLevel, message: string, context?: string, data?: any): string {
    const timestamp = new Date().toISOString()
    const contextStr = context ? `[${context}]` : ''
    return `${timestamp} ${level.toUpperCase()} ${contextStr} ${message}`
  }

  private shouldLog(level: LogLevel): boolean {
    if (this.isDevelopment) return true
    
    // En production, on ne log que les warnings et erreurs
    if (this.isProduction) {
      return level === 'warn' || level === 'error'
    }
    
    return true
  }

  private addToLogs(entry: LogEntry) {
    this.logs.push(entry)
    
    // Limiter la taille du log en mémoire (garder les 1000 dernières entrées)
    if (this.logs.length > 1000) {
      this.logs = this.logs.slice(-1000)
    }
  }

  debug(message: string, context?: string, data?: any) {
    if (!this.shouldLog('debug')) return
    
    const entry: LogEntry = {
      level: 'debug',
      message,
      timestamp: new Date().toISOString(),
      context,
      data
    }
    
    this.addToLogs(entry)
    
    if (this.isDevelopment) {
      console.log(this.formatMessage('debug', message, context), data || '')
    }
  }

  info(message: string, context?: string, data?: any) {
    if (!this.shouldLog('info')) return
    
    const entry: LogEntry = {
      level: 'info',
      message,
      timestamp: new Date().toISOString(),
      context,
      data
    }
    
    this.addToLogs(entry)
    
    if (this.isDevelopment) {
      console.info(this.formatMessage('info', message, context), data || '')
    }
  }

  warn(message: string, context?: string, data?: any) {
    const entry: LogEntry = {
      level: 'warn',
      message,
      timestamp: new Date().toISOString(),
      context,
      data
    }
    
    this.addToLogs(entry)
    console.warn(this.formatMessage('warn', message, context), data || '')
  }

  error(message: string, context?: string, error?: any) {
    const entry: LogEntry = {
      level: 'error',
      message,
      timestamp: new Date().toISOString(),
      context,
      data: error
    }
    
    this.addToLogs(entry)
    console.error(this.formatMessage('error', message, context), error || '')
    
    // En production, on pourrait envoyer les erreurs à un service de monitoring
    if (this.isProduction && error) {
      // TODO: Intégrer avec un service comme Sentry, LogRocket, etc.
      // this.sendToMonitoringService(entry)
    }
  }

  // Méthode pour récupérer les logs (utile pour le debugging)
  getLogs(level?: LogLevel): LogEntry[] {
    if (level) {
      return this.logs.filter(log => log.level === level)
    }
    return [...this.logs]
  }

  // Méthode pour nettoyer les logs
  clearLogs() {
    this.logs = []
  }

  // Méthode pour exporter les logs
  exportLogs(): string {
    return JSON.stringify(this.logs, null, 2)
  }
}

// Instance singleton du logger
export const logger = new Logger()

// Hooks pour faciliter l'utilisation dans les composants React
export const useLogger = (context?: string) => {
  return {
    debug: (message: string, data?: any) => logger.debug(message, context, data),
    info: (message: string, data?: any) => logger.info(message, context, data),
    warn: (message: string, data?: any) => logger.warn(message, context, data),
    error: (message: string, error?: any) => logger.error(message, context, error)
  }
}

// Fonctions utilitaires pour les cas d'usage courants
export const logError = (message: string, error?: any, context?: string) => {
  logger.error(message, context, error)
}

export const logInfo = (message: string, data?: any, context?: string) => {
  logger.info(message, context, data)
}

export const logWarning = (message: string, data?: any, context?: string) => {
  logger.warn(message, context, data)
}

export const logDebug = (message: string, data?: any, context?: string) => {
  logger.debug(message, context, data)
}
