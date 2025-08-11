'use client'

import { useState, useEffect, useMemo, useCallback } from 'react'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { Calendar, Clock, Users, MapPin, Video, FileText, Plus, CheckCircle, XCircle, Clock as ClockIcon, AlertCircle, CalendarDays, Briefcase, MessageSquare, Edit, Trash2 } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Badge } from '@/components/ui/badge'
import { useAuthStore } from '@/store/auth-store'
import { useEmployeeLeaves, useInsertLeave, useUpdateLeave, useDeleteLeave } from '@/lib/graphql/hooks'
import toast from 'react-hot-toast'

// Types
interface Leave {
  id: string
  leave_type: string
  start_date: string
  end_date: string
  comment?: string
  other_description?: string
  status: string
  employee_id: string
  created_at: string
  updated_at: string
}

interface Permission {
  id: string
  type: 'vacation' | 'sick' | 'personal' | 'other'
  startDate: string
  endDate: string
  reason: string
  status: 'pending' | 'approved' | 'rejected'
  submittedAt: string
  approvedBy?: string
  notes?: string
}

interface Mission {
  id: string
  title: string
  description: string
  location: string
  startDate: string
  endDate: string
  status: 'upcoming' | 'ongoing' | 'completed'
  priority: 'low' | 'medium' | 'high'
  assignedBy: string
}

interface Meeting {
  id: string
  title: string
  description: string
  startTime: string
  endTime: string
  date: string
  platform: 'zoom' | 'teams' | 'google-meet' | 'other'
  participants: string[]
  status: 'scheduled' | 'ongoing' | 'completed' | 'cancelled'
  meetingLink?: string
}

export default function SchedulePage() {
  const { t } = useTranslation()
  const { user } = useAuthStore()
  const [activeTab, setActiveTab] = useState<'permissions' | 'missions' | 'meetings'>('permissions')
  const [showPermissionModal, setShowPermissionModal] = useState(false)
  const [editingPermission, setEditingPermission] = useState<Leave | null>(null)
  const [formData, setFormData] = useState({
    type: 'vacation',
    startDate: '',
    endDate: '',
    reason: ''
  })

  // GraphQL hooks
  const { leaves, loading, error, refetch } = useEmployeeLeaves(user?.id || '')
  const { insertLeave, loading: insertLoading } = useInsertLeave()
  const { updateLeave, loading: updateLoading } = useUpdateLeave()
  const { deleteLeave, loading: deleteLoading } = useDeleteLeave()

  // Reset form when modal opens/closes
  useEffect(() => {
    if (!showPermissionModal) {
      setFormData({
        type: 'vacation',
        startDate: '',
        endDate: '',
        reason: ''
      })
      setEditingPermission(null)
    }
  }, [showPermissionModal])

  // Set form data when editing
  useEffect(() => {
    if (editingPermission) {
      setFormData({
        type: mapEnumToLeaveType(editingPermission.leave_type),
        startDate: editingPermission.start_date,
        endDate: editingPermission.end_date,
        reason: editingPermission.comment || ''
      })
    }
  }, [editingPermission])

  // Memoized form submission handler
  const handleSubmit = useCallback(async (e: React.FormEvent) => {
    e.preventDefault()
    
    if (!user?.id) {
      toast.error('Utilisateur non connecté')
      return
    }

    if (!formData.startDate || !formData.endDate || !formData.reason) {
      toast.error('Veuillez remplir tous les champs obligatoires')
      return
    }

    try {
      if (editingPermission) {
        // Update existing permission
        await updateLeave(editingPermission.id, {
          leave_type: mapLeaveTypeToEnum(formData.type),
          start_date: formData.startDate,
          end_date: formData.endDate,
          comment: formData.reason
        })
        toast.success('Permission mise à jour avec succès')
      } else {
        // Create new permission
        await insertLeave({
          employee_id: user.id,
          leave_type: mapLeaveTypeToEnum(formData.type),
          start_date: formData.startDate,
          end_date: formData.endDate,
          comment: formData.reason
        })
        toast.success('Demande de permission soumise avec succès')
      }
      
      setShowPermissionModal(false)
      refetch()
    } catch (error) {
      console.error('Erreur:', error)
    }
  }, [user?.id, formData, editingPermission, updateLeave, insertLeave, refetch])

  // Memoized delete handler
  const handleDelete = useCallback(async (permissionId: string) => {
    if (confirm('Êtes-vous sûr de vouloir supprimer cette permission ?')) {
      try {
        await deleteLeave(permissionId)
        refetch()
      } catch (error) {
        console.error('Erreur lors de la suppression:', error)
      }
    }
  }, [deleteLeave, refetch])

  // Memoized edit handler
  const handleEdit = useCallback((permission: Leave) => {
    setEditingPermission(permission)
    setShowPermissionModal(true)
  }, [])

  // Memoized utility functions
  const mapLeaveTypeToEnum = useCallback((uiType: string): string => {
    switch (uiType) {
      case 'vacation':
        return 'VACATION'
      case 'sick':
        return 'SICK'
      case 'personal':
        return 'OTHER'
      case 'other':
        return 'OTHER'
      default:
        return 'OTHER'
    }
  }, [])

  const mapEnumToLeaveType = useCallback((enumType: string): string => {
    switch (enumType) {
      case 'VACATION':
        return 'vacation'
      case 'SICK':
        return 'sick'
      case 'OTHER':
        return 'personal'
      default:
        return 'other'
    }
  }, [])

  // Memoized permission type functions
  const getPermissionTypeText = useCallback((type: string) => {
    switch (type) {
      case 'vacation':
        return 'Vacances'
      case 'sick':
        return 'Maladie'
      case 'personal':
        return 'Personnel'
      case 'other':
        return 'Autre'
      default:
        return 'Inconnu'
    }
  }, [])

  const getPermissionTypeColor = useCallback((type: string) => {
    switch (type) {
      case 'vacation':
        return 'bg-blue-100 text-blue-800 border-blue-200'
      case 'sick':
        return 'bg-red-100 text-red-800 border-red-200'
      case 'personal':
        return 'bg-purple-100 text-purple-800 border-purple-200'
      case 'other':
        return 'bg-gray-100 text-gray-800 border-gray-200'
      default:
        return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }, [])

  // Memoized status functions
  const getStatusColor = useCallback((status: string) => {
    switch (status) {
      case 'pending':
        return 'bg-yellow-100 text-yellow-800 border-yellow-200'
      case 'approved':
        return 'bg-green-100 text-green-800 border-green-200'
      case 'rejected':
        return 'bg-red-100 text-red-800 border-red-200'
      case 'upcoming':
        return 'bg-blue-100 text-blue-800 border-blue-200'
      case 'ongoing':
        return 'bg-orange-100 text-orange-800 border-orange-200'
      case 'completed':
        return 'bg-green-100 text-green-800 border-green-200'
      case 'scheduled':
        return 'bg-purple-100 text-purple-800 border-purple-200'
      case 'cancelled':
        return 'bg-gray-100 text-gray-800 border-gray-200'
      default:
        return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }, [])

  const getStatusText = useCallback((status: string) => {
    switch (status) {
      case 'pending':
        return 'En attente'
      case 'approved':
        return 'Approuvé'
      case 'rejected':
        return 'Rejeté'
      case 'upcoming':
        return 'À venir'
      case 'ongoing':
        return 'En cours'
      case 'completed':
        return 'Terminé'
      case 'scheduled':
        return 'Programmé'
      case 'cancelled':
        return 'Annulé'
      default:
        return 'Inconnu'
    }
  }, [])

  // Memoized priority functions
  const getPriorityColor = useCallback((priority: string) => {
    switch (priority) {
      case 'high':
        return 'bg-red-100 text-red-800 border-red-200'
      case 'medium':
        return 'bg-yellow-100 text-yellow-800 border-yellow-200'
      case 'low':
        return 'bg-green-100 text-green-800 border-green-200'
      default:
        return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }, [])

  const getPriorityText = useCallback((priority: string) => {
    switch (priority) {
      case 'high':
        return 'Haute'
      case 'medium':
        return 'Moyenne'
      case 'low':
        return 'Basse'
      default:
        return 'Inconnue'
    }
  }, [])

  // Memoized platform icon function
  const getPlatformIcon = useCallback((platform: string) => {
    switch (platform) {
      case 'zoom':
        return '🔵'
      case 'teams':
        return '🔷'
      case 'google-meet':
        return '🟢'
      default:
        return '📹'
    }
  }, [])

  // Memoized date formatting functions
  const formatDate = useCallback((dateString: string) => {
    const date = new Date(dateString)
    return date.toLocaleDateString('fr-FR', {
      day: 'numeric',
      month: 'short'
    })
  }, [])

  const formatDateTime = useCallback((dateString: string, timeString: string) => {
    const date = new Date(`${dateString}T${timeString}`)
    return date.toLocaleString('fr-FR', {
      day: 'numeric',
      month: 'short',
      hour: '2-digit',
      minute: '2-digit'
    })
  }, [])

  // Memoized simulated data
  const permissions: Permission[] = useMemo(() => [
    {
      id: '1',
      type: 'vacation',
      startDate: '2024-02-15',
      endDate: '2024-02-20',
      reason: 'Vacances familiales',
      status: 'approved',
      submittedAt: '2024-01-20',
      approvedBy: 'Marie Martin',
      notes: 'Approuvé par le manager'
    },
    {
      id: '2',
      type: 'sick',
      startDate: '2024-01-25',
      endDate: '2024-01-26',
      reason: 'Maladie',
      status: 'approved',
      submittedAt: '2024-01-24',
      approvedBy: 'Pierre Durand'
    },
    {
      id: '3',
      type: 'personal',
      startDate: '2024-02-10',
      endDate: '2024-02-10',
      reason: 'Rendez-vous médical',
      status: 'pending',
      submittedAt: '2024-01-30'
    },
    {
      id: '4',
      type: 'other',
      startDate: '2024-02-28',
      endDate: '2024-02-28',
      reason: 'Formation externe',
      status: 'rejected',
      submittedAt: '2024-01-25',
      notes: 'Formation non approuvée par la direction'
    }
  ], [])

  const missions: Mission[] = useMemo(() => [
    {
      id: '1',
      title: 'Audit client TechCorp',
      description: 'Réaliser un audit de sécurité pour le client TechCorp',
      location: 'Paris, France',
      startDate: '2024-02-05',
      endDate: '2024-02-09',
      status: 'upcoming',
      priority: 'high',
      assignedBy: 'Directeur Technique'
    },
    {
      id: '2',
      title: 'Formation équipe',
      description: 'Former l\'équipe sur les nouvelles procédures',
      location: 'Bureau principal',
      startDate: '2024-01-30',
      endDate: '2024-01-30',
      status: 'ongoing',
      priority: 'medium',
      assignedBy: 'Responsable Formation'
    },
    {
      id: '3',
      title: 'Réunion partenaire',
      description: 'Rencontre avec le partenaire commercial',
      location: 'Lyon, France',
      startDate: '2024-02-15',
      endDate: '2024-02-15',
      status: 'upcoming',
      priority: 'low',
      assignedBy: 'Directeur Commercial'
    }
  ], [])

  const meetings: Meeting[] = useMemo(() => [
    {
      id: '1',
      title: 'Réunion équipe hebdomadaire',
      description: 'Point sur les projets en cours',
      startTime: '09:00',
      endTime: '10:00',
      date: '2024-02-05',
      platform: 'zoom',
      participants: ['Marie Martin', 'Pierre Durand', 'Julie Moreau'],
      status: 'scheduled',
      meetingLink: 'https://zoom.us/j/123456789'
    },
    {
      id: '2',
      title: 'Présentation projet',
      description: 'Présentation du nouveau projet client',
      startTime: '14:00',
      endTime: '15:30',
      date: '2024-02-06',
      platform: 'teams',
      participants: ['Équipe projet', 'Client'],
      status: 'scheduled'
    },
    {
      id: '3',
      title: 'Formation sécurité',
      description: 'Formation sur les nouvelles procédures de sécurité',
      startTime: '10:00',
      endTime: '12:00',
      date: '2024-02-07',
      platform: 'google-meet',
      participants: ['Tous les employés'],
      status: 'scheduled'
    }
  ], [])

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Chargement des permissions...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="text-center">
          <AlertCircle className="h-12 w-12 text-red-600 mx-auto mb-4" />
          <p className="text-red-600">Erreur lors du chargement des permissions</p>
          <p className="text-sm text-gray-600 mt-2">Détails: {typeof error === 'string' ? error : error?.message || 'Erreur inconnue'}</p>
          <p className="text-sm text-gray-600 mt-1">User ID: {user?.id || 'Non connecté'}</p>
          <Button onClick={() => refetch()} className="mt-4">
            Réessayer
          </Button>
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-4 md:space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2 md:gap-3">
          <div className="p-1.5 md:p-2 bg-blue-100 rounded-lg">
            <Calendar className="h-4 w-4 md:h-5 md:w-5 text-blue-600" />
          </div>
          <div>
            <h1 className="text-base md:text-xl font-bold text-gray-900">
              {t('schedule.title')}
            </h1>
            <p className="hidden md:block text-xs md:text-sm text-gray-600">
              {t('schedule.subtitle')}
            </p>
          </div>
        </div>
        <Button
          onClick={() => setShowPermissionModal(true)}
          size="sm"
          className="bg-blue-600 hover:bg-blue-700 text-white text-xs"
        >
          <Plus className="h-3 w-3 mr-1" />
          <span className="hidden sm:inline">{t('schedule.addPermission')}</span>
          <span className="sm:hidden">{t('schedule.permissions')}</span>
        </Button>
      </div>

      {/* Permission Statistics */}
      {/* {leaves.length > 0 && (
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 md:gap-4 mb-4">
          <Card className="bg-white border-0 shadow-sm">
            <CardContent className="p-3 md:p-4">
              <div className="flex items-center gap-2">
                <div className="p-2 bg-yellow-100 rounded-lg">
                  <ClockIcon className="h-4 w-4 text-yellow-600" />
                </div>
                <div>
                  <p className="text-xs md:text-sm text-gray-600">En attente</p>
                  <p className="text-lg md:text-xl font-bold text-yellow-600">
                    {leaves.filter((p: Leave) => p.status === 'pending').length}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>
          
          <Card className="bg-white border-0 shadow-sm">
            <CardContent className="p-3 md:p-4">
              <div className="flex items-center gap-2">
                <div className="p-2 bg-green-100 rounded-lg">
                  <CheckCircle className="h-4 w-4 text-green-600" />
                </div>
                <div>
                  <p className="text-xs md:text-sm text-gray-600">Approuvées</p>
                  <p className="text-lg md:text-xl font-bold text-green-600">
                    {leaves.filter((p: Leave) => p.status === 'approved' || p.status === 'ACCEPTED').length}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>
          
          <Card className="bg-white border-0 shadow-sm">
            <CardContent className="p-3 md:p-4">
              <div className="flex items-center gap-2">
                <div className="p-2 bg-red-100 rounded-lg">
                  <XCircle className="h-4 w-4 text-red-600" />
                </div>
                <div>
                  <p className="text-xs md:text-sm text-gray-600">Rejetées</p>
                  <p className="text-lg md:text-xl font-bold text-red-600">
                    {leaves.filter((p: Leave) => p.status === 'rejected').length}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>
          
          <Card className="bg-white border-0 shadow-sm">
            <CardContent className="p-3 md:p-4">
              <div className="flex items-center gap-2">
                <div className="p-2 bg-blue-100 rounded-lg">
                  <FileText className="h-4 w-4 text-blue-600" />
                </div>
                <div>
                  <p className="text-xs md:text-sm text-gray-600">Total</p>
                  <p className="text-lg md:text-xl font-bold text-blue-600">
                    {leaves.length}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>
      )} */}

      {/* Tabs */}
      <div className="flex gap-1 md:gap-2 bg-gray-100 rounded-lg p-1 md:hidden">
        <Button
          variant={activeTab === 'permissions' ? 'default' : 'ghost'}
          size="sm"
          onClick={() => setActiveTab('permissions')}
          className="flex-1 text-xs md:text-sm"
        >
          <FileText className="h-3 w-3 md:h-4 md:w-4 mr-1 md:mr-2" />
          {t('schedule.permissions')}
        </Button>
        <Button
          variant={activeTab === 'missions' ? 'default' : 'ghost'}
          size="sm"
          onClick={() => setActiveTab('missions')}
          className="flex-1 text-xs md:text-sm"
        >
          <Briefcase className="h-3 w-3 md:h-4 md:w-4 mr-1 md:mr-2" />
          {t('schedule.missions')}
        </Button>
        <Button
          variant={activeTab === 'meetings' ? 'default' : 'ghost'}
          size="sm"
          onClick={() => setActiveTab('meetings')}
          className="flex-1 text-xs md:text-sm"
        >
          <Video className="h-3 w-3 md:h-4 md:w-4 mr-1 md:mr-2" />
          {t('schedule.meetings')}
        </Button>
      </div>

      {/* Mobile Content - Single Tab */}
      <div className="md:hidden">
        {/* Permissions Tab */}
        {activeTab === 'permissions' && (
          <div className="space-y-3 md:space-y-4">
            {leaves.length === 0 ? (
              <Card className="bg-white border-0 shadow-sm">
                <CardContent className="p-6 text-center">
                  <FileText className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                  <p className="text-gray-600">Aucune permission trouvée</p>
                  <Button 
                    onClick={() => setShowPermissionModal(true)}
                    className="mt-4 bg-blue-600 hover:bg-blue-700"
                  >
                    Demander une permission
                  </Button>
                </CardContent>
              </Card>
            ) : (
              leaves.map((permission: Leave) => (
              <Card key={permission.id} className="bg-white border-0 shadow-sm hover:shadow-md transition-all duration-300">
                  <CardContent className="p-3 md:p-4">
                    <div className="flex items-start justify-between">
                      <div className="flex-1">
                        <div className="flex items-center gap-2 mb-2">
                          <Badge className={`${getPermissionTypeColor(permission.leave_type)} text-xs`}>
                            {getPermissionTypeText(permission.leave_type)}
                          </Badge>
                        <Badge className={`${getStatusColor(permission.status)} text-xs`}>
                          {getStatusText(permission.status)}
                          </Badge>
                        </div>
                        
                        <div className="space-y-1 text-xs md:text-sm text-gray-600">
                          <div className="flex items-center gap-1">
                            <Calendar className="h-3 w-3 md:h-4 md:w-4" />
                            <span>Du {formatDate(permission.start_date)} au {formatDate(permission.end_date)}</span>
                          </div>
                          <div className="flex items-center gap-1">
                            <MessageSquare className="h-3 w-3 md:h-4 md:w-4" />
                            <span>{permission.comment || 'Aucun motif'}</span>
                            </div>
                          {permission.other_description && (
                            <div className="flex items-center gap-1">
                              <AlertCircle className="h-3 w-3 md:h-4 md:w-4 text-yellow-600" />
                              <span>{permission.other_description}</span>
                            </div>
                          )}
                          
                          {/* Status details */}
                          {(permission.status === 'approved' || permission.status === 'ACCEPTED' || permission.status === 'accepted') && (
                            <div className="flex items-center gap-1 text-green-600">
                              <CheckCircle className="h-3 w-3 md:h-4 md:w-4" />
                              <span className="text-xs">Permission approuvée</span>
                            </div>
                          )}
                          {(permission.status === 'rejected' || permission.status === 'REJECTED') && (
                            <div className="flex items-center gap-1 text-red-600">
                              <XCircle className="h-3 w-3 md:h-4 md:w-4" />
                              <span className="text-xs">Permission rejetée</span>
                            </div>
                          )}
                          {(permission.status === 'pending' || permission.status === 'PENDING') && (
                            <div className="flex items-center gap-1 text-yellow-600">
                              <ClockIcon className="h-3 w-3 md:h-4 md:w-4" />
                              <span className="text-xs">En attente d'approbation</span>
                          </div>
                        )}
                      </div>
                    </div>
                    
                      {/* Action buttons for pending permissions */}
                      {(permission.status === 'pending' || permission.status === 'PENDING') && (
                        <div className="flex flex-col gap-1 ml-2">
                          <Button
                            size="sm"
                            variant="outline"
                            onClick={() => handleEdit(permission)}
                            className="h-6 w-6 p-0"
                          >
                            <Edit className="h-3 w-3" />
                          </Button>
                          <Button
                            size="sm"
                            variant="outline"
                            onClick={() => handleDelete(permission.id)}
                            className="h-6 w-6 p-0 text-red-600 hover:text-red-700"
                            disabled={deleteLoading}
                          >
                            <Trash2 className="h-3 w-3" />
                          </Button>
                      </div>
                      )}
                    </div>
                  </CardContent>
                </Card>
              ))
            )}
          </div>
        )}

        {/* Missions Tab */}
        {activeTab === 'missions' && (
          <div className="space-y-3 md:space-y-4">
            <Card className="bg-white border-0 shadow-sm">
              <CardContent className="p-6 text-center">
                <Briefcase className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                <p className="text-gray-600">Fonctionnalité à venir</p>
                </CardContent>
              </Card>
          </div>
        )}

        {/* Meetings Tab */}
        {activeTab === 'meetings' && (
          <div className="space-y-3 md:space-y-4">
            <Card className="bg-white border-0 shadow-sm">
              <CardContent className="p-6 text-center">
                <Video className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                <p className="text-gray-600">Fonctionnalité à venir</p>
                </CardContent>
              </Card>
          </div>
        )}
      </div>

      {/* Desktop Content - Grid Layout */}
      <div className="hidden md:grid md:grid-cols-3 md:gap-6">
        {/* Permissions Column */}
        <div className="space-y-4">
          <div className="flex items-center gap-2 mb-4">
            <div className="p-2 bg-blue-100 rounded-lg">
              <FileText className="h-5 w-5 text-blue-600" />
            </div>
            <h2 className="text-lg font-semibold text-gray-900">Permissions</h2>
          </div>
          <div className="space-y-3">
            {leaves.length === 0 ? (
              <Card className="bg-white border-0 shadow-sm">
                <CardContent className="p-6 text-center">
                  <FileText className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                  <p className="text-gray-600">Aucune permission trouvée</p>
                  <Button 
                    onClick={() => setShowPermissionModal(true)}
                    className="mt-4 bg-blue-600 hover:bg-blue-700"
                  >
                    Demander une permission
                  </Button>
                </CardContent>
              </Card>
            ) : (
              leaves.map((permission: Leave) => (
              <Card key={permission.id} className="bg-white border-0 shadow-sm hover:shadow-md transition-all duration-300">
                  <CardContent className="p-4">
                    <div className="flex items-start justify-between">
                      <div className="flex-1">
                        <div className="flex items-center gap-2 mb-2">
                          <Badge className={`${getPermissionTypeColor(permission.leave_type)} text-xs`}>
                            {getPermissionTypeText(permission.leave_type)}
                          </Badge>
                        <Badge className={`${getStatusColor(permission.status)} text-xs`}>
                          {getStatusText(permission.status)}
                          </Badge>
                        </div>
                        
                        <div className="space-y-1 text-sm text-gray-600">
                          <div className="flex items-center gap-1">
                            <Calendar className="h-4 w-4" />
                            <span>Du {formatDate(permission.start_date)} au {formatDate(permission.end_date)}</span>
                          </div>
                          <div className="flex items-center gap-1">
                            <MessageSquare className="h-4 w-4" />
                            <span>{permission.comment || 'Aucun motif'}</span>
                            </div>
                          {permission.other_description && (
                            <div className="flex items-center gap-1">
                              <AlertCircle className="h-4 w-4 text-yellow-600" />
                              <span>{permission.other_description}</span>
                            </div>
                          )}
                          
                          {/* Status details */}
                          {(permission.status === 'approved' || permission.status === 'ACCEPTED' || permission.status === 'accepted') && (
                            <div className="flex items-center gap-1 text-green-600">
                              <CheckCircle className="h-4 w-4" />
                              <span className="text-sm">Permission approuvée</span>
                            </div>
                          )}
                          {(permission.status === 'rejected' || permission.status === 'REJECTED') && (
                            <div className="flex items-center gap-1 text-red-600">
                              <XCircle className="h-4 w-4" />
                              <span className="text-sm">Permission rejetée</span>
                            </div>
                          )}
                          {(permission.status === 'pending' || permission.status === 'PENDING') && (
                            <div className="flex items-center gap-1 text-yellow-600">
                              <ClockIcon className="h-4 w-4" />
                              <span className="text-sm">En attente d'approbation</span>
                          </div>
                        )}
                      </div>
                    </div>
                    
                      {/* Action buttons for pending permissions */}
                      {(permission.status === 'pending' || permission.status === 'PENDING') && (
                        <div className="flex flex-col gap-1 ml-2">
                          <Button
                            size="sm"
                            variant="outline"
                            onClick={() => handleEdit(permission)}
                            className="h-6 w-6 p-0"
                          >
                            <Edit className="h-3 w-3" />
                          </Button>
                          <Button
                            size="sm"
                            variant="outline"
                            onClick={() => handleDelete(permission.id)}
                            className="h-6 w-6 p-0 text-red-600 hover:text-red-700"
                            disabled={deleteLoading}
                          >
                            <Trash2 className="h-3 w-3" />
                          </Button>
                      </div>
                      )}
                    </div>
                  </CardContent>
                </Card>
              ))
            )}
          </div>
        </div>

        {/* Missions Column */}
        <div className="space-y-4">
          <div className="flex items-center gap-2 mb-4">
            <div className="p-2 bg-green-100 rounded-lg">
              <Briefcase className="h-5 w-5 text-green-600" />
            </div>
            <h2 className="text-lg font-semibold text-gray-900">Missions</h2>
          </div>
          <div className="space-y-3">
            <Card className="bg-white border-0 shadow-sm">
              <CardContent className="p-6 text-center">
                <Briefcase className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                <p className="text-gray-600">Fonctionnalité à venir</p>
                </CardContent>
              </Card>
          </div>
        </div>

        {/* Meetings Column */}
        <div className="space-y-4">
          <div className="flex items-center gap-2 mb-4">
            <div className="p-2 bg-purple-100 rounded-lg">
              <Video className="h-5 w-5 text-purple-600" />
            </div>
            <h2 className="text-lg font-semibold text-gray-900">Réunions</h2>
          </div>
          <div className="space-y-3">
            <Card className="bg-white border-0 shadow-sm">
              <CardContent className="p-6 text-center">
                <Video className="h-12 w-12 text-gray-400 mx-auto mb-4" />
                <p className="text-gray-600">Fonctionnalité à venir</p>
                </CardContent>
              </Card>
          </div>
        </div>
      </div>

      {/* Permission Request Modal */}
      {showPermissionModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-3 md:p-4">
          <div className="bg-white rounded-lg max-w-md w-full max-h-[90vh] overflow-y-auto">
            <div className="p-4 md:p-6">
              <div className="flex items-center justify-between mb-4 md:mb-6">
                <h2 className="text-lg md:text-xl font-bold text-gray-900">
                  {editingPermission ? 'Modifier la permission' : 'Demande de permission'}
                </h2>
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => setShowPermissionModal(false)}
                >
                  ✕
                </Button>
              </div>

              <form onSubmit={handleSubmit} className="space-y-3 md:space-y-4">
                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Type de permission
                  </label>
                  <select 
                    className="w-full p-2 border border-gray-300 rounded-lg text-xs md:text-sm"
                    value={formData.type}
                    onChange={(e) => setFormData({ ...formData, type: e.target.value as any })}
                    required
                  >
                    <option value="vacation">Vacances</option>
                    <option value="sick">Maladie</option>
                    <option value="personal">Personnel</option>
                    <option value="other">Autre</option>
                  </select>
                </div>

                <div className="grid grid-cols-2 gap-2">
                  <div>
                    <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                      Date de début
                    </label>
                    <Input 
                      type="date" 
                      className="text-xs md:text-sm"
                      value={formData.startDate}
                      onChange={(e) => setFormData({ ...formData, startDate: e.target.value })}
                      required
                    />
                  </div>
                  <div>
                    <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                      Date de fin
                    </label>
                    <Input 
                      type="date" 
                      className="text-xs md:text-sm"
                      value={formData.endDate}
                      onChange={(e) => setFormData({ ...formData, endDate: e.target.value })}
                      required
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1">
                    Motif
                  </label>
                  <textarea 
                    className="w-full p-2 border border-gray-300 rounded-lg text-xs md:text-sm"
                    rows={3}
                    placeholder="Décrivez le motif de votre demande..."
                    value={formData.reason}
                    onChange={(e) => setFormData({ ...formData, reason: e.target.value })}
                    required
                  />
                </div>

                <div className="flex gap-2 md:gap-3 pt-3 md:pt-4">
                  <Button
                    type="button"
                    onClick={() => setShowPermissionModal(false)}
                    variant="outline"
                    className="flex-1 text-xs md:text-sm"
                  >
                    Annuler
                  </Button>
                  <Button 
                    type="submit"
                    className="flex-1 bg-blue-600 hover:bg-blue-700 text-white text-xs md:text-sm"
                    disabled={insertLoading || updateLoading}
                  >
                    {insertLoading || updateLoading ? 'Chargement...' : (editingPermission ? 'Mettre à jour' : 'Soumettre la demande')}
                  </Button>
                </div>
              </form>
            </div>
          </div>
        </div>
      )}
    </div>
  )
} 