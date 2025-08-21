'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { CheckCircle, XCircle, Clock, ChevronLeft, ChevronRight, Calendar, LogIn, LogOut, TrendingUp } from 'lucide-react'
import AttendanceCalendar from '@/components/ui/attendance-calendar'
import { useAttendanceList } from '@/lib/graphql/hooks'
import { useAuthStore } from '@/store/auth-store'
import { useTranslation } from '@/lib/i18n/useTranslation'
import { AttendanceHistoryDetailed } from '@/components/ui/attendance-history-detailed'

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





  // Update time every second
  useEffect(() => {
    const timer = setInterval(() => setCurrentTime(new Date()), 1000)
    return () => clearInterval(timer)
  }, [])



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
        <AttendanceHistoryDetailed 
          attendanceList={attendanceList}
          loading={attendanceListLoading}
          maxItems={10}
          className="border border-gray-200 shadow-sm rounded-xl"
        />
      </div>
    </div>
  )
} 