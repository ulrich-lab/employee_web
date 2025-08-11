'use client'

import { useEffect } from 'react'
import { getCurrentConfig } from '@/lib/config/environments'

export function DynamicTitle() {
  useEffect(() => {
    const config = getCurrentConfig()
    document.title = `VVIMS - ${config.companyName}`
  }, [])

  return null
}
