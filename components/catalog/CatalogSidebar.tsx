'use client'

/**
 * @file CatalogSidebar.tsx
 * @description Sidebar de filtros B2B estilo Grainger.
 *
 * Principios aplicados (frontend-ui-engineering.md):
 * - Componente focused: solo maneja la presentación de filtros por categorías principales.
 * - Estado en URL (SearchParams) via useCatalogFilters — no estado local duplicado.
 * - Acceso directo a categorías sin anidación de sublíneas.
 */

import { useState } from 'react'
import { ChevronDown, SlidersHorizontal } from 'lucide-react'
import type { CatalogFilters } from '@/lib/catalog.types'

const SIDEBAR_CATEGORIES = [
  { slug: 'herramientas-electricas', label: 'Herramientas Eléctricas' },
  { slug: 'herramientas-manuales', label: 'Herramientas Manuales' },
  { slug: 'soldadura', label: 'Soldadura' },
  { slug: 'plomeria', label: 'Plomería' },
  { slug: 'iluminacion', label: 'Iluminación' },
  { slug: 'electricidad', label: 'Electricidad' },
  { slug: 'impermeabilizacion', label: 'Impermeabilización' },
  { slug: 'seguridad-industrial', label: 'Seguridad Industrial' },
  { slug: 'salas-de-bano', label: 'Salas de Baño' },
]

// ── Tipos ──────────────────────────────────────────────────────────────────

export interface CatalogSidebarProps {
  filters: CatalogFilters
  activeFilterCount: number
  onUpdateParams: (updates: Record<string, string | string[] | null>) => void
  onClearFilters: () => void
  /** Categoría activa actual (slug de la URL, o null para 'todos') */
  activeCategory: string | null
  hideHeader?: boolean
  /** Control explícito de visibilidad permanente */
  showSidebar?: boolean
}

// ── Componente de Acordeón reutilizable ────────────────────────────────────

function FilterAccordion({
  title,
  defaultOpen = true,
  children,
}: {
  title: string
  defaultOpen?: boolean
  children: React.ReactNode
}) {
  const [isOpen, setIsOpen] = useState(defaultOpen)

  return (
    <div className="border-b border-gray-100 last:border-0">
      <button
        onClick={() => setIsOpen(!isOpen)}
        aria-expanded={isOpen}
        className="w-full flex items-center justify-between py-4 px-2 text-sm font-bold text-gray-900 hover:text-black transition-colors"
      >
        {title}
        <ChevronDown
          className={`w-4 h-4 text-gray-400 transition-transform duration-300 ${isOpen ? 'rotate-180 text-gray-900' : ''}`}
          aria-hidden="true"
        />
      </button>
      <div
        className={`overflow-hidden transition-all duration-300 ease-in-out ${
          isOpen ? 'max-h-[800px] opacity-100 pb-5' : 'max-h-0 opacity-0'
        }`}
      >
        <div className="px-1">
          {children}
        </div>
      </div>
    </div>
  )
}

// ── Contenido del Filtro (compartido entre Desktop y Mobile) ──────────────

export function FiltersContent({
  activeFilterCount,
  onUpdateParams,
  onClearFilters,
  activeCategory,
  hideHeader = false,
}: CatalogSidebarProps) {
  return (
    <div className="space-y-0">
      {/* Cabecera */}
      {!hideHeader && (
        <div className="flex items-center justify-between pb-3 mb-1 border-b border-gray-200">
          <div className="flex items-center gap-2">
            <SlidersHorizontal className="w-4 h-4 text-gray-500" aria-hidden="true" />
            <span className="text-sm font-black text-gray-900 uppercase tracking-wide">Filtros</span>
            {activeFilterCount > 0 && (
              <span className="inline-flex items-center justify-center w-5 h-5 bg-yellow-400 text-black text-xs font-bold rounded-full">
                {activeFilterCount}
              </span>
            )}
          </div>
          {activeFilterCount > 0 && (
            <button
              onClick={onClearFilters}
              className="text-xs text-gray-500 hover:text-red-500 underline underline-offset-2 transition-colors"
              aria-label="Limpiar todos los filtros"
            >
              Limpiar
            </button>
          )}
        </div>
      )}

      {/* Si el header está oculto pero hay filtros activos, mostramos botón limpiar */}
      {hideHeader && activeFilterCount > 0 && (
        <div className="flex justify-end mb-2">
          <button
            onClick={onClearFilters}
            className="text-xs text-red-500 font-bold hover:underline transition-colors"
          >
            Limpiar filtros ({activeFilterCount})
          </button>
        </div>
      )}

      {/* ── Filtro: Categorías Principales ── */}
      <FilterAccordion title="Categoría">
        <div className="space-y-1.5 px-1">
          {SIDEBAR_CATEGORIES.map((cat) => {
            const isActive = activeCategory === cat.slug

            return (
              <button
                key={cat.slug}
                onClick={() => onUpdateParams({ cat: isActive ? null : cat.slug, sub: null })}
                aria-pressed={isActive}
                className={`w-full text-left px-3 py-2.5 rounded-lg text-sm transition-all flex items-center justify-between ${
                  isActive
                    ? 'bg-yellow-400 text-black font-bold shadow-sm'
                    : 'text-gray-600 hover:bg-gray-100 hover:text-black font-medium'
                }`}
              >
                <span>{cat.label}</span>
                {isActive && <span className="w-2 h-2 rounded-full bg-black flex-shrink-0" />}
              </button>
            )
          })}
        </div>
      </FilterAccordion>
    </div>
  )
}

// ── Desktop Sidebar ────────────────────────────────────────────────────────

export function DesktopCatalogSidebar(props: CatalogSidebarProps) {
  const isVisible = props.showSidebar ?? true
  if (!isVisible) return null

  return (
    <aside
      className="hidden lg:block w-[260px] flex-shrink-0 sticky top-20 self-start max-h-[calc(100vh-80px)] overflow-y-auto bg-white border-r border-gray-200 p-4 transition-opacity duration-200"
      data-testid="category-sidebar"
      aria-label="Filtros del catálogo"
    >
      <FiltersContent {...props} />
    </aside>
  )
}
