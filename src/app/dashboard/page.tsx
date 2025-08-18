'use client'

import { useState, useEffect, useMemo, useCallback } from 'react'
import { useRouter } from 'next/navigation'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import {
  Clock,
  LogIn,
  LogOut,
  Users,
  TrendingUp,
  Calendar,
  CheckCircle,
  XCircle,
  ChevronLeft,
  ChevronRight,
  User,
  Building,
  Mail,
  Phone,
  Calendar as CalendarIcon
} from 'lucide-react'
import { useClockIn, useClockOut, useAttendanceStatus, useAttendanceList, useVisitors } from '@/lib/graphql/hooks'
import AttendanceCalendar from '@/components/ui/attendance-calendar'
import { useAuthStore } from '@/store/auth-store'
import { useAcceptVisit, useRejectVisit } from '@/lib/graphql/hooks'
import { VisitorCard } from '@/components/ui/visitor-card'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { useLocation } from '@/hooks/useLocation'
import { isCNPS } from '@/lib/config/environments'
import toast from 'react-hot-toast'
import { useLogger } from '@/lib/utils/logger'

// Constants
const CNPS_BUILDING_ID = "d94085cf-286a-4895-b346-14401c69736d"

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

interface DashboardStat {
  title: string
  value: string
  icon: React.ReactNode
  color: string
  bgColor: string
}

export default function DashboardPage() {
  const { t } = useTranslation()
  const router = useRouter()
  const { user } = useAuthStore()
  const logger = useLogger('DashboardPage')
  const [currentTime, setCurrentTime] = useState(new Date())
  const [currentMonth, setCurrentMonth] = useState(new Date())
  const [showVisitorDetails, setShowVisitorDetails] = useState(false)
  const [selectedVisitor, setSelectedVisitor] = useState<Visitor | null>(null)

  // Geolocation using our hook
  const { location, loading: locationLoading, error: locationError, getCurrentLocation } = useLocation()

  // GraphQL Hooks
  const { clockIn, loading: clockInLoading } = useClockIn()
  const { clockOut, loading: clockOutLoading } = useClockOut()
  const { attendanceStatus, loading: attendanceStatusLoading } = useAttendanceStatus(user?.id || '')
  const { attendanceList, loading: attendanceListLoading } = useAttendanceList(user?.id || '')
  const { visitors, loading: visitorsLoading } = useVisitors(user?.id || '')
  const { acceptVisit, loading: acceptLoading } = useAcceptVisit()
  const { rejectVisit, loading: rejectLoading } = useRejectVisit()

  // Memoized visitors filtering
  const { todayVisitors, pendingVisitors, allVisitorsToShow } = useMemo(() => {
    const today = new Date().toISOString().split('T')[0]

    const todayVisitors = visitors.filter((visitor: Visitor) => {
      if (!visitor.check_in_at) return false
      const visitorDate = visitor.check_in_at.split('T')[0]
      return visitorDate === today
    })

    const pendingVisitors = visitors.filter((visitor: Visitor) => {
      return visitor.status === 'PENDING' && !visitor.check_in_at
    })

    const allVisitorsToShow = [...todayVisitors, ...pendingVisitors].reverse()

    return { todayVisitors, pendingVisitors, allVisitorsToShow }
  }, [visitors])

  // Update time every second
  useEffect(() => {
    const timer = setInterval(() => setCurrentTime(new Date()), 1000)
    return () => clearInterval(timer)
  }, [])

  // Memoized dashboard stats
  const dashboardStats: DashboardStat[] = useMemo(() => [
    {
      title: t('dashboard.todayVisitorsTitle'),
      value: todayVisitors.length.toString(),
      icon: <Users className="h-4 w-4" />,
      color: 'text-blue-600',
      bgColor: 'bg-blue-100'
    },
    {
      title: t('dashboard.appointmentsTitle'),
      value: '0',
      icon: <Calendar className="h-4 w-4" />,
      color: 'text-green-600',
      bgColor: 'bg-green-100'
    },
    {
      title: t('dashboard.messagesTitle'),
      value: '0',
      icon: <TrendingUp className="h-4 w-4" />,
      color: 'text-purple-600',
      bgColor: 'bg-purple-100'
    },
    {
      title: t('dashboard.notificationsTitle'),
      value: '0',
      icon: <TrendingUp className="h-4 w-4" />,
      color: 'text-orange-600',
      bgColor: 'bg-orange-100'
    }
  ], [todayVisitors.length, t])

  // Memoized attendance status logic
  const attendanceStatusData = useMemo(() => {
    if (!attendanceStatus) {
      return {
        status: 'none' as const,
        clockInTime: null,
        clockOutTime: null,
        isLate: false
      }
    }

    const attendance = attendanceStatus
    const hasClockIn = attendance.clock_in_time !== null
    const hasClockOut = attendance.clock_out_time !== null

    if (!hasClockIn) {
      return {
        status: 'none' as const,
        clockInTime: null,
        clockOutTime: null,
        isLate: false
      }
    }

    if (hasClockIn && !hasClockOut) {
      return {
        status: 'in' as const,
        clockInTime: attendance.clock_in_time,
        clockOutTime: null,
        isLate: attendance.attendance_state?.is_late || false
      }
    }

    return {
      status: 'out' as const,
      clockInTime: attendance.clock_in_time,
      clockOutTime: attendance.clock_out_time,
      isLate: attendance.attendance_state?.is_late || false
    }
  }, [attendanceStatus])

  // Memoized format time function
  const formatTime = useCallback((timeString: string | null) => {
    if (!timeString) return '--:--'

    try {
      // Parse the date and extract time without timezone conversion
      const date = new Date(timeString)

      // Extract time directly from the string to avoid timezone issues
      const timeMatch = timeString.match(/(\d{2}):(\d{2}):\d{2}/)
      if (timeMatch) {
        const hours = timeMatch[1]
        const minutes = timeMatch[2]
        const formattedTime = `${hours}:${minutes}`

        return formattedTime
      }

      // Fallback to locale time if regex fails
      const formattedTime = date.toLocaleTimeString('fr-FR', {
        hour: '2-digit',
        minute: '2-digit'
      })

      return formattedTime
    } catch (error) {
      logger.error('Error formatting time', error)
      return '--:--'
    }
  }, [])

  // Memoized clock in handler
  const handleClockIn = useCallback(async () => {
    if (!user?.id) return

    try {
      // Get current location using our hook (handles static location for CNPS)
      let currentLocation = location
      if (!currentLocation) {
        try {
          currentLocation = await getCurrentLocation()
        } catch (error) {
          logger.error('Failed to get location', error)
          toast.error('Erreur de géolocalisation')
          return
        }
      }

      if (!currentLocation) {
        toast.error('Impossible d\'obtenir la localisation')
        return
      }

      logger.info('Sending clock-in with location', currentLocation)

      // Préparer les variables selon l'environnement
      const clockInVariables: any = {
        employee_id: user.id,
        location: `{"type": "Point", "coordinates": [${currentLocation.long},${currentLocation.lat}]}`
      }

      // Ajouter building_id seulement pour CNPS
      if (isCNPS()) {
        clockInVariables.building_id = CNPS_BUILDING_ID
      }

      const result = await clockIn(clockInVariables)
      
      // Afficher le message de succès ou d'erreur du retour
      if (result?.data?.insert_attendance_one) {
        toast.success('Pointage enregistré avec succès !')
        logger.info('Clock-in successful', result.data.insert_attendance_one)
      } else if (result?.errors) {
        // Extraire le vrai message d'erreur depuis les extensions
        let errorMessage = 'Erreur lors du pointage'
        const firstError = result.errors[0]
        
        if (firstError?.extensions?.internal && 
            typeof firstError.extensions.internal === 'object' && 
            'error' in firstError.extensions.internal &&
            firstError.extensions.internal.error &&
            typeof firstError.extensions.internal.error === 'object' &&
            'message' in firstError.extensions.internal.error) {
          // Message d'erreur détaillé depuis la base de données
          errorMessage = (firstError.extensions.internal.error as any).message
        } else if (firstError?.message) {
          // Message d'erreur GraphQL standard
          errorMessage = firstError.message
        }
        
        // Console.log du message d'erreur réel
        console.log('❌ Clock-in Error Message.:', errorMessage)
        
        toast.error(`Erreur de pointage: ${errorMessage}`)
        logger.error('Clock-in GraphQL error', result.errors)
      } else {
        toast.success('Pointage enregistré !')
        logger.info('Clock-in completed')
      }
          } catch (error) {
        const errorMessage = error instanceof Error ? error.message : 'Erreur inconnue lors du pointage'
        toast.error(`Erreur de pointage: ${errorMessage}`)
        console.log(`Erreur de pointage: ${errorMessage}`)
        console.log('Error clocking in', error)
      }
  }, [user?.id, location, getCurrentLocation, clockIn])

  // Memoized clock out handler
  const handleClockOut = useCallback(async () => {
    if (!user?.id) return

    try {
      // Get current location using our hook (handles static location for CNPS)
      let currentLocation = location
      if (!currentLocation) {
        try {
          currentLocation = await getCurrentLocation()
        } catch (error) {
          logger.error('Failed to get location', error)
          toast.error('Erreur de géolocalisation')
          return
        }
      }

      if (!currentLocation) {
        toast.error('Impossible d\'obtenir la localisation')
        return
      }

      const result = await clockOut(user.id)
      
      // Afficher le message de succès ou d'erreur du retour
      if (result?.data?.update_attendance_by_pk) {
        toast.success('Déconnexion enregistrée avec succès !')
        logger.info('Clock-out successful', result.data.update_attendance_by_pk)
      } else if (result?.errors) {
        // Extraire le vrai message d'erreur depuis les extensions
        let errorMessage = 'Erreur lors de la déconnexion'
        const firstError = result.errors[0]
        
        if (firstError?.extensions?.internal && 
            typeof firstError.extensions.internal === 'object' && 
            'error' in firstError.extensions.internal &&
            firstError.extensions.internal.error &&
            typeof firstError.extensions.internal.error === 'object' &&
            'message' in firstError.extensions.internal.error) {
          // Message d'erreur détaillé depuis la base de données
          errorMessage = (firstError.extensions.internal.error as any).message
        } else if (firstError?.message) {
          // Message d'erreur GraphQL standard
          errorMessage = firstError.message
        }
        
        // Console.log du message d'erreur réel
        console.log('❌ Clock-out Error Message:', errorMessage)
        
        toast.error(`Erreur de déconnexion: ${errorMessage}`)
        logger.error('Clock-out GraphQL error', result.errors)
      } else {
        toast.success('Déconnexion enregistrée !')
        logger.info('Clock-out completed')
      }
    } catch (error) {
      const errorMessage = error instanceof Error ? error.message : 'Erreur inconnue lors de la déconnexion'
      toast.error(`Erreur de déconnexion: ${errorMessage}`)
      logger.error('Error clocking out', error)
    }
  }, [user?.id, location, getCurrentLocation, clockOut])

  // Memoized calendar functions
  const getDaysInMonth = useCallback((date: Date) => {
    const year = date.getFullYear()
    const month = date.getMonth()
    return new Date(year, month + 1, 0).getDate()
  }, [])

  const getFirstDayOfMonth = useCallback((date: Date) => {
    const year = date.getFullYear()
    const month = date.getMonth()
    return new Date(year, month, 1).getDay()
  }, [])

  const nextMonth = useCallback(() => {
    setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1))
  }, [currentMonth])

  const prevMonth = useCallback(() => {
    setCurrentMonth(new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1, 1))
  }, [currentMonth])

  // Memoized visitor action handler
  const handleVisitorAction = useCallback(async (visitorId: string, action: string) => {
    logger.info(`${action} visitor`, { visitorId })

    try {
      if (action === 'approve') {
        await acceptVisit(visitorId)
        logger.info('Visitor approved successfully')
      } else if (action === 'reject') {
        await rejectVisit(visitorId)
        logger.info('Visitor rejected successfully')
      } else if (action === 'clockout') {
        // Handle clockout if needed
        logger.info('Clockout action for visitor')
      }
    } catch (error) {
      logger.error('Error handling visitor action', error)
    }
  }, [acceptVisit, rejectVisit, logger])

  const isLoading = clockInLoading || clockOutLoading || attendanceStatusLoading

  return (
    <div className="space-y-1">
      {/* Mobile Attendance Card */}
      <div className="md:hidden">
        <Card className="bg-white border-0 shadow-lg hover:shadow-xl transition-all duration-300">
          <CardHeader className="pb-3">
            <div className="flex items-center justify-between">
              <CardTitle className="flex items-center gap-2 text-sm font-semibold text-gray-800">
                <div className="p-1.5 bg-blue-100 rounded-lg">
                  <Clock className="h-3 w-3 text-blue-600" />
                </div>
                <span>Pointage</span>
              </CardTitle>
              <div className="text-right">
                <div className="text-sm font-bold text-gray-800">
                  {currentTime.toLocaleTimeString('fr-FR', {
                    hour: '2-digit',
                    minute: '2-digit'
                  })}
                </div>
                <div className="text-xs text-gray-500">
                  {currentTime.toLocaleDateString('fr-FR', {
                    weekday: 'short',
                    month: 'short',
                    day: 'numeric'
                  })}
                </div>
              </div>
            </div>
          </CardHeader>

          <CardContent className="p-3">
            <div className="grid grid-cols-2 gap-3 mb-4">
              {/* Clock In Section */}
              <div className="bg-gray-50 rounded-lg p-2 border border-gray-200">
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center gap-1">
                    <div className="p-1 bg-green-100 rounded-lg">
                      <LogIn className="h-2.5 w-2.5 text-green-600" />
                    </div>
                    <div>
                      <h3 className="font-semibold text-gray-800 text-xs">Arrivée</h3>
                      <p className="text-xs text-gray-500">Heure</p>
                    </div>
                  </div>
                  {attendanceStatusData.status === 'in' && (
                    <CheckCircle className="h-3 w-3 text-green-500" />
                  )}
                </div>
                <div className="text-center">
                  <div className="text-lg font-bold text-gray-800 mb-1">
                    {formatTime(attendanceStatusData.clockInTime)}
                  </div>
                  <p className="text-xs text-gray-500">
                    {attendanceStatusData.clockInTime ? 'Pointé' : 'Non pointé'}
                  </p>
                </div>
              </div>

              {/* Clock Out Section */}
              <div className="bg-gray-50 rounded-lg p-2 border border-gray-200">
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center gap-1">
                    <div className="p-1 bg-red-100 rounded-lg">
                      <LogOut className="h-2.5 w-2.5 text-red-600" />
                    </div>
                    <div>
                      <h3 className="font-semibold text-gray-800 text-xs">Départ</h3>
                      <p className="text-xs text-gray-500">Heure</p>
                    </div>
                  </div>
                  {attendanceStatusData.status === 'out' && (
                    <XCircle className="h-3 w-3 text-red-500" />
                  )}
                </div>
                <div className="text-center">
                  <div className="text-lg font-bold text-gray-800 mb-1">
                    {formatTime(attendanceStatusData.clockOutTime)}
                  </div>
                  <p className="text-xs text-gray-500">
                    {attendanceStatusData.clockOutTime ? 'Pointé' : 'Non pointé'}
                  </p>
                </div>
              </div>
            </div>

            {/* Single Action Button */}
            {attendanceStatusData.status === 'none' && (
              <Button
                onClick={handleClockIn}
                disabled={isLoading}
                className="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-2.5 text-sm rounded-lg transition-all duration-300"
              >
                {isLoading ? (
                  <div className="flex items-center gap-2">
                    <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                    Chargement...
                  </div>
                ) : (
                  <div className="flex items-center gap-2">
                    <LogIn className="h-4 w-4" />
                    Pointer l'arrivée
                  </div>
                )}
              </Button>
            )}

            {attendanceStatusData.status === 'in' && (
              <Button
                onClick={handleClockOut}
                disabled={isLoading}
                className="w-full bg-red-600 hover:bg-red-700 text-white font-medium py-2.5 text-sm rounded-lg transition-all duration-300"
              >
                {isLoading ? (
                  <div className="flex items-center gap-2">
                    <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                    Chargement...
                  </div>
                ) : (
                  <div className="flex items-center gap-2">
                    <LogOut className="h-4 w-4" />
                    Pointer le départ
                  </div>
                )}
              </Button>
            )}

            {attendanceStatusData.status === 'out' && (
              <div className="w-full bg-gray-100 text-gray-600 font-medium py-2.5 text-sm rounded-lg flex items-center justify-center gap-2">
                <CheckCircle className="h-4 w-4 text-green-600" />
                Pointage terminé
              </div>
            )}
          </CardContent>
        </Card>
      </div>

      {/* Desktop Layout - Modern Design */}
      <div className="hidden md:block">
        {/* First Row - Attendance Card + Calendar */}
        <div className="grid grid-cols-5 gap-6 mb-6">
          {/* Attendance Card - 60% */}
          <div className="col-span-3">
            <Card className="bg-white border-0 shadow-lg hover:shadow-xl transition-all duration-300 h-full">
              <CardHeader className="pb-3">
                <div className="flex items-center justify-between">
                  <CardTitle className="flex items-center gap-2 text-base font-semibold text-gray-800">
                    <div className="p-1.5 bg-blue-100 rounded-lg">
                      <Clock className="h-4 w-4 text-blue-600" />
                    </div>
                    <span>Pointage</span>
                  </CardTitle>
                  <div className="text-right">
                    <div className="text-lg font-bold text-gray-800">
                      {currentTime.toLocaleTimeString('fr-FR', {
                        hour: '2-digit',
                        minute: '2-digit'
                      })}
                    </div>
                    <div className="text-xs text-gray-500">
                      {currentTime.toLocaleDateString('fr-FR', {
                        weekday: 'short',
                        month: 'short',
                        day: 'numeric'
                      })}
                    </div>
                  </div>
                </div>
              </CardHeader>

              <CardContent className="p-4">
                <div className="grid grid-cols-2 gap-4 mb-4">
                  {/* Clock In Section */}
                  <div className="bg-gray-50 rounded-lg p-3 border border-gray-200">
                    <div className="flex items-center justify-between mb-3">
                      <div className="flex items-center gap-2">
                        <div className="p-1.5 bg-green-100 rounded-lg">
                          <LogIn className="h-3 w-3 text-green-600" />
                        </div>
                        <div>
                          <h3 className="font-semibold text-gray-800 text-sm">Arrivée</h3>
                          <p className="text-xs text-gray-500">Heure</p>
                        </div>
                      </div>
                      {attendanceStatusData.status === 'in' && (
                        <CheckCircle className="h-4 w-4 text-green-500" />
                      )}
                    </div>
                    <div className="text-center">
                      <div className="text-2xl font-bold text-gray-800 mb-1">
                        {formatTime(attendanceStatusData.clockInTime)}
                      </div>
                      <p className="text-xs text-gray-500">
                        {attendanceStatusData.clockInTime ? 'Pointé' : 'Non pointé'}
                      </p>
                    </div>
                  </div>

                  {/* Clock Out Section */}
                  <div className="bg-gray-50 rounded-lg p-3 border border-gray-200">
                    <div className="flex items-center justify-between mb-3">
                      <div className="flex items-center gap-2">
                        <div className="p-1.5 bg-red-100 rounded-lg">
                          <LogOut className="h-3 w-3 text-red-600" />
                        </div>
                        <div>
                          <h3 className="font-semibold text-gray-800 text-sm">Départ</h3>
                          <p className="text-xs text-gray-500">Heure</p>
                        </div>
                      </div>
                      {attendanceStatusData.status === 'out' && (
                        <XCircle className="h-4 w-4 text-red-500" />
                      )}
                    </div>
                    <div className="text-center">
                      <div className="text-2xl font-bold text-gray-800 mb-1">
                        {formatTime(attendanceStatusData.clockOutTime)}
                      </div>
                      <p className="text-xs text-gray-500">
                        {attendanceStatusData.clockOutTime ? 'Pointé' : 'Non pointé'}
                      </p>
                    </div>
                  </div>
                </div>

                {/* Single Action Button */}
                <div className="flex flex-col gap-6"></div>
                {attendanceStatusData.status === 'none' && (
                  <Button
                    onClick={handleClockIn}
                    disabled={isLoading}
                    className="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-3 text-sm rounded-lg transition-all duration-300 mt-4"
                  >
                    {isLoading ? (
                      <div className="flex items-center gap-2">
                        <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                        Chargement...
                      </div>
                    ) : (
                      <div className="flex items-center gap-2">
                        <LogIn className="h-4 w-4" />
                        Pointer l'arrivée
                      </div>
                    )}
                  </Button>
                )}

                {attendanceStatusData.status === 'in' && (
                  <Button
                    onClick={handleClockOut}
                    disabled={isLoading}
                    className="w-full bg-red-600 hover:bg-red-700 text-white font-medium py-3 text-sm rounded-lg transition-all duration-300 mt-4"
                  >
                    {isLoading ? (
                      <div className="flex items-center gap-2">
                        <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                        Chargement...
                      </div>
                    ) : (
                      <div className="flex items-center gap-2">
                        <LogOut className="h-4 w-4" />
                        Pointer le départ
                      </div>
                    )}
                  </Button>
                )}

                {attendanceStatusData.status === 'out' && (
                  <div className="w-full bg-gray-100 text-gray-600 font-medium py-3 text-sm rounded-lg flex items-center justify-center gap-2 mt-4">
                    <CheckCircle className="h-4 w-4 text-green-600" />
                    Pointage terminé
                  </div>
                )}
              </CardContent>
            </Card>
          </div>

          {/* Calendar - 40% */}
          <div className="col-span-2">
            <AttendanceCalendar
              attendanceList={attendanceList}
              currentMonth={currentMonth}
              onMonthChange={setCurrentMonth}
              className="border-0 shadow-lg hover:shadow-xl transition-all duration-300 h-full"
            />
          </div>
        </div>

        {/* Second Row - Visitors + Stats */}
        <div className="grid grid-cols-5 gap-6">
          {/* Visitors Section - 60% */}
          <div className="col-span-3">
            <Card className="bg-white border-0 shadow-lg hover:shadow-xl transition-all duration-300">
              <CardHeader className="pb-3">
                <div className="flex items-center justify-between">
                  <CardTitle className="flex items-center gap-2 text-base font-semibold text-gray-800">
                    <div className="p-1.5 bg-blue-100 rounded-lg">
                      <Users className="h-4 w-4 text-blue-600" />
                    </div>
                    Visiteurs du jour
                  </CardTitle>
                  <Button
                    variant="ghost"
                    size="sm"
                    onClick={() => router.push('/dashboard/visitors')}
                    className="text-blue-600 hover:text-blue-700 hover:bg-blue-50 text-xs"
                  >
                    Voir tout →
                  </Button>
                </div>
              </CardHeader>
              <CardContent className="p-4">
                <div className="space-y-3">
                  {allVisitorsToShow.length > 0 ? (
                    allVisitorsToShow.slice(0, 4).map((visitor: Visitor) => (
                      <VisitorCard
                        key={visitor.id}
                        visitor={visitor}
                        variant="full"
                        onAction={handleVisitorAction}
                        showActions={true}
                      />
                    ))
                  ) : (
                    <div className="bg-gray-50 border border-gray-200 rounded-lg p-4 text-center">
                      <Users className="h-8 w-8 text-gray-400 mx-auto mb-2" />
                      <h3 className="text-sm font-semibold text-gray-900 mb-1">
                        {t('dashboard.noVisitors')}
                      </h3>
                      <p className="text-xs text-gray-600">
                        {t('dashboard.noVisitors')}
                      </p>
                    </div>
                  )}
                </div>
              </CardContent>
            </Card>
          </div>

          {/* Attendance History - 40% */}
          <div className="col-span-2">
            <Card className="bg-white border-0 shadow-lg hover:shadow-xl transition-all duration-300">
              <CardHeader className="pb-3">
                <CardTitle className="flex items-center gap-2 text-base font-semibold text-gray-800">
                  <div className="p-1.5 bg-green-100 rounded-lg">
                    <Clock className="h-4 w-4 text-green-600" />
                  </div>
                  {t('dashboard.attendanceHistory')}
                </CardTitle>
              </CardHeader>
              <CardContent className="p-4">
                <div className="space-y-3">
                  {attendanceList.slice().reverse().slice(0, 5).map((attendance: any, index: number) => (
                    <div key={index} className="bg-gray-50 rounded-lg p-3 border border-gray-200">
                      <div className="flex items-center justify-between">
                        <div className="flex-1">
                          <div className="flex items-center gap-2 mb-1">
                            <div className={`w-2 h-2 rounded-full ${attendance.clock_out_date ? 'bg-green-500' : 'bg-blue-500'
                              }`}></div>
                            <p className="text-xs text-gray-600">
                              {attendance.clock_out_date ? 'Pointage complet' : 'Pointage partiel'}
                            </p>
                          </div>
                          <p className="text-sm font-medium text-gray-800">
                            {new Date(attendance.clock_in_date).toLocaleDateString('fr-FR', {
                              day: 'numeric',
                              month: 'short',
                              year: 'numeric'
                            })}
                          </p>
                          <div className="flex items-center gap-4 mt-1">
                            <div className="flex items-center gap-1">
                              <LogIn className="h-3 w-3 text-green-600" />
                              <span className="text-xs text-gray-600">
                                {formatTime(attendance.clock_in_date)}
                              </span>
                            </div>
                            {attendance.clock_out_date && (
                              <div className="flex items-center gap-1">
                                <LogOut className="h-3 w-3 text-red-600" />
                                <span className="text-xs text-gray-600">
                                  {formatTime(attendance.clock_out_date)}
                                </span>
                              </div>
                            )}
                          </div>
                        </div>
                      </div>
                    </div>
                  ))}
                  {attendanceList.length === 0 && (
                    <div className="bg-gray-50 rounded-lg p-4 text-center">
                      <Clock className="h-8 w-8 text-gray-400 mx-auto mb-2" />
                      <p className="text-xs text-gray-600">{t('dashboard.noAttendance')}</p>
                    </div>
                  )}
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>

      {/* Mobile Visitors Section */}
      <div className="space-y-4 max-w-4xl mx-auto md:hidden">
        {/* Header with "Voir tout" button */}
        <div className="flex items-center justify-between">
          <h2 className="text-lg font-semibold text-gray-900">{t('dashboard.todayVisitors')}</h2>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => router.push('/dashboard/visitors')}
            className="text-blue-600 hover:text-blue-700 hover:bg-blue-50 text-xs"
          >
            {t('dashboard.seeAll')}
          </Button>
        </div>

        {allVisitorsToShow.length > 0 ? (
          allVisitorsToShow.slice(0, 5).map((visitor: Visitor) => (
            <VisitorCard
              key={visitor.id}
              visitor={visitor}
              variant="full"
              onAction={handleVisitorAction}
              showActions={true}
            />
          ))
        ) : (
          <div className="bg-white border border-gray-200 rounded-xl p-6 text-center">
            <Users className="h-12 w-12 text-gray-400 mx-auto mb-3" />
            <h3 className="text-base font-semibold text-gray-900 mb-1">
              Aucun visiteur aujourd'hui
            </h3>
            <p className="text-sm text-gray-600">
              Aucun visiteur n'est arrivé aujourd'hui.
            </p>
          </div>
        )}
      </div>

      {/* Mobile Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {dashboardStats.map((stat, index) => (
          <Card key={index} className="group relative overflow-hidden bg-white/80 backdrop-blur-sm border-0 shadow-lg hover:shadow-xl transition-all duration-300 rounded-2xl">
            <CardHeader className="relative flex flex-row items-center justify-between space-y-0 pb-3">
              <CardTitle className="text-sm font-medium text-gray-700">{stat.title}</CardTitle>
              <div className={`p-2 rounded-lg ${stat.bgColor} group-hover:scale-110 transition-transform duration-300`}>
                <div className={stat.color}>{stat.icon}</div>
              </div>
            </CardHeader>
            <CardContent className="relative">
              <div className="text-2xl font-bold text-gray-800">{stat.value}</div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Visitor Details Modal */}
      {showVisitorDetails && selectedVisitor && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-lg max-w-md w-full">
            <div className="p-6">
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-lg font-bold text-gray-900">Détails du visiteur</h2>
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => setShowVisitorDetails(false)}
                >
                  ✕
                </Button>
              </div>
              <div className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Nom</label>
                  <p className="text-sm text-gray-900">
                    {`${selectedVisitor.visitorByVisitor?.firstname || ''} ${selectedVisitor.visitorByVisitor?.lastname || ''}`.trim()}
                  </p>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Numéro d'enregistrement</label>
                  <p className="text-sm text-gray-900">{selectedVisitor.reg_no}</p>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Motif</label>
                  <p className="text-sm text-gray-900">{selectedVisitor.reason}</p>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Heure d'arrivée</label>
                  <p className="text-sm text-gray-900">{formatTime(selectedVisitor.check_in_at || null)}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}


    </div>
  )
} 