#!/usr/bin/env node

const { execSync } = require('child_process')
const fs = require('fs')
const path = require('path')

console.log('🧪 Test des configurations d\'environnements...\n')

// Test de la configuration FODECC
console.log('📋 Test FODECC:')
process.env.NODE_ENV = 'fodecc'
const fodeccConfig = require('../config/environments.ts')
const fodeccEnv = fodeccConfig.getCurrentConfig()

console.log(`✅ API Server: ${fodeccEnv.apiServer}`)
console.log(`✅ GraphQL URL: ${fodeccEnv.hasuraUrl}`)
console.log(`✅ Company: ${fodeccEnv.companyDisplayName}`)
console.log(`✅ Static Location: ${fodeccEnv.useStaticLocation ? 'Oui' : 'Non'}`)
console.log(`✅ Upload Type: ${fodeccEnv.uploadType || 'Aucun'}`)
console.log(`✅ Time Format: ${fodeccEnv.dateFormat.timeFormat}\n`)

// Test de la configuration CNPS
console.log('📋 Test CNPS:')
process.env.NODE_ENV = 'cnps'
const cnpsConfig = require('../config/environments.ts')
const cnpsEnv = cnpsConfig.getCurrentConfig()

console.log(`✅ API Server: ${cnpsEnv.apiServer}`)
console.log(`✅ GraphQL URL: ${cnpsEnv.hasuraUrl}`)
console.log(`✅ Company: ${cnpsEnv.companyDisplayName}`)
console.log(`✅ Static Location: ${cnpsEnv.useStaticLocation ? 'Oui' : 'Non'}`)
console.log(`✅ Upload Type: ${cnpsEnv.uploadType || 'Aucun'}`)
console.log(`✅ Time Format: ${cnpsEnv.dateFormat.timeFormat}`)
console.log(`✅ Coordinates: ${cnpsEnv.staticLocation ? `${cnpsEnv.staticLocation.lat}, ${cnpsEnv.staticLocation.long}` : 'Aucune'}\n`)

// Vérification des scripts NPM
console.log('📋 Vérification des scripts NPM:')
const packageJson = JSON.parse(fs.readFileSync(path.join(__dirname, '../package.json'), 'utf8'))
const scripts = packageJson.scripts

const requiredScripts = [
  'dev:fodecc',
  'dev:cnps',
  'build:fodecc',
  'build:cnps',
  'start:fodecc',
  'start:cnps'
]

requiredScripts.forEach(script => {
  if (scripts[script]) {
    console.log(`✅ ${script}: ${scripts[script]}`)
  } else {
    console.log(`❌ ${script}: Manquant`)
  }
})

console.log('\n🎉 Test terminé avec succès!')
console.log('\n📝 Pour utiliser:')
console.log('  npm run dev:fodecc  # Pour FODECC')
console.log('  npm run dev:cnps    # Pour CNPS')
