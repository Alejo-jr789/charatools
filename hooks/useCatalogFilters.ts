/**
 * @file useCatalogFilters.ts
 * @description Hook que sincroniza los filtros del catálogo con la URL (SearchParams).
 *
 * Beneficio clave: Los filtros son COMPARTIBLES (copiar URL preserva el estado).
 * El filtrado es 100% client-side: sin llamadas al servidor, <50ms en móvil.
 *
 * Soporta: q (búsqueda), marca (multi), potMin/potMax, cat (categoría), stock (multi), sub (subcategoría)
 */

'use client'

import { useRouter, useSearchParams, usePathname } from 'next/navigation'
import { useCallback, useMemo } from 'react'
import type { CatalogProduct, CatalogFilters, StockStatus } from '@/lib/catalog.types'

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function normalizeText(text: string): string {
  return (text || '')
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .trim()
}

// ---------------------------------------------------------------------------
// Parsers de URL → Tipos
// ---------------------------------------------------------------------------

function parseFiltersFromParams(params: URLSearchParams): CatalogFilters & { cat?: string } {
  const potenciaMin = params.get('potMin') ? Number(params.get('potMin')) : undefined
  const potenciaMax = params.get('potMax') ? Number(params.get('potMax')) : undefined
  const q = params.get('q') || undefined
  const cat = params.get('cat') || undefined
  const sub = params.get('sub') || undefined
  const cashea = params.get('cashea') === 'true' ? 'true' : undefined

  return { potenciaMin, potenciaMax, q, cat, cashea, sub }
}

// ---------------------------------------------------------------------------
// Hook Principal
// ---------------------------------------------------------------------------

export function useCatalogFilters(allProducts: CatalogProduct[]) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()

  // Parsear filtros actuales de la URL
  const filters = useMemo(
    () => parseFiltersFromParams(searchParams),
    [searchParams]
  )

  // Categoría activa (extraída de los filtros o del pathname)
  const activeCategory = useMemo(() => {
    if (filters.cat) return filters.cat
    const segments = pathname.split('/').filter(Boolean)
    // segments: ['catalogo', 'plomeria']
    if (segments[0] === 'catalogo' && segments[1]) {
      return segments[1]
    }
    return null
  }, [filters.cat, pathname])

  // ── Filtrado instantáneo (client-side) ──────────────────────────────────

  const filteredProducts = useMemo(() => {
    let result = allProducts

    // Filtro por categoría
    if (filters.cat) {
      result = result.filter((p) => p.category === filters.cat)
    }

    // Filtro por subcategoría o sub-ítem (con soporte de unificación para plomería)
    if (filters.sub) {
      const SUBITEM_UNIFICATION: Record<string, string[]> = {
        'linea-sanitaria-estandar': ['tuberia-sanitaria-estandar', 'conexiones-sanitarias-estandar'],
        'linea-sanitaria-reforzada': ['tuberia-sanitaria-reforzada', 'conexiones-sanitarias-reforzadas'],
        'linea-agua-fria': ['tuberia-agua-fria', 'conexiones-agua-fria'],
        'linea-galvanizada': ['conexiones-galvanizadas'],
        'linea-termofusion-ppr': ['tuberia-termofusion-ppr', 'conexiones-termofusion-ppr'],
        'griferia': [
          'monomandos-estandar',
          'monomandos-altos',
          'grifos-individuales',
          'juegos-twin',
          'griferia-institucional',
          'monomandos-profesionales',
          'monomandos-extensibles',
          'cuello-cisne-tradicional',
          'griferias-instalacion-pared',
          'mezcladoras-grifos-individuales',
          'llaves-arresto',
          'valvulas-industriales-pesadas',
          'valvulas-pvc',
          'valvulas-retencion-especiales',
          'llaves-chorro-manguera'
        ],
        'griferia-lavamanos': [
          'monomandos-estandar',
          'monomandos-altos',
          'grifos-individuales',
          'juegos-twin',
          'griferia-institucional'
        ],
        'griferia-fregadores': [
          'monomandos-profesionales',
          'monomandos-extensibles',
          'cuello-cisne-tradicional',
          'griferias-instalacion-pared',
          'mezcladoras-grifos-individuales'
        ],
        'valvulas-llaves': [
          'llaves-arresto',
          'valvulas-industriales-pesadas',
          'valvulas-pvc',
          'valvulas-retencion-especiales',
          'llaves-chorro-manguera'
        ],
        'bombas-perifericas': [
          'bombas',
          'bombas-de-agua',
          'bombas-perifericas',
          'bomba-periferica-1-2hp',
          'bomba-periferica-3-4hp',
          'bomba-periferica-1hp'
        ],
        'bombas': [
          'bombas',
          'bombas-de-agua',
          'bombas-perifericas',
          'bomba-periferica-1-2hp',
          'bomba-periferica-3-4hp',
          'bomba-periferica-1hp'
        ]
      }
      const unified = SUBITEM_UNIFICATION[filters.sub]
      if (unified) {
        result = result.filter(
          (p) =>
            p.subcategory === filters.sub ||
            p.subitem === filters.sub ||
            (p.subitem ? unified.includes(p.subitem) : false) ||
            (p.subcategory ? unified.includes(p.subcategory) : false)
        )
      } else {
        result = result.filter(
          (p) => p.subcategory === filters.sub || p.subitem === filters.sub
        )
      }
    }



    // Filtro por potencia mínima
    if (filters.potenciaMin !== undefined) {
      result = result.filter(
        (p) => p.powerWatts !== undefined && p.powerWatts >= filters.potenciaMin!
      )
    }

    // Filtro por potencia máxima
    if (filters.potenciaMax !== undefined) {
      result = result.filter(
        (p) => p.powerWatts !== undefined && p.powerWatts <= filters.potenciaMax!
      )
    }



    // Filtro por búsqueda libre (q)
    if (filters.q) {
      const cleanQ = normalizeText(filters.q)
      const terms = cleanQ.split(/\s+/).filter(Boolean)

      result = result.filter((p) => {
        const nameNorm = normalizeText(p.name)
        const brandNorm = normalizeText(p.brand || '')
        const catNorm = normalizeText(p.categoryLabel || p.category || '')
        const subNorm = normalizeText(p.subcategory || '')
        const subitemNorm = normalizeText(p.subitem || '')
        const tagsNorm = (p.tags || []).map(normalizeText)
        const refNorm = normalizeText(p.reference || p.slug || '')

        if (
          nameNorm.includes(cleanQ) ||
          brandNorm.includes(cleanQ) ||
          catNorm.includes(cleanQ) ||
          subNorm.includes(cleanQ) ||
          subitemNorm.includes(cleanQ) ||
          refNorm.includes(cleanQ) ||
          tagsNorm.some((t) => t.includes(cleanQ))
        ) {
          return true
        }

        return terms.every(
          (t) =>
            nameNorm.includes(t) ||
            brandNorm.includes(t) ||
            catNorm.includes(t) ||
            subNorm.includes(t) ||
            subitemNorm.includes(t) ||
            tagsNorm.some((tag) => tag.includes(t))
        )
      })
    }

    // Filtro por Cashea
    if (filters.cashea === 'true') {
      result = result.filter((p) => p.isCasheaEligible)
    }

    // Ordenar: si hay búsqueda por texto, priorizar coincidencia directa en nombre
    if (filters.q) {
      const cleanQ = normalizeText(filters.q)
      const terms = cleanQ.split(/\s+/).filter(Boolean)

      const getRelevanceScore = (p: CatalogProduct): number => {
        const nameNorm = normalizeText(p.name)
        const brandNorm = normalizeText(p.brand || '')
        const catNorm = normalizeText(p.categoryLabel || p.category || '')
        const subNorm = normalizeText(p.subcategory || '')
        const subitemNorm = normalizeText(p.subitem || '')
        const tagsNorm = (p.tags || []).map(normalizeText)

        let score = 0

        // Máxima prioridad: el nombre del producto
        if (nameNorm.startsWith(cleanQ)) {
          score += 100
        } else if (nameNorm.includes(cleanQ)) {
          score += 80
        }

        // Alta prioridad: marca, subcategoría, categoría o tags
        if (brandNorm.includes(cleanQ)) score += 60
        if (subNorm.includes(cleanQ) || subitemNorm.includes(cleanQ)) score += 50
        if (catNorm.includes(cleanQ)) score += 40
        if (tagsNorm.some((t) => t.includes(cleanQ))) score += 40

        // Puntos adicionales por cada término individual presente en el nombre
        for (const t of terms) {
          if (nameNorm.includes(t)) score += 15
        }

        return score
      }

      return [...result].sort((a, b) => {
        const scoreA = getRelevanceScore(a)
        const scoreB = getRelevanceScore(b)

        if (scoreA !== scoreB) {
          return scoreB - scoreA // Mayor relevancia primero
        }

        const prioA = a.priority ?? 999
        const prioB = b.priority ?? 999
        if (prioA !== prioB) return prioA - prioB

        return a.name.localeCompare(b.name)
      })
    }

    // Ordenar por prioridad (tuberías primero, luego conexiones) y por nombre alfabéticamente
    return [...result].sort((a, b) => {
      const prioA = a.priority ?? 999
      const prioB = b.priority ?? 999
      if (prioA !== prioB) {
        return prioA - prioB
      }
      return a.name.localeCompare(b.name)
    })
  }, [allProducts, filters])

  // ── Mutadores de URL ────────────────────────────────────────────────────

  /**
   * Actualiza un SearchParam y navega (soft navigation = sin recarga).
   * Preserva todos los otros params existentes.
   */
  const updateParams = useCallback(
    (updates: Record<string, string | string[] | null>) => {
      const params = new URLSearchParams(searchParams.toString())
      let targetPathname = pathname

      Object.entries(updates).forEach(([key, value]) => {
        if (key === 'cat') {
          // Si estamos cambiando de categoría principal
          if (value === null) {
            targetPathname = '/catalogo'
          } else if (typeof value === 'string') {
            targetPathname = `/catalogo/${value}`
          }
          // Limpiar subcategoría al cambiar de categoría
          params.delete('sub')
          params.delete('cat')
          return
        }

        // Eliminar el param si el valor es null o array vacío
        if (value === null || (Array.isArray(value) && value.length === 0)) {
          params.delete(key)
          return
        }
        if (Array.isArray(value)) {
          params.delete(key)
          value.forEach((v) => params.append(key, v))
        } else {
          params.set(key, value)
        }
      })

      router.push(`${targetPathname}?${params.toString()}`, { scroll: false })
    },
    [router, pathname, searchParams]
  )

  /** Limpiar todos los filtros */
  const clearFilters = useCallback(() => {
    router.push(pathname, { scroll: false })
  }, [router, pathname])

  /** Contar filtros activos (para badge visual en botón de filtros) */
  const activeFilterCount = useMemo(() => {
    let count = 0
    if (filters.potenciaMin !== undefined) count++
    if (filters.potenciaMax !== undefined) count++
    if (filters.q) count++
    if (filters.cat) count++
    if (filters.sub) count++
    if (filters.cashea === 'true') count++
    return count
  }, [filters])

  return {
    filters,
    filteredProducts,
    updateParams,
    clearFilters,
    activeFilterCount,
    activeCategory,
  }
}
