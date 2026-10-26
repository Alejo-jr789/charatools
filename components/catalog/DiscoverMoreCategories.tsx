import Link from 'next/link'
import { Search, Tag } from 'lucide-react'
import { MOCK_PRODUCTS } from '@/lib/catalog.types'

interface MainCategoryDef {
  slug: string
  label: string
  href: string
}

const ALL_MAIN_CATEGORIES: MainCategoryDef[] = [
  { slug: 'herramientas-electricas', label: 'Herramientas Eléctricas', href: '/catalogo/herramientas-electricas' },
  { slug: 'herramientas-manuales', label: 'Herramientas Manuales', href: '/catalogo/herramientas-manuales' },
  { slug: 'soldadura', label: 'Soldadura', href: '/catalogo/soldadura' },
  { slug: 'bombas', label: 'Bombas', href: '/catalogo/bombas' },
  { slug: 'plomeria', label: 'Plomería', href: '/catalogo/plomeria' },
  { slug: 'iluminacion', label: 'Iluminación', href: '/catalogo/iluminacion' },
  { slug: 'electricidad', label: 'Electricidad', href: '/catalogo/electricidad' },
  { slug: 'impermeabilizacion', label: 'Impermeabilización', href: '/catalogo/impermeabilizacion' },
  { slug: 'pintura-y-accesorios', label: 'Pintura y Accesorios', href: '/catalogo/pintura-y-accesorios' },
  { slug: 'selladores-y-adhesivo', label: 'Selladores y Adhesivo', href: '/catalogo/selladores-y-adhesivo' },
  { slug: 'seguridad-industrial', label: 'Seguridad Industrial', href: '/catalogo/seguridad-industrial' },
  { slug: 'salas-de-bano', label: 'Salas de Baño', href: '/catalogo/salas-de-bano' },
]

interface DiscoverMoreCategoriesProps {
  categorySlug: string
  isCompact?: boolean
}

export function DiscoverMoreCategories({
  categorySlug,
  isCompact = false,
}: DiscoverMoreCategoriesProps) {
  // Mostramos las otras categorías principales de la tienda
  const otherCategories = ALL_MAIN_CATEGORIES.filter((c) => c.slug !== categorySlug)

  const options = otherCategories.map((cat) => {
    const count = MOCK_PRODUCTS.filter((p) => p.category === cat.slug).length
    return {
      label: cat.label,
      href: cat.href,
      count,
    }
  })

  if (options.length === 0) return null

  return (
    <section
      aria-labelledby="discover-more"
      className={`border-t border-gray-200 ${isCompact ? 'py-6' : 'py-12 md:py-16'}`}
    >
      <div className="max-w-4xl mx-auto px-4 text-center">
        <h2
          id="discover-more"
          className="text-sm md:text-base font-bold text-gray-900 mb-6 inline-flex items-center gap-2"
        >
          <Search className="w-4 h-4 text-gray-400" aria-hidden="true" />
          Explora otras categorías de nuestro catálogo
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
                {opt.count > 0 && (
                  <span
                    className="text-[10px] font-bold text-gray-400 group-hover:text-yellow-600 relative -top-0.5"
                    aria-label={`${opt.count} productos`}
                  >
                    {opt.count}
                  </span>
                )}
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  )
}
