'use client'

import { User, Building, Phone, Calendar, Clock as ClockIcon, Eye, Edit, CheckCircle, XCircle } from 'lucide-react'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'

interface Visitor {
  id: string
  reg_no: string
  reason: string
  visitorByVisitor: {
    firstname: string
    lastname: string
    file?: {
      file_url: string
    }
    phone_number: string
    id_number: string
  }
  status: string
  check_in_at?: string
  check_out_at?: string
  date: string
}

interface VisitorCardProps {
  visitor: Visitor
  variant?: 'dashboard' | 'full'
  onAction?: (visitorId: string, action: string) => void
  showActions?: boolean
  loading?: boolean
}

const getStatusColor = (status: string) => {
  switch (status) {
    case 'PENDING':
      return 'bg-yellow-100 text-yellow-800 border-yellow-200'
    case 'ACCEPTED':
      return 'bg-green-100 text-green-800 border-green-200'
    case 'REJECTED':
      return 'bg-red-100 text-red-800 border-red-200'
    case 'COMPLETED':
      return 'bg-blue-100 text-blue-800 border-blue-200'
    default:
      return 'bg-gray-100 text-gray-800 border-gray-200'
  }
}

const getStatusText = (status: string) => {
  switch (status) {
    case 'PENDING':
      return 'En attente'
    case 'ACCEPTED':
      return 'Approuvé'
    case 'REJECTED':
      return 'Rejeté'
    case 'COMPLETED':
      return 'Terminé'
    default:
      return 'Inconnu'
  }
}

const formatTime = (timeString: string | null) => {
  if (!timeString) return '--:--'
  
  try {
    const timeMatch = timeString.match(/(\d{2}):(\d{2}):\d{2}/)
    if (timeMatch) {
      const hours = timeMatch[1]
      const minutes = timeMatch[2]
      return `${hours}:${minutes}`
    }
    
    const date = new Date(timeString)
    return date.toLocaleTimeString('fr-FR', {
      hour: '2-digit',
      minute: '2-digit'
    })
  } catch (error) {
    return '--:--'
  }
}

export function VisitorCard({ 
  visitor, 
  variant = 'full', 
  onAction, 
  showActions = true,
  loading = false 
}: VisitorCardProps) {
  const visitorName = `${visitor.visitorByVisitor?.firstname || ''} ${visitor.visitorByVisitor?.lastname || ''}`.trim()
  const visitorPhoto = visitor.visitorByVisitor?.file?.file_url

  if (loading) {
    return (
      <Card className="bg-white border-0 shadow-sm">
        <CardContent className="p-3 md:p-4">
          <div className="flex items-start gap-3 md:gap-4">
            <div className="w-10 h-10 md:w-12 md:h-12 bg-gray-200 rounded-full animate-pulse"></div>
            <div className="flex-1 space-y-2">
              <div className="h-4 bg-gray-200 rounded animate-pulse"></div>
              <div className="h-3 bg-gray-200 rounded animate-pulse"></div>
              <div className="h-3 bg-gray-200 rounded w-2/3 animate-pulse"></div>
            </div>
          </div>
        </CardContent>
      </Card>
    )
  }

  if (variant === 'dashboard') {
    return (
      <div className="bg-gray-50 border border-gray-200 rounded-lg p-2.5 hover:shadow-md transition-all duration-300">
        {/* Header */}
        <div className="flex items-center justify-between mb-2 pb-2 border-b border-gray-200">
          <div className="flex items-center gap-1.5">
            <div className="p-1 bg-blue-100 rounded-lg">
              <Calendar className="h-2 w-2 text-blue-600" />
            </div>
            <span className="text-xs text-gray-600">Visiteur</span>
          </div>
          <div className="flex items-center gap-1.5">
            <div className="flex items-center gap-1">
              <ClockIcon className="h-2 w-2 text-gray-500" />
              <span className="text-xs text-gray-600">{formatTime(visitor.check_in_at || null)}</span>
            </div>
            <div className="flex items-center gap-1">
              <span className="text-xs text-gray-600">Aujourd'hui</span>
              <div className="w-4 h-2 bg-green-500 rounded-full relative">
                <div className="w-1 h-1 bg-white rounded-full absolute top-0.5 right-0.5"></div>
              </div>
            </div>
          </div>
        </div>

        {/* Content */}
        <div className="flex items-start gap-1.5 mb-2">
          {/* Photo */}
          <div className="w-6 h-6 bg-gray-300 rounded-full flex items-center justify-center flex-shrink-0 overflow-hidden">
            {visitorPhoto ? (
              <img 
                src={visitorPhoto} 
                alt={visitorName}
                className="w-full h-full object-cover"
              />
            ) : (
              <User className="h-3 w-3 text-gray-600" />
            )}
          </div>

          {/* Icons */}
          <div className="flex flex-col gap-0.5">
            <div className="p-0.5 bg-gray-100 rounded-lg">
              <User className="h-1.5 w-1.5 text-gray-600" />
            </div>
            <div className="p-0.5 bg-gray-100 rounded-lg">
              <Building className="h-1.5 w-1.5 text-gray-600" />
            </div>
            <div className="p-0.5 bg-gray-100 rounded-lg">
              <ClockIcon className="h-1.5 w-1.5 text-gray-600" />
            </div>
          </div>

          {/* Info */}
          <div className="flex-1 min-w-0">
            <h3 className="font-semibold text-gray-800 text-xs mb-0.5">
              {visitorName}
            </h3>
            <p className="text-xs text-gray-600 mb-0.5">
              Raison: {visitor.reason}
            </p>
            <p className="text-xs text-gray-600">
              N° {visitor.reg_no}
            </p>
          </div>
        </div>

                 {/* Actions */}
         {showActions && onAction && (
           <div className="flex gap-1.5">
             <Button
               onClick={() => onAction(visitor.id, 'reject')}
               className="flex-1 bg-red-500 hover:bg-red-600 text-white font-medium py-1 text-xs rounded-lg transition-colors"
             >
               Rejeter
             </Button>
             <Button
               onClick={() => onAction(visitor.id, 'approve')}
               className="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-medium py-1 text-xs rounded-lg transition-colors"
             >
               Approuver
             </Button>
           </div>
         )}
      </div>
    )
  }

  // Full variant (for visitors page)
  return (
    <Card className="bg-white border-0 shadow-sm hover:shadow-md transition-all duration-300">
      <CardContent className="p-2 md:p-3">
        <div className="flex items-start justify-between">
          {/* Visitor Info */}
          <div className="flex items-start gap-2 md:gap-3 flex-1">
            {/* Photo */}
            <div className="w-7 h-7 md:w-9 md:h-9 bg-gray-300 rounded-full flex items-center justify-center flex-shrink-0 overflow-hidden">
              {visitorPhoto ? (
                <img 
                  src={visitorPhoto} 
                  alt={visitorName}
                  className="w-full h-full object-cover"
                />
              ) : (
                <User className="h-3 w-3 md:h-4 md:w-4 text-gray-600" />
              )}
            </div>

            {/* Details */}
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-1 md:gap-2 mb-0.5 md:mb-1">
                <h3 className="font-semibold text-gray-900 text-xs md:text-sm">{visitorName}</h3>
                <Badge className={`${getStatusColor(visitor.status)} text-xs`}>
                  {getStatusText(visitor.status)}
                </Badge>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-0.5 md:gap-1 text-xs md:text-sm text-gray-600">
                <div className="flex items-center gap-0.5 md:gap-1">
                  <Building className="h-1.5 w-1.5 md:h-3 md:w-3" />
                  <span className="truncate text-xs md:text-sm">{visitor.reg_no}</span>
                </div>
                <div className="flex items-center gap-0.5 md:gap-1">
                  <Phone className="h-1.5 w-1.5 md:h-3 md:w-3" />
                  <span className="truncate text-xs md:text-sm">{visitor.visitorByVisitor?.phone_number || 'N/A'}</span>
                </div>
                <div className="flex items-center gap-0.5 md:gap-1">
                  <Calendar className="h-1.5 w-1.5 md:h-3 md:w-3" />
                  <span className="text-xs md:text-sm">Arrivée: {formatTime(visitor.check_in_at || null)}</span>
                </div>
                {visitor.check_out_at && (
                  <div className="flex items-center gap-0.5 md:gap-1">
                    <ClockIcon className="h-1.5 w-1.5 md:h-3 md:w-3" />
                    <span className="text-xs md:text-sm">Départ: {formatTime(visitor.check_out_at || null)}</span>
                  </div>
                )}
              </div>

              <div className="mt-1 md:mt-2">
                <p className="text-xs md:text-sm text-gray-700">
                  <strong>Motif:</strong> {visitor.reason}
                </p>
              </div>
            </div>
          </div>

          {/* Actions */}
          {showActions && (
            <div className="flex flex-col gap-0.5 md:gap-1 ml-1 md:ml-3">
              <Button
                variant="outline"
                size="sm"
                className="w-full text-xs"
              >
                <Eye className="h-1.5 w-1.5 md:h-3 md:w-3 mr-0.5 md:mr-1" />
                <span className="hidden sm:inline text-xs md:text-sm">Voir</span>
              </Button>
              {visitor.status === 'PENDING' && onAction && (
                <>
                  <Button
                    onClick={() => onAction(visitor.id, 'approve')}
                    size="sm"
                    className="w-full bg-green-600 hover:bg-green-700 text-white"
                  >
                    <CheckCircle className="h-1 w-1 md:h-2 md:w-2 mr-0.5" />
                    <span className="text-xs">Accepter</span>
                  </Button>
                  <Button
                    onClick={() => onAction(visitor.id, 'reject')}
                    size="sm"
                    className="w-full bg-red-600 hover:bg-red-700 text-white"
                  >
                    <XCircle className="h-1 w-1 md:h-2 md:w-2 mr-0.5" />
                    <span className="text-xs">Refuser</span>
                  </Button>
                </>
              )}
              {visitor.status === 'ACCEPTED' && !visitor.check_out_at && onAction && (
                <Button
                  onClick={() => onAction(visitor.id, 'clockout')}
                  size="sm"
                  className="w-full bg-blue-600 hover:bg-blue-700 text-white"
                >
                  <ClockIcon className="h-1 w-1 md:h-2 md:w-2 mr-0.5" />
                  <span className="text-xs">Départ</span>
                </Button>
              )}
            </div>
          )}
        </div>
      </CardContent>
    </Card>
  )
} 