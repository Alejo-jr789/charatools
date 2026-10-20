'use client'

import React, { useState, useRef } from 'react'
import Link from 'next/link'
import { Droplets, Lightbulb, Zap, Umbrella, ChevronDown, ChevronRight, LayoutGrid, Shield, Bath, Flame } from 'lucide-react'
import { trackSelectCategory } from '@/lib/analytics'

export type SubItem = { name: string; href: string; isHeader?: boolean; isIndented?: boolean }
export type Subcategory = { name: string; href: string; items?: SubItem[] }
export interface Category {
  id: string
  name: string
  icon: React.ComponentType<any>
  href: string
  description?: string
  subcategories: Subcategory[]
}

// Taxonomía oficial de categorías principales
export const CATEGORIES: Category[] = [
  {
    id: 'herramientas-electricas',
    name: 'Herramientas Eléctricas',
    icon: Zap,
    href: '/catalogo/herramientas-electricas',
    description: 'Taladros, esmeriles, sierras, rotomartillos y herramientas profesionales para alto rendimiento.',
    subcategories: []
  },
  {
    id: 'soldadura',
    name: 'Soldadura',
    icon: Flame,
    href: '/catalogo/soldadura',
    description: 'Máquinas de soldar inverter, electrodos, caretas, pinzas y accesorios para soldadura profesional.',
    subcategories: []
  },
  {
    id: 'plomeria',
    name: 'Plomería',
    icon: Droplets,
    href: '/catalogo/plomeria',
    description: 'Tuberías, conexiones sanitarias, agua fría, PPR termofusión, grifería, llaves y bombas.',
    subcategories: []
  },
  {
    id: 'iluminacion',
    name: 'Iluminación',
    icon: Lightbulb,
    href: '/catalogo/iluminacion',
    description: 'Paneles LED, focos, reflectores, lámparas de emergencia e iluminación industrial.',
    subcategories: []
  },
  {
    id: 'electricidad',
    name: 'Electricidad',
    icon: Zap,
    href: '/catalogo/electricidad',
    description: 'Cables, tableros, breakers, tomacorrientes, interruptores y canalización EMT/PVC.',
    subcategories: []
  },
  {
    id: 'impermeabilizacion',
    name: 'Impermeabilización',
    icon: Umbrella,
    href: '/catalogo/impermeabilizacion',
    description: 'Mantos asfálticos, pinturas elastoméricas, primers y selladores de alta durabilidad.',
    subcategories: []
  },
  {
    id: 'seguridad-industrial',
    name: 'Seguridad Industrial',
    icon: Shield,
    href: '/catalogo/seguridad-industrial',
    description: 'Cascos, guantes de protección, lentes, calzado de seguridad y señalización vial.',
    subcategories: []
  },
  {
    id: 'salas-de-bano',
    name: 'Salas de Baño',
    icon: Bath,
    href: '/catalogo/salas-de-bano',
    description: 'Inodoros, lavamanos, pedestales, muebles de baño y accesorios sanitarios.',
    subcategories: []
  }
]

export function DesktopMegaMenu() {
  const [isOpen, setIsOpen] = useState(false)
  const [activeCategory, setActiveCategory] = useState<string>(CATEGORIES[0].id)
  const timeoutRef = useRef<NodeJS.Timeout | null>(null)

  const handleMouseEnter = () => {
    if (timeoutRef.current) clearTimeout(timeoutRef.current)
    setIsOpen(true)
  }

  const handleMouseLeave = () => {
    timeoutRef.current = setTimeout(() => {
      setIsOpen(false)
    }, 200)
  }

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Escape') {
      setIsOpen(false)
    } else if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault()
      setIsOpen(!isOpen)
    }
  }

  const handleCategoryHover = (catId: string) => {
    setActiveCategory(catId)
  }

  const activeCatData = CATEGORIES.find(c => c.id === activeCategory) || CATEGORIES[0]

  return (
    <div
      className="hidden md:block relative z-50 flex-shrink-0"
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      <button
        aria-expanded={isOpen}
        aria-haspopup="menu"
        onKeyDown={handleKeyDown}
        className="flex items-center gap-2 h-11 px-4 rounded-xl bg-gray-800 text-white font-semibold hover:bg-gray-700 transition-colors focus:outline-none focus:ring-2 focus:ring-yellow-400 whitespace-nowrap"
      >
        Nuestro Catálogo <ChevronDown className={`w-4 h-4 transition-transform duration-200 ${isOpen ? 'rotate-180' : ''}`} />
      </button>

      <div
        role="menu"
        className={`absolute top-[calc(100%+8px)] left-0 bg-white border border-gray-200 rounded-xl shadow-2xl overflow-hidden transition-all duration-200 ease-out w-[580px] max-w-[calc(100vw-2rem)] ${
          isOpen
            ? 'opacity-100 visible translate-y-0 pointer-events-auto delay-0'
            : 'opacity-0 invisible -translate-y-2 pointer-events-none delay-100'
        }`}
      >
        <div className="flex h-[390px]">

          {/* ── Columna 1: Categorías principales ── */}
          <div className="w-[250px] bg-gray-50 border-r border-gray-200 overflow-y-auto p-3 flex-shrink-0">
            <Link
              href="/catalogo"
              role="menuitem"
              onClick={() => { setIsOpen(false); trackSelectCategory('all-products') }}
              className="w-full flex items-center justify-between p-3 rounded-lg text-sm font-black transition-all group focus:outline-none focus:ring-2 focus:ring-yellow-400 mb-3 bg-yellow-400 text-black shadow-md hover:bg-yellow-500 border border-yellow-500"
            >
              <div className="flex items-center gap-3">
                <LayoutGrid className="w-5 h-5" />
                <span>Explora todo</span>
              </div>
              <ChevronRight className="w-4 h-4" />
            </Link>

            <p className="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2 px-1">Categorías</p>

            {CATEGORIES.map((cat) => {
              const isActive = activeCategory === cat.id
              return (
                <Link
                  key={cat.id}
                  href={cat.href}
                  role="menuitem"
                  onMouseEnter={() => handleCategoryHover(cat.id)}
                  onClick={() => { setIsOpen(false); trackSelectCategory(cat.id) }}
                  onFocus={() => handleCategoryHover(cat.id)}
                  className={`w-full flex items-center justify-between p-2.5 rounded-lg text-sm font-bold transition-all group focus:outline-none focus:ring-2 focus:ring-yellow-400 mb-1 ${
                    isActive ? 'bg-white text-black shadow-sm border border-gray-200' : 'text-gray-600 hover:bg-gray-200 border border-transparent'
                  }`}
                >
                  <div className="flex items-center gap-2.5">
                    <cat.icon className={`w-4 h-4 transition-colors ${isActive ? 'text-yellow-500' : 'text-gray-400 group-hover:text-gray-600'}`} />
                    <span className="text-xs">{cat.name}</span>
                  </div>
                  <ChevronRight className={`w-3.5 h-3.5 transition-all ${isActive ? 'text-gray-400 opacity-100 translate-x-0' : 'text-gray-300 opacity-0 -translate-x-2'}`} />
                </Link>
              )
            })}
          </div>

          {/* ── Columna 2: Acceso Directo y Resumen de Categoría ── */}
          <div className="flex-1 bg-white p-6 flex flex-col items-center justify-center text-center">
            <div className="w-16 h-16 rounded-2xl bg-yellow-50 text-yellow-500 flex items-center justify-center mb-4 border border-yellow-200/60 shadow-sm">
              <activeCatData.icon className="w-8 h-8" />
            </div>
            <h3 className="text-lg font-bold text-gray-900 mb-2">{activeCatData.name}</h3>
            <p className="text-xs text-gray-500 max-w-xs mb-6 leading-relaxed">
              {activeCatData.description || `Explora todo el catálogo de ${activeCatData.name.toLowerCase()} disponible para entrega inmediata y cotización.`}
            </p>
            <Link
              href={activeCatData.href}
              onClick={() => { setIsOpen(false); trackSelectCategory(activeCatData.id) }}
              className="inline-flex items-center gap-2 px-5 py-2.5 bg-yellow-400 hover:bg-yellow-500 text-black font-bold text-xs rounded-xl shadow-md hover:shadow-lg transition-all"
            >
              <span>Ver todos los productos de {activeCatData.name}</span>
              <ChevronRight className="w-3.5 h-3.5" />
            </Link>
          </div>

        </div>
      </div>
    </div>
  )
}

export function MobileMegaMenu({ closeMenu }: { closeMenu: () => void }) {
  return (
    <nav className="flex flex-col w-full" role="navigation" aria-label="Catálogo Móvil">
      <p className="text-xs font-black text-gray-500 uppercase tracking-widest mb-3 px-1 border-b border-gray-800 pb-2">Nuestro Catálogo</p>

      {/* ── Link Directo a Todo el Catálogo (Mobile) ── */}
      <Link
        href="/catalogo"
        onClick={() => { closeMenu(); trackSelectCategory('all-products') }}
        className="w-full flex items-center justify-between p-4 mb-3 bg-yellow-400 text-black rounded-xl text-sm font-black shadow-lg active:scale-[0.98] transition-all border border-yellow-500"
      >
        <div className="flex items-center gap-3">
          <LayoutGrid className="w-5 h-5 text-black" />
          <span>Explora todos nuestros productos</span>
        </div>
        <ChevronRight className="w-5 h-5 text-black" />
      </Link>

      <div className="space-y-1.5">
        {CATEGORIES.map(cat => (
          <div key={cat.id} className="bg-gray-800/50 rounded-xl overflow-hidden">
            <Link
              href={cat.href}
              onClick={() => { closeMenu(); trackSelectCategory(cat.id) }}
              className="w-full flex items-center justify-between p-3.5 transition-colors hover:bg-gray-800 active:bg-gray-700"
            >
              <div className="flex items-center gap-3">
                <cat.icon className="w-5 h-5 text-yellow-400" />
                <span className="font-bold text-gray-200 text-sm">{cat.name}</span>
              </div>
              <ChevronRight className="w-4 h-4 text-gray-400" />
            </Link>
          </div>
        ))}
      </div>
    </nav>
  )
}
