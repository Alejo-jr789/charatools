import Link from 'next/link'
import { Search, Tag } from 'lucide-react'
import { MOCK_PRODUCTS } from '@/lib/catalog.types'
import type { CatalogProduct } from '@/lib/catalog.types'

interface SubcategoryDef {
  label: string
  href: string
  filterFn: (p: CatalogProduct) => boolean
}

// Subcategorías reales oficiales del catálogo sincronizadas con el MegaMenu y Sidebar
const CATEGORY_SUBCATEGORIES: Record<string, SubcategoryDef[]> = {
  iluminacion: [
    {
      label: 'Focos y Tubos LED',
      href: '/catalogo/iluminacion?sub=focos-led',
      filterFn: (p) =>
        p.category === 'iluminacion' &&
        (p.subcategory === 'focos-led' ||
          Boolean(p.tags?.some((t) => ['LED', 'bombillo', 'tubo', 'dicroico'].includes(t)))),
    },
    {
      label: 'Paneles',
      href: '/catalogo/iluminacion?sub=paneles',
      filterFn: (p) =>
        p.category === 'iluminacion' &&
        (p.subcategory === 'paneles' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('panel')))),
    },
    {
      label: 'Reflectores',
      href: '/catalogo/iluminacion?sub=reflectores',
      filterFn: (p) =>
        p.category === 'iluminacion' &&
        (p.subcategory === 'reflectores' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('reflector')))),
    },
    {
      label: 'Iluminación Industrial',
      href: '/catalogo/iluminacion?sub=industrial',
      filterFn: (p) =>
        p.category === 'iluminacion' &&
        (p.subcategory === 'industrial' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('industrial') || t.toLowerCase().includes('galpón')))),
    },
    {
      label: 'Lámparas de Emergencia',
      href: '/catalogo/iluminacion?sub=emergencia',
      filterFn: (p) =>
        p.category === 'iluminacion' &&
        (p.subcategory === 'emergencia' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('emergencia') || t.toLowerCase().includes('recargable')))),
    },
  ],
  electricidad: [
    {
      label: 'Cables y Conductores',
      href: '/catalogo/electricidad?sub=cables',
      filterFn: (p) =>
        p.category === 'electricidad' &&
        (p.subcategory === 'cables' || Boolean(p.tags?.some((t) => t.toLowerCase().includes('cable')))),
    },
    {
      label: 'Tableros y Breakers',
      href: '/catalogo/electricidad?sub=tableros',
      filterFn: (p) =>
        p.category === 'electricidad' &&
        (p.subcategory === 'tableros' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('breaker') || t.toLowerCase().includes('tablero')))),
    },
    {
      label: 'Tomacorrientes e Interruptores',
      href: '/catalogo/electricidad?sub=tomacorrientes',
      filterFn: (p) =>
        p.category === 'electricidad' &&
        (p.subcategory === 'tomacorrientes' ||
          Boolean(p.tags?.some((t) =>
            ['tomacorriente', 'interruptor', 'cinta', '3m'].some((k) => t.toLowerCase().includes(k))
          ))),
    },
    {
      label: 'Canalización y Accesorios',
      href: '/catalogo/electricidad?sub=canalizacion',
      filterFn: (p) =>
        p.category === 'electricidad' &&
        (p.subcategory === 'canalizacion' ||
          Boolean(p.tags?.some((t) => ['tubo', 'canalizacion', 'cajetin', 'conduit'].some((k) => t.toLowerCase().includes(k))))),
    },
  ],
  plomeria: [
    {
      label: 'Línea Sanitaria Estándar',
      href: '/catalogo/plomeria?sub=linea-sanitaria-estandar',
      filterFn: (p) =>
        p.category === 'plomeria' &&
        (p.subcategory === 'linea-sanitaria-estandar' ||
          Boolean(p.subitem && p.subitem.includes('sanitaria-estandar'))),
    },
    {
      label: 'Línea Sanitaria Reforzada',
      href: '/catalogo/plomeria?sub=linea-sanitaria-reforzada',
      filterFn: (p) =>
        p.category === 'plomeria' &&
        (p.subcategory === 'linea-sanitaria-reforzada' ||
          Boolean(p.subitem && p.subitem.includes('sanitaria-reforzada'))),
    },
    {
      label: 'Línea Agua Fría',
      href: '/catalogo/plomeria?sub=linea-agua-fria',
      filterFn: (p) =>
        p.category === 'plomeria' &&
        (p.subcategory === 'linea-agua-fria' ||
          Boolean(p.subitem && p.subitem.includes('agua-fria'))),
    },
    {
      label: 'Línea Agua Caliente',
      href: '/catalogo/plomeria?sub=linea-agua-caliente',
      filterFn: (p) =>
        p.category === 'plomeria' &&
        (p.subcategory === 'linea-agua-caliente' ||
          Boolean(p.subitem && p.subitem.includes('agua-caliente')) ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('agua caliente') || t.toLowerCase().includes('cpvc')))),
    },
    {
      label: 'Grifería y Válvulas',
      href: '/catalogo/plomeria?sub=griferia',
      filterFn: (p) =>
        p.category === 'plomeria' &&
        (p.subcategory === 'griferia' ||
          Boolean(p.subitem &&
            ['griferia', 'valvula', 'llave', 'monomando', 'grifo'].some((k) => p.subitem!.includes(k)))),
    },
    {
      label: 'Bombas de Agua',
      href: '/catalogo/plomeria?sub=bombas',
      filterFn: (p) =>
        p.category === 'plomeria' &&
        (p.subcategory === 'bombas' ||
          Boolean(p.subitem && p.subitem.includes('bomba')) ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('bomba')))),
    },
    {
      label: 'Canillas',
      href: '/catalogo/plomeria?sub=canillas',
      filterFn: (p) =>
        p.category === 'plomeria' &&
        (p.subcategory === 'canillas' ||
          Boolean(p.subitem && p.subitem.includes('canilla')) ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('canilla')))),
    },
    {
      label: 'Termofusión PPR',
      href: '/catalogo/plomeria?sub=linea-termofusion-ppr',
      filterFn: (p) =>
        p.category === 'plomeria' &&
        (p.subcategory === 'linea-termofusion-ppr' ||
          Boolean(p.subitem && p.subitem.includes('termofusion'))),
    },
  ],
  'herramientas-electricas': [
    {
      label: 'Taladros Percutores',
      href: '/catalogo/herramientas-electricas?q=taladro',
      filterFn: (p) =>
        p.category === 'herramientas-electricas' &&
        (Boolean(p.tags?.some((t) => t.toLowerCase().includes('taladro'))) || p.name.toLowerCase().includes('taladro')),
    },
    {
      label: 'Esmeriles y Amoladoras',
      href: '/catalogo/herramientas-electricas?q=esmeril',
      filterFn: (p) =>
        p.category === 'herramientas-electricas' &&
        (Boolean(p.tags?.some((t) => t.toLowerCase().includes('esmeril'))) || p.name.toLowerCase().includes('esmeril')),
    },
    {
      label: 'Sierras y Cortadoras',
      href: '/catalogo/herramientas-electricas?q=sierra',
      filterFn: (p) =>
        p.category === 'herramientas-electricas' &&
        (Boolean(p.tags?.some((t) => t.toLowerCase().includes('sierra'))) || p.name.toLowerCase().includes('sierra')),
    },
  ],
  'herramientas-manuales': [
    {
      label: 'Destornilladores y Puntas',
      href: '/catalogo/herramientas-manuales?q=destornillador',
      filterFn: (p) =>
        p.category === 'herramientas-manuales' &&
        (Boolean(p.tags?.some((t) => t.toLowerCase().includes('destornillador'))) ||
          p.name.toLowerCase().includes('destornillador')),
    },
    {
      label: 'Llaves y Alicates',
      href: '/catalogo/herramientas-manuales?q=llave',
      filterFn: (p) =>
        p.category === 'herramientas-manuales' &&
        (Boolean(p.tags?.some((t) => t.toLowerCase().includes('llave') || t.toLowerCase().includes('alicate'))) ||
          p.name.toLowerCase().includes('llave') ||
          p.name.toLowerCase().includes('alicate')),
    },
    {
      label: 'Martillos y Mazos',
      href: '/catalogo/herramientas-manuales?q=martillo',
      filterFn: (p) =>
        p.category === 'herramientas-manuales' &&
        (Boolean(p.tags?.some((t) => t.toLowerCase().includes('martillo'))) || p.name.toLowerCase().includes('martillo')),
    },
    {
      label: 'Flexómetros y Medición',
      href: '/catalogo/herramientas-manuales?q=flexometro',
      filterFn: (p) =>
        p.category === 'herramientas-manuales' &&
        (Boolean(p.tags?.some((t) => t.toLowerCase().includes('flexometro') || t.toLowerCase().includes('cinta'))) ||
          p.name.toLowerCase().includes('flexometro')),
    },
  ],
  impermeabilizacion: [
    {
      label: 'Mantos Asfálticos',
      href: '/catalogo/impermeabilizacion?sub=mantos',
      filterFn: (p) =>
        p.category === 'impermeabilizacion' &&
        (p.subcategory === 'mantos' || Boolean(p.tags?.some((t) => t.toLowerCase().includes('manto')))),
    },
    {
      label: 'Pinturas y Primers',
      href: '/catalogo/impermeabilizacion?sub=pinturas',
      filterFn: (p) =>
        p.category === 'impermeabilizacion' &&
        (p.subcategory === 'pinturas' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('primer') || t.toLowerCase().includes('pintura')))),
    },
    {
      label: 'Selladores y Cemento Plástico',
      href: '/catalogo/impermeabilizacion?sub=selladores',
      filterFn: (p) =>
        p.category === 'impermeabilizacion' &&
        (p.subcategory === 'selladores' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('sellador') || t.toLowerCase().includes('cemento plastico')))),
    },
  ],
  'seguridad-industrial': [
    {
      label: 'Cascos de Seguridad',
      href: '/catalogo/seguridad-industrial?sub=cascos',
      filterFn: (p) =>
        p.category === 'seguridad-industrial' &&
        (p.subcategory === 'cascos' || Boolean(p.tags?.some((t) => t.toLowerCase().includes('casco')))),
    },
    {
      label: 'Guantes de Protección',
      href: '/catalogo/seguridad-industrial?sub=guantes',
      filterFn: (p) =>
        p.category === 'seguridad-industrial' &&
        (p.subcategory === 'guantes' || Boolean(p.tags?.some((t) => t.toLowerCase().includes('guante')))),
    },
    {
      label: 'Lentes y Protección Visual',
      href: '/catalogo/seguridad-industrial?sub=lentes',
      filterFn: (p) =>
        p.category === 'seguridad-industrial' &&
        (p.subcategory === 'lentes' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('lente') || t.toLowerCase().includes('careta') || t.toLowerCase().includes('visor') || t.toLowerCase().includes('monogafa') || t.toLowerCase().includes('facial')))),
    },
    {
      label: 'Calzado de Seguridad',
      href: '/catalogo/seguridad-industrial?sub=calzado',
      filterFn: (p) =>
        p.category === 'seguridad-industrial' &&
        (p.subcategory === 'calzado' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('bota') || t.toLowerCase().includes('calzado')))),
    },
    {
      label: 'Protección Respiratoria',
      href: '/catalogo/seguridad-industrial?sub=proteccion-respiratoria',
      filterFn: (p) =>
        p.category === 'seguridad-industrial' &&
        (p.subcategory === 'proteccion-respiratoria' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('mascarilla') || t.toLowerCase().includes('respirador') || t.toLowerCase().includes('kn95')))),
    },
    {
      label: 'Señalización y Vialidad',
      href: '/catalogo/seguridad-industrial?sub=senalizacion-vial',
      filterFn: (p) =>
        p.category === 'seguridad-industrial' &&
        (p.subcategory === 'senalizacion-vial' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('cono') || t.toLowerCase().includes('chaleco') || t.toLowerCase().includes('cinta') || t.toLowerCase().includes('vial') || t.toLowerCase().includes('senalizacion')))),
    },
    {
      label: 'Protección Corporal y Delantales',
      href: '/catalogo/seguridad-industrial?sub=proteccion-corporal',
      filterFn: (p) =>
        p.category === 'seguridad-industrial' &&
        (p.subcategory === 'proteccion-corporal' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('delantal') || t.toLowerCase().includes('mandil') || t.toLowerCase().includes('corporal')))),
    },
  ],
  'salas-de-bano': [
    {
      label: 'Inodoros',
      href: '/catalogo/salas-de-bano?sub=inodoros',
      filterFn: (p) =>
        p.category === 'salas-de-bano' &&
        (p.subcategory === 'inodoros' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('inodoro') || t.toLowerCase().includes('poceta') || t.toLowerCase().includes('wc')))),
    },
    {
      label: 'Lavamanos y Pedestales',
      href: '/catalogo/salas-de-bano?sub=lavamanos-pedestales',
      filterFn: (p) =>
        p.category === 'salas-de-bano' &&
        (p.subcategory === 'lavamanos-pedestales' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('lavamano') || t.toLowerCase().includes('pedestal')))),
    },
    {
      label: 'Accesorios',
      href: '/catalogo/salas-de-bano?sub=accesorios',
      filterFn: (p) =>
        p.category === 'salas-de-bano' &&
        (p.subcategory === 'accesorios' ||
          Boolean(p.tags?.some((t) => t.toLowerCase().includes('accesorio') || t.toLowerCase().includes('herraje') || t.toLowerCase().includes('repuesto')))),
    },
  ],
}

interface DiscoverMoreCategoriesProps {
  categorySlug: string
  isCompact?: boolean
}

export function DiscoverMoreCategories({
  categorySlug,
  isCompact = false,
}: DiscoverMoreCategoriesProps) {
  const definitions = CATEGORY_SUBCATEGORIES[categorySlug] || []

  // Calcular conteo real de productos para cada subcategoría
  const options = definitions
    .map((def) => {
      const count = MOCK_PRODUCTS.filter(def.filterFn).length
      return {
        label: def.label,
        href: def.href,
        count: count > 0 ? count : 1,
      }
    })
    .filter((opt) => opt.count > 0)

  if (options.length === 0) return null

  return (
    <section
      className={`${isCompact ? 'py-8' : 'py-12 md:py-16'} bg-white border-t border-gray-100`}
      aria-labelledby="discover-more"
    >
      <div className="max-w-4xl mx-auto px-4 text-center">
        <h2
          id="discover-more"
          className="text-sm md:text-base font-bold text-gray-900 mb-6 inline-flex items-center gap-2"
        >
          <Search className="w-4 h-4 text-gray-400" aria-hidden="true" />
          Explora más opciones relacionadas
        </h2>

        <div className={`flex flex-wrap justify-center gap-3 md:gap-4 ${isCompact ? 'mt-4' : 'mt-6'}`}>
          {options.map((opt) => (
            <Link
              key={opt.label}
              href={opt.href}
              className="group flex items-center gap-3 px-4 py-2 md:py-2.5 rounded-full border border-gray-200 bg-white hover:bg-gray-50 hover:shadow-md hover:border-yellow-400 transition-all duration-300"
            >
              {/* Ícono referencial */}
              <div className="w-8 h-8 rounded-md bg-gray-100 flex items-center justify-center group-hover:bg-yellow-100 transition-colors">
                <Tag className="w-3.5 h-3.5 text-gray-500 group-hover:text-yellow-600" />
              </div>

              <div className="flex items-start gap-1 pr-2">
                <span className="text-sm font-medium text-gray-700 group-hover:text-gray-900">
                  {opt.label}
                </span>
                <span
                  className="text-[10px] font-bold text-gray-400 group-hover:text-yellow-600 relative -top-0.5"
                  aria-label={`${opt.count} productos`}
                >
                  {opt.count}
                </span>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  )
}
