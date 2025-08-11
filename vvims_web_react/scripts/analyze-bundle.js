#!/usr/bin/env node

const fs = require('fs')
const path = require('path')
const { execSync } = require('child_process')

console.log('🔍 Analyse du bundle VVIMS Hub...\n')

// Fonction pour analyser les dépendances
function analyzeDependencies() {
  console.log('📦 Analyse des dépendances...')
  
  try {
    const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'))
    const dependencies = packageJson.dependencies || {}
    const devDependencies = packageJson.devDependencies || {}
    
    console.log(`\n📊 Statistiques des dépendances:`)
    console.log(`- Dépendances de production: ${Object.keys(dependencies).length}`)
    console.log(`- Dépendances de développement: ${Object.keys(devDependencies).length}`)
    console.log(`- Total: ${Object.keys(dependencies).length + Object.keys(devDependencies).length}`)
    
    // Identifier les dépendances potentiellement lourdes
    const heavyDependencies = [
      '@apollo/client',
      'framer-motion',
      'lucide-react',
      'date-fns',
      'react-hook-form',
      'zustand',
      'tailwind-merge',
      'clsx'
    ]
    
    console.log('\n⚠️  Dépendances potentiellement lourdes:')
    heavyDependencies.forEach(dep => {
      if (dependencies[dep] || devDependencies[dep]) {
        console.log(`  - ${dep}`)
      }
    })
    
    return { dependencies, devDependencies }
  } catch (error) {
    console.error('❌ Erreur lors de l\'analyse des dépendances:', error.message)
    return null
  }
}

// Fonction pour analyser la structure du projet
function analyzeProjectStructure() {
  console.log('\n📁 Analyse de la structure du projet...')
  
  const srcPath = path.join(process.cwd(), 'src')
  const componentsPath = path.join(srcPath, 'components')
  const pagesPath = path.join(srcPath, 'app')
  
  try {
    // Compter les fichiers
    const countFiles = (dir) => {
      let count = 0
      const items = fs.readdirSync(dir, { withFileTypes: true })
      
      items.forEach(item => {
        const fullPath = path.join(dir, item.name)
        if (item.isDirectory()) {
          count += countFiles(fullPath)
        } else if (item.name.endsWith('.tsx') || item.name.endsWith('.ts')) {
          count++
        }
      })
      
      return count
    }
    
    const totalFiles = countFiles(srcPath)
    const componentFiles = countFiles(componentsPath)
    const pageFiles = countFiles(pagesPath)
    
    console.log(`\n📊 Statistiques des fichiers:`)
    console.log(`- Total de fichiers TypeScript/React: ${totalFiles}`)
    console.log(`- Composants: ${componentFiles}`)
    console.log(`- Pages: ${pageFiles}`)
    
    return { totalFiles, componentFiles, pageFiles }
  } catch (error) {
    console.error('❌ Erreur lors de l\'analyse de la structure:', error.message)
    return null
  }
}

// Fonction pour analyser la configuration
function analyzeConfiguration() {
  console.log('\n⚙️  Analyse de la configuration...')
  
  try {
    const nextConfig = fs.readFileSync('next.config.js', 'utf8')
    const tailwindConfig = fs.readFileSync('tailwind.config.ts', 'utf8')
    const tsConfig = fs.readFileSync('tsconfig.json', 'utf8')
    
    console.log('\n📊 Configuration détectée:')
    
    // Analyser next.config.js
    if (nextConfig.includes('experimental')) {
      console.log('✅ Optimisations expérimentales activées')
    } else {
      console.log('⚠️  Optimisations expérimentales non activées')
    }
    
    if (nextConfig.includes('optimizePackageImports')) {
      console.log('✅ Optimisation des imports de packages activée')
    } else {
      console.log('⚠️  Optimisation des imports de packages non activée')
    }
    
    // Analyser Tailwind
    if (tailwindConfig.includes('content')) {
      console.log('✅ Configuration Tailwind détectée')
    }
    
    // Analyser TypeScript
    if (tsConfig.includes('strict')) {
      console.log('✅ Mode strict TypeScript activé')
    }
    
    return true
  } catch (error) {
    console.error('❌ Erreur lors de l\'analyse de la configuration:', error.message)
    return false
  }
}

// Fonction pour générer des recommandations
function generateRecommendations(deps, structure) {
  console.log('\n💡 Recommandations d\'optimisation:')
  
  const recommendations = []
  
  // Recommandations basées sur les dépendances
  if (deps) {
    if (deps.dependencies['@apollo/client']) {
      recommendations.push({
        type: 'performance',
        priority: 'high',
        message: 'Optimiser la configuration Apollo Client avec des politiques de cache',
        action: 'Vérifier la configuration dans src/lib/graphql/client.ts'
      })
    }
    
    if (deps.dependencies['framer-motion']) {
      recommendations.push({
        type: 'bundle',
        priority: 'medium',
        message: 'Considérer le lazy loading pour framer-motion',
        action: 'Importer dynamiquement les composants d\'animation'
      })
    }
    
    if (deps.dependencies['lucide-react']) {
      recommendations.push({
        type: 'bundle',
        priority: 'medium',
        message: 'Optimiser les imports d\'icônes',
        action: 'Utiliser des imports spécifiques au lieu de l\'import global'
      })
    }
  }
  
  // Recommandations basées sur la structure
  if (structure && structure.totalFiles > 50) {
    recommendations.push({
      type: 'structure',
      priority: 'medium',
      message: 'Considérer le code splitting pour les pages',
      action: 'Implémenter React.lazy() pour les routes'
    })
  }
  
  // Recommandations générales
  recommendations.push({
    type: 'performance',
    priority: 'high',
    message: 'Implémenter React.memo pour les composants fréquemment re-rendus',
    action: 'Ajouter React.memo aux composants de liste et de formulaire'
  })
  
  recommendations.push({
    type: 'performance',
    priority: 'high',
    message: 'Utiliser useMemo et useCallback pour optimiser les calculs',
    action: 'Mémoiser les calculs coûteux et les callbacks'
  })
  
  recommendations.push({
    type: 'monitoring',
    priority: 'medium',
    message: 'Implémenter un système de monitoring des performances',
    action: 'Ajouter des métriques de performance avec web-vitals'
  })
  
  // Afficher les recommandations
  recommendations.forEach((rec, index) => {
    const priorityIcon = rec.priority === 'high' ? '🔴' : rec.priority === 'medium' ? '🟡' : '🟢'
    console.log(`\n${priorityIcon} ${rec.message}`)
    console.log(`   Action: ${rec.action}`)
  })
  
  return recommendations
}

// Fonction pour analyser les performances
function analyzePerformance() {
  console.log('\n⚡ Analyse des performances...')
  
  const performanceChecks = [
    {
      name: 'React.memo usage',
      check: () => {
        const srcPath = path.join(process.cwd(), 'src')
        const files = fs.readdirSync(srcPath, { recursive: true })
        let memoCount = 0
        let componentCount = 0
        
        files.forEach(file => {
          if (file.endsWith('.tsx') || file.endsWith('.ts')) {
            const content = fs.readFileSync(path.join(srcPath, file), 'utf8')
            if (content.includes('React.memo')) memoCount++
            if (content.includes('export default function') || content.includes('const') && content.includes('= () =>')) {
              componentCount++
            }
          }
        })
        
        return { memoCount, componentCount }
      }
    },
    {
      name: 'useMemo usage',
      check: () => {
        const srcPath = path.join(process.cwd(), 'src')
        const files = fs.readdirSync(srcPath, { recursive: true })
        let useMemoCount = 0
        let useCallbackCount = 0
        
        files.forEach(file => {
          if (file.endsWith('.tsx') || file.endsWith('.ts')) {
            const content = fs.readFileSync(path.join(srcPath, file), 'utf8')
            if (content.includes('useMemo')) useMemoCount++
            if (content.includes('useCallback')) useCallbackCount++
          }
        })
        
        return { useMemoCount, useCallbackCount }
      }
    }
  ]
  
  performanceChecks.forEach(check => {
    try {
      const result = check.check()
      console.log(`\n📊 ${check.name}:`)
      Object.entries(result).forEach(([key, value]) => {
        console.log(`  - ${key}: ${value}`)
      })
    } catch (error) {
      console.log(`❌ Erreur lors de l'analyse ${check.name}:`, error.message)
    }
  })
}

// Fonction principale
function main() {
  console.log('🚀 Démarrage de l\'analyse du bundle VVIMS Hub...\n')
  
  const deps = analyzeDependencies()
  const structure = analyzeProjectStructure()
  const config = analyzeConfiguration()
  
  analyzePerformance()
  
  const recommendations = generateRecommendations(deps, structure)
  
  console.log('\n📋 Résumé de l\'analyse:')
  console.log(`- Dépendances analysées: ${deps ? '✅' : '❌'}`)
  console.log(`- Structure analysée: ${structure ? '✅' : '❌'}`)
  console.log(`- Configuration analysée: ${config ? '✅' : '❌'}`)
  console.log(`- Recommandations générées: ${recommendations.length}`)
  
  console.log('\n🎯 Prochaines étapes:')
  console.log('1. Implémenter les recommandations prioritaires')
  console.log('2. Tester les performances avec Lighthouse')
  console.log('3. Monitorer les métriques de performance')
  console.log('4. Optimiser le bundle avec @next/bundle-analyzer')
  
  console.log('\n✨ Analyse terminée!')
}

// Exécuter l'analyse
if (require.main === module) {
  main()
}

module.exports = {
  analyzeDependencies,
  analyzeProjectStructure,
  analyzeConfiguration,
  generateRecommendations,
  analyzePerformance
}
