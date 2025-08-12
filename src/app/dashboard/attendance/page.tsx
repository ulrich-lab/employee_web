'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { CheckCircle, XCircle, Clock, ChevronLeft, ChevronRight, Calendar, LogIn, LogOut, TrendingUp } from 'lucide-react'
import AttendanceCalendar from '@/components/ui/attendance-calendar'
import { useAttendanceList } from '@/lib/graphql/hooks'
import { useAuthStore } from '@/store/auth-store'
import { useTranslation } from '@/lib/i18n/useTranslation'

// Types
interface AttendanceRecord {
  id: string
  date: string
  clockIn: string
  clockOut?: string
  status: 'present' | 'absent' | 'late' | 'early'
  totalHours?: string
  notes?: string
}

export default function AttendancePage() {
  const { t } = useTranslation()
  const { user } = useAuthStore()
  const [currentTime, setCurrentTime] = useState(new Date())
  const [currentMonth, setCurrentMonth] = useState(new Date())

  // GraphQL Hook for attendance list
  const { attendanceList, loading: attendanceListLoading } = useAttendanceList(user?.id || '')

  // Format time function (same as dashboard)
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
    }).sort((a: AttendanceRecord, b: AttendanceRecord) => new Date(b.date).getTime() - new Date(a.date).getTime()) // Sort by date descending
  }

  // Update time every second
  useEffect(() => {
    const timer = setInterval(() => setCurrentTime(new Date()), 1000)
    return () => clearInterval(timer)
  }, [])

  // Real attendance history data from GraphQL
  const attendanceHistory: AttendanceRecord[] = transformAttendanceData()

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

  const formatDate = (dateString: string) => {
    const date = new Date(dateString)
    return date.toLocaleDateString('fr-FR', {
      weekday: 'short',
      day: 'numeric',
      month: 'short'
    })
  }

  return (
    <div className="space-y-4">
      {/* Header */}
      <div className="flex items-center gap-2">
        <div className="p-1.5 bg-blue-100 rounded-lg">
          <Calendar className="h-4 w-4 text-blue-600" />
        </div>
        <div>
          <h1 className="text-base font-bold text-gray-900">
            {t('attendance.title')}
          </h1>
          <p className="text-xs text-gray-600">
            {t('attendance.subtitle')}
          </p>
        </div>
      </div>

      {/* Monthly Calendar */}
      <AttendanceCalendar
        attendanceList={attendanceList}
        currentMonth={currentMonth}
        onMonthChange={setCurrentMonth}
        className="border border-gray-200 shadow-sm rounded-xl"
      />

      {/* Attendance History - Mobile Only */}
      <div className="md:hidden">
        <Card className="bg-white border border-gray-200 shadow-sm rounded-xl">
          <CardHeader>
            <div className="flex items-center gap-2">
              <div className="p-1.5 bg-green-100 rounded-lg">
                <TrendingUp className="h-4 w-4 text-green-600" />
              </div>
              <CardTitle className="text-sm font-semibold text-gray-800">
                {t('attendance.history')}
              </CardTitle>
            </div>
          </CardHeader>
          <CardContent>
            {attendanceListLoading ? (
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
            ) : (
              <div className="space-y-3">
                {attendanceHistory.length > 0 ? (
                  attendanceHistory.map((record) => (
                    <div key={record.id} className="bg-gray-50 rounded-lg p-3 border border-gray-200">
                      <div className="flex items-center justify-between mb-2">
                        <div className="flex items-center gap-2">
                          <span className="text-sm font-medium text-gray-900">
                            {formatDate(record.date)}
                          </span>
                          <div className={`px-2 py-1 rounded-full text-xs border ${getStatusColor(record.status)}`}>
                            {getStatusText(record.status)}
                          </div>
                        </div>
                        <div className="text-right">
                          <div className="text-sm font-semibold text-gray-800">
                            {record.clockIn}
                          </div>
                          {record.clockOut && (
                            <div className="text-xs text-gray-600">
                              {t('attendance.clockOut')}: {record.clockOut}
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
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  )
} 