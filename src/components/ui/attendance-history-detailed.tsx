'use client'

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Clock, LogIn, LogOut, TrendingUp } from 'lucide-react'
import { useTranslation } from '@/lib/i18n/useTranslation'

interface AttendanceHistoryDetailedProps {
  attendanceList: any[]
  loading?: boolean
  maxItems?: number
  className?: string
}

export function AttendanceHistoryDetailed({ 
  attendanceList, 
  loading = false, 
  maxItems = 5,
  className = '' 
}: AttendanceHistoryDetailedProps) {
  const { t } = useTranslation()

  // Format time function with UTC+1 correction
  const formatTime = (timeString: string | null) => {
    if (!timeString) return '--:--'

    try {
      // Parse the date and extract time without timezone conversion
      const date = new Date(timeString)

      // Extract time directly from the string to avoid timezone issues
      const timeMatch = timeString.match(/(\d{2}):(\d{2}):\d{2}/)
      if (timeMatch) {
        const hours = parseInt(timeMatch[1])
        const minutes = parseInt(timeMatch[2])
        
        // Ajuster pour le fuseau horaire du Cameroun (UTC+1)
        const adjustedHours = (hours + 1) % 24
        const adjustedHoursStr = adjustedHours.toString().padStart(2, '0')
        const formattedTime = `${adjustedHoursStr}:${timeMatch[2]}`
        
        return formattedTime
      }

      // Fallback: ajuster l'heure pour UTC+1
      const adjustedDate = new Date(date.getTime() + (60 * 60 * 1000)) // +1 heure
      const formattedTime = adjustedDate.toLocaleTimeString('fr-FR', {
        hour: '2-digit',
        minute: '2-digit'
      })
      
      return formattedTime
    } catch (error) {
      return '--:--'
    }
  }

  // Transform GraphQL data to attendance records
  const transformAttendanceData = () => {
    if (!attendanceList || attendanceList.length === 0) return []

    return attendanceList.map((attendance: any, index: number) => {
      const clockInTime = formatTime(attendance.clock_in_time)
      const clockOutTime = formatTime(attendance.clock_out_time)
      const isLate = attendance.attendance_state?.is_late || false

      // Calculate total hours if both times are available
      let totalHours = '--'
      if (attendance.clock_in_time && attendance.clock_out_time) {
        try {
          const start = new Date(attendance.clock_in_time)
          const end = new Date(attendance.clock_out_time)
          const diffMs = end.getTime() - start.getTime()
          const diffHours = Math.floor(diffMs / (1000 * 60 * 60))
          const diffMinutes = Math.floor((diffMs % (1000 * 60 * 60)) / (1000 * 60))
          totalHours = `${diffHours}h ${diffMinutes}min`
        } catch (error) {
          totalHours = '--'
        }
      }

      // Determine status
      let status: 'present' | 'absent' | 'late' | 'early' = 'present'
      if (isLate) status = 'late'
      if (!attendance.clock_in_time) status = 'absent'

      return {
        id: attendance.id || `attendance-${index}`,
        date: attendance.clock_in_date || new Date().toISOString().split('T')[0],
        clockIn: clockInTime,
        clockOut: clockOutTime !== '--:--' ? clockOutTime : undefined,
        status,
        totalHours,
        notes: isLate ? t('attendance.lateArrival') : t('attendance.normalDay')
      }
    }).sort((a: any, b: any) => new Date(b.date).getTime() - new Date(a.date).getTime()) // Sort by date descending
  }

  // Helper functions for status display
  const getStatusColor = (status: string) => {
    switch (status) {
      case 'present':
        return 'bg-green-100 text-green-800 border-green-200'
      case 'late':
        return 'bg-yellow-100 text-yellow-800 border-yellow-200'
      case 'absent':
        return 'bg-red-100 text-red-800 border-red-200'
      case 'early':
        return 'bg-blue-100 text-blue-800 border-blue-200'
      default:
        return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }

  const getStatusText = (status: string) => {
    switch (status) {
      case 'present':
        return t('attendance.status.present')
      case 'late':
        return t('attendance.status.late')
      case 'absent':
        return t('attendance.status.absent')
      case 'early':
        return t('attendance.status.early')
      default:
        return t('attendance.status.unknown')
    }
  }

  if (loading) {
    return (
      <Card className={`bg-white border-0 shadow-lg hover:shadow-xl transition-all duration-300 ${className}`}>
        <CardHeader className="pb-3">
          <CardTitle className="flex items-center gap-2 text-base font-semibold text-gray-800">
            <div className="p-1.5 bg-green-100 rounded-lg">
              <TrendingUp className="h-4 w-4 text-green-600" />
            </div>
            {t('attendance.history')}
          </CardTitle>
        </CardHeader>
        <CardContent className="p-4">
          <div className="space-y-3">
            {[1, 2, 3].map((i) => (
              <div key={i} className="bg-gray-50 rounded-lg p-3 border border-gray-200 animate-pulse">
                <div className="flex items-center justify-between mb-2">
                  <div className="h-4 bg-gray-200 rounded w-24"></div>
                  <div className="h-4 bg-gray-200 rounded w-16"></div>
                </div>
                <div className="space-y-2">
                  <div className="h-3 bg-gray-200 rounded w-full"></div>
                  <div className="h-3 bg-gray-200 rounded w-3/4"></div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    )
  }

  const attendanceHistory = transformAttendanceData()
  const displayList = attendanceHistory.slice(0, maxItems)

  return (
    <Card className={`bg-white border-0 shadow-lg hover:shadow-xl transition-all duration-300 ${className}`}>
      <CardHeader className="pb-3">
        <CardTitle className="flex items-center gap-2 text-base font-semibold text-gray-800">
          <div className="p-1.5 bg-green-100 rounded-lg">
            <TrendingUp className="h-4 w-4 text-green-600" />
          </div>
          {t('attendance.history')}
        </CardTitle>
      </CardHeader>
      <CardContent className="p-4">
        <div className="space-y-3">
          {displayList.length > 0 ? (
            displayList.map((record) => (
              <div key={record.id} className="bg-gray-50 rounded-lg p-3 border border-gray-200">
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center gap-2">
                    <span className="text-sm font-medium text-gray-900">
                      {new Date(record.date).toLocaleDateString('fr-FR', {
                        weekday: 'short',
                        day: 'numeric',
                        month: 'short'
                      })}
                    </span>
                    <div className={`px-2 py-1 rounded-full text-xs border ${getStatusColor(record.status)}`}>
                      {getStatusText(record.status)}
                    </div>
                  </div>
                  <div className="text-right">
                    <div className="text-sm font-semibold text-gray-800">
                      {t('dashboard.clockInTime')}: {record.clockIn}
                    </div>
                    {record.clockOut && (
                      <div className="text-xs text-gray-600">
                        {t('dashboard.clockOutTime')}: {record.clockOut}
                      </div>
                    )}
                  </div>
                </div>
                <div className="flex items-center justify-between text-xs text-gray-600">
                  <span>{t('attendance.totalHours')}: {record.totalHours}</span>
                  {record.notes && (
                    <span className="text-gray-500">{record.notes}</span>
                  )}
                </div>
              </div>
            ))
          ) : (
            <div className="text-center py-8">
              <div className="text-gray-400 mb-2">
                <Clock className="h-8 w-8 mx-auto" />
              </div>
              <p className="text-sm text-gray-600">
                {t('attendance.noRecords')}
              </p>
            </div>
          )}
        </div>
      </CardContent>
    </Card>
  )
}
