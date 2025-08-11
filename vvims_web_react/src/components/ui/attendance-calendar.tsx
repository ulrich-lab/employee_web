'use client'

import { useState } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { CheckCircle, XCircle, Clock, ChevronLeft, ChevronRight } from 'lucide-react'

interface AttendanceCalendarProps {
  attendanceList?: any[]
  currentMonth?: Date
  onMonthChange?: (date: Date) => void
  className?: string
  showHeader?: boolean
  showLegend?: boolean
}

export default function AttendanceCalendar({
  attendanceList = [],
  currentMonth: externalCurrentMonth,
  onMonthChange,
  className = '',
  showHeader = true,
  showLegend = true
}: AttendanceCalendarProps) {
  const [internalCurrentMonth, setInternalCurrentMonth] = useState(new Date())
  const currentMonth = externalCurrentMonth || internalCurrentMonth

  // Fonctions pour le calendrier
  const getDaysInMonth = (date: Date) => {
    const year = date.getFullYear()
    const month = date.getMonth()
    return new Date(year, month + 1, 0).getDate()
  }

  const getFirstDayOfMonth = (date: Date) => {
    const year = date.getFullYear()
    const month = date.getMonth()
    return new Date(year, month, 1).getDay()
  }

  const formatDateKey = (date: Date) => {
    const year = date.getFullYear()
    const month = (date.getMonth() + 1).toString().padStart(2, '0')
    const day = date.getDate().toString().padStart(2, '0')
    return `${year}-${month}-${day}`
  }

  const getAttendanceStatus = (day: number) => {
    const currentDate = new Date()
    const selectedDate = new Date(currentMonth.getFullYear(), currentMonth.getMonth(), day)
    
    // Si c'est un jour à venir (futur), samedi ou dimanche, retourner 'future'
    if (selectedDate > currentDate || selectedDate.getDay() === 0 || selectedDate.getDay() === 6) {
      return 'future'
    }
    
    // Pour les jours passés, utiliser les vraies données d'attendance
    const dateKey = formatDateKey(selectedDate)
    
    // Chercher dans les données d'attendance réelles
    if (attendanceList && attendanceList.length > 0) {
      const attendance = attendanceList.find((a: any) => {
        if (a.clock_in_date) {
          const attendanceDate = a.clock_in_date.split('T')[0]
          return attendanceDate === dateKey
        }
        return false
      })
      
      if (attendance) {
        const isLate = attendance.attendance_state?.is_late || false
        return isLate ? 'late' : 'present'
      }
    }
    
    return 'absent'
  }

  const getAttendanceIcon = (status: string) => {
    switch (status) {
      case 'present':
        return <CheckCircle className="h-3 w-3 text-green-500" />
      case 'late':
        return <Clock className="h-3 w-3 text-yellow-500" />
      case 'absent':
        return <XCircle className="h-3 w-3 text-red-500" />
      case 'future':
        return null
      default:
        return null
    }
  }

  const getAttendanceColor = (status: string) => {
    switch (status) {
      case 'present':
        return 'bg-green-100 border-green-200'
      case 'late':
        return 'bg-yellow-100 border-yellow-200'
      case 'absent':
        return 'bg-red-100 border-red-200'
      case 'future':
        return 'bg-white border-gray-200'
      default:
        return 'bg-gray-100 border-gray-200'
    }
  }

  const nextMonth = () => {
    const newMonth = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1)
    if (onMonthChange) {
      onMonthChange(newMonth)
    } else {
      setInternalCurrentMonth(newMonth)
    }
  }

  const prevMonth = () => {
    const newMonth = new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1, 1)
    if (onMonthChange) {
      onMonthChange(newMonth)
    } else {
      setInternalCurrentMonth(newMonth)
    }
  }

  const isToday = (day: number) => {
    const today = new Date()
    return day === today.getDate() && 
           currentMonth.getMonth() === today.getMonth() && 
           currentMonth.getFullYear() === today.getFullYear()
  }

  return (
    <Card className={`bg-white border border-gray-200 shadow-sm rounded-xl ${className}`}>
      {showHeader && (
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle className="text-sm font-semibold text-gray-800">
              Calendrier de présence
            </CardTitle>
            <div className="flex items-center gap-2">
              <Button
                variant="outline"
                size="sm"
                onClick={prevMonth}
                className="p-1.5"
              >
                <ChevronLeft className="h-3 w-3" />
              </Button>
              <span className="text-xs font-medium text-gray-700 min-w-[80px] text-center">
                {currentMonth.toLocaleDateString('fr-FR', { 
                  month: 'long', 
                  year: 'numeric' 
                })}
              </span>
              <Button
                variant="outline"
                size="sm"
                onClick={nextMonth}
                className="p-1.5"
              >
                <ChevronRight className="h-3 w-3" />
              </Button>
            </div>
          </div>
        </CardHeader>
      )}
      <CardContent>
        <div className="grid grid-cols-7 gap-1">
          {/* Headers des jours */}
          {['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'].map((day) => (
            <div key={day} className="p-1.5 text-center text-xs font-medium text-gray-500">
              {day}
            </div>
          ))}
          
          {/* Jours vides au début */}
          {Array.from({ length: getFirstDayOfMonth(currentMonth) }).map((_, index) => (
            <div key={`empty-${index}`} className="p-1.5"></div>
          ))}
          
          {/* Jours du mois */}
          {Array.from({ length: getDaysInMonth(currentMonth) }).map((_, index) => {
            const day = index + 1
            const status = getAttendanceStatus(day)
            const today = isToday(day)
            
            return (
              <div
                key={day}
                className={`p-2 text-center border rounded-lg transition-colors ${
                  today 
                    ? 'bg-blue-100 border-blue-300 font-bold' 
                    : getAttendanceColor(status)
                }`}
              >
                <div className="flex flex-col items-center gap-0.5">
                  <span className={`text-xs ${today ? 'text-blue-800' : 'text-gray-700'}`}>
                    {day}
                  </span>
                  {getAttendanceIcon(status)}
                </div>
              </div>
            )
          })}
        </div>
        
        {/* Légende */}
        {showLegend && (
          <div className="mt-3 pt-3 border-t border-gray-200">
            <div className="flex items-center justify-center gap-3 text-xs">
              <div className="flex items-center gap-1">
                <CheckCircle className="h-2.5 w-2.5 text-green-500" />
                <span className="text-gray-600">Présent</span>
              </div>
              <div className="flex items-center gap-1">
                <Clock className="h-2.5 w-2.5 text-yellow-500" />
                <span className="text-gray-600">En retard</span>
              </div>
              <div className="flex items-center gap-1">
                <XCircle className="h-2.5 w-2.5 text-red-500" />
                <span className="text-gray-600">Absent</span>
              </div>
            </div>
          </div>
        )}
      </CardContent>
    </Card>
  )
} 