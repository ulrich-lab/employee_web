'use client'

import { useState } from 'react'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { Users, Search, Filter, Plus, Calendar, Clock, User, Building, Phone, Mail, MapPin, Eye, Edit, Trash2, CheckCircle, XCircle, Clock as ClockIcon } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Badge } from '@/components/ui/badge'
import { useVisitors, useAcceptVisit, useRejectVisit, useClockOutVisit } from '@/lib/graphql/hooks'
import { useAuthStore } from '@/store/auth-store'
import { VisitorCard } from '@/components/ui/visitor-card'

// Types
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

export default function VisitorsPage() {
  const { t } = useTranslation()
  const { user } = useAuthStore()
  const [searchTerm, setSearchTerm] = useState('')
  const [statusFilter, setStatusFilter] = useState<string>('all')
  const [showAddModal, setShowAddModal] = useState(false)

  // GraphQL hooks
  const { visitors, loading: visitorsLoading, error: visitorsError } = useVisitors(user?.id || '')
  const { acceptVisit, loading: acceptLoading } = useAcceptVisit()
  const { rejectVisit, loading: rejectLoading } = useRejectVisit()
  const { clockOutVisit, loading: clockOutLoading } = useClockOutVisit()

  // Filter visitors based on search and status
  const filteredVisitors = visitors.filter((visitor: any) => {
    const visitorName = `${visitor.visitorByVisitor?.firstname || ''} ${visitor.visitorByVisitor?.lastname || ''}`.trim()
    const matchesSearch = visitorName.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         visitor.reason.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         visitor.visitorByVisitor?.phone_number?.toLowerCase().includes(searchTerm.toLowerCase())
    const matchesStatus = statusFilter === 'all' || visitor.status === statusFilter
    return matchesSearch && matchesStatus
  })

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
        return t('visitors.pending')
      case 'ACCEPTED':
        return t('visitors.approved')
      case 'REJECTED':
        return t('visitors.rejected')
      case 'COMPLETED':
        return t('visitors.checkedOut')
      default:
        return t('common.unknown')
    }
  }

  const handleVisitorAction = async (visitorId: string, action: string) => {
    try {
      if (action === 'approve') {
        await acceptVisit(visitorId)
      } else if (action === 'reject') {
        await rejectVisit(visitorId)
      } else if (action === 'clockout') {
        await clockOutVisit(visitorId)
      }
    } catch (error) {
      console.error('Erreur lors de l\'action sur le visiteur:', error)
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

  return (
    <div className="space-y-4 md:space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2 md:gap-3">
          <div className="p-1.5 md:p-2 bg-blue-100 rounded-lg">
            <Users className="h-4 w-4 md:h-5 md:w-5 text-blue-600" />
          </div>
          <div>
            <h1 className="text-base md:text-xl font-bold text-gray-900">
              {t('navigation.visitors')}
            </h1>
            <p className="hidden md:block text-xs md:text-sm text-gray-600">
              Gestion des visiteurs et des accès
            </p>
          </div>
        </div>
        <Button
          onClick={() => setShowAddModal(true)}
          size="sm"
          className="bg-blue-600 hover:bg-blue-700 text-white text-xs"
        >
          <Plus className="h-3 w-3 mr-1" />
          <span className="hidden sm:inline">Ajouter un visiteur</span>
          <span className="sm:hidden">Ajouter</span>
        </Button>
      </div>

      {/* Filters and Search */}
      <Card className="bg-white border-0 shadow-sm">
        <CardContent className="p-3 md:p-4">
          <div className="flex flex-col md:flex-row gap-3 md:gap-4">
            {/* Search */}
            <div className="flex-1">
              <div className="relative">
                <Search className="absolute left-2 md:left-3 top-1/2 transform -translate-y-1/2 h-3 w-3 md:h-4 md:w-4 text-gray-400" />
                <Input
                  placeholder="Rechercher un visiteur..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-7 md:pl-10 text-xs md:text-sm"
                />
              </div>
            </div>

            {/* Status Filter */}
            <div className="flex gap-1 md:gap-2">
              <Button
                variant={statusFilter === 'all' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setStatusFilter('all')}
                className="text-xs px-1.5 md:px-3 py-1 md:py-2"
              >
                {t('common.all')}
              </Button>
              <Button
                variant={statusFilter === 'PENDING' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setStatusFilter('PENDING')}
                className="text-xs px-1.5 md:px-3 py-1 md:py-2"
              >
                {t('visitors.pending')}
              </Button>
              <Button
                variant={statusFilter === 'ACCEPTED' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setStatusFilter('ACCEPTED')}
                className="text-xs px-1.5 md:px-3 py-1 md:py-2"
              >
                {t('visitors.approved')}
              </Button>
              <Button
                variant={statusFilter === 'COMPLETED' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setStatusFilter('COMPLETED')}
                className="text-xs px-1.5 md:px-3 py-1 md:py-2"
              >
                {t('visitors.checkedOut')}
              </Button>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Visitors List */}
      <div className="grid gap-3 md:gap-4">
        {visitorsLoading ? (
          // Loading skeleton
          Array.from({ length: 3 }).map((_, index) => (
            <Card key={index} className="bg-white border-0 shadow-sm">
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
          ))
        ) : visitorsError ? (
          // Error state
          <Card className="bg-white border-0 shadow-sm">
            <CardContent className="p-6 md:p-8">
              <div className="text-center">
                <Users className="h-10 w-10 md:h-12 md:w-12 text-red-400 mx-auto mb-3 md:mb-4" />
                <h3 className="text-base md:text-lg font-semibold text-gray-900 mb-1 md:mb-2">
                  {t('systemMessages.dataLoadError')}
                </h3>
                <p className="text-xs md:text-sm text-gray-600">
                  {t('systemMessages.dataLoadError')}
                </p>
              </div>
            </CardContent>
          </Card>
        ) : (
          // Visitors list
          filteredVisitors.map((visitor: any) => (
            <VisitorCard
              key={visitor.id}
              visitor={visitor}
              variant="full"
              onAction={handleVisitorAction}
              showActions={true}
            />
          ))
        )}
      </div>

      {/* Empty State */}
      {!visitorsLoading && !visitorsError && filteredVisitors.length === 0 && (
        <Card className="bg-white border-0 shadow-sm">
          <CardContent className="p-6 md:p-8">
            <div className="text-center">
              <Users className="h-10 w-10 md:h-12 md:w-12 text-gray-400 mx-auto mb-3 md:mb-4" />
              <h3 className="text-base md:text-lg font-semibold text-gray-900 mb-1 md:mb-2">
                {t('visitors.noVisitors')}
              </h3>
              <p className="text-xs md:text-sm text-gray-600 mb-3 md:mb-4">
                {searchTerm || statusFilter !== 'all' 
                  ? t('visitors.noVisitors')
                  : t('visitors.noVisitors')
                }
              </p>
              <Button
                onClick={() => setShowAddModal(true)}
                className="bg-blue-600 hover:bg-blue-700 text-white text-xs md:text-sm"
              >
                <Plus className="h-3 w-3 md:h-4 md:w-4 mr-1 md:mr-2" />
                <span className="hidden sm:inline">Ajouter le premier visiteur</span>
                <span className="sm:hidden">Ajouter</span>
              </Button>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Add Visitor Modal */}
      {showAddModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-3 md:p-4">
          <div className="bg-white rounded-lg max-w-md w-full max-h-[90vh] overflow-y-auto">
            <div className="p-4 md:p-6">
              <div className="flex items-center justify-between mb-4 md:mb-6">
                <h2 className="text-lg md:text-xl font-bold text-gray-900">Ajouter un visiteur</h2>
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => setShowAddModal(false)}
                >
                  ✕
                </Button>
              </div>

              <div className="space-y-3 md:space-y-4">
                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Nom complet
                  </label>
                  <Input placeholder="Nom du visiteur" className="text-xs md:text-sm" />
                </div>

                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Entreprise
                  </label>
                  <Input placeholder="Nom de l'entreprise" className="text-xs md:text-sm" />
                </div>

                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Email
                  </label>
                  <Input type="email" placeholder="email@exemple.com" className="text-xs md:text-sm" />
                </div>

                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Téléphone
                  </label>
                  <Input placeholder="+33 6 12 34 56 78" className="text-xs md:text-sm" />
                </div>

                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Motif de la visite
                  </label>
                  <Input placeholder="Raison de la visite" className="text-xs md:text-sm" />
                </div>

                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Hôte
                  </label>
                  <Input placeholder="Nom de l'hôte" className="text-xs md:text-sm" />
                </div>

                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Date et heure d'arrivée
                  </label>
                  <Input type="datetime-local" className="text-xs md:text-sm" />
                </div>

                <div className="flex gap-2 md:gap-3 pt-3 md:pt-4">
                  <Button
                    onClick={() => setShowAddModal(false)}
                    variant="outline"
                    className="flex-1 text-xs md:text-sm"
                  >
                    Annuler
                  </Button>
                  <Button className="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-xs md:text-sm">
                    Ajouter le visiteur
                  </Button>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  )
} 