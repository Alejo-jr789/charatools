-- =============================================================================
-- Migración 031: Asientos y Kit de Herraje (Sublínea Accesorios - Salas de Baño)
-- =============================================================================
-- Archivo: docs/migrations/031_add_asientos_y_herraje_accesorios_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-07
-- =============================================================================

BEGIN;

INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  is_casheable,
  brand_id,
  category_id,
  specs
)
VALUES
  -- 1. Asiento Montecristo Elongado
  (
    'Asiento Montecristo Elongado',
    'asiento-montecristo-elongado',
    'ACC-ASIENTO-MONTECRISTO',
    'Asiento y tapa para inodoro diseño Montecristo elongado de alta resistencia con bisagras ajustables.',
    'Asiento para inodoro con tapa de formato elongado modelo Montecristo. Fabricado en polipropileno de alta densidad resistente a impactos, manchas y productos de limpieza. Incluye herrajes de fijación y bisagras reforzadas con ajuste multiposición para un acople perfecto sobre tazas alargadas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'venceramica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'accesorios' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'accesorios',
      'subitem', 'accesorios',
      'tags', jsonb_build_array('asiento', 'tapa', 'montecristo', 'elongado', 'asiento elongado', 'tapa de poceta', 'inodoro', 'poceta', 'salas de bano', 'accesorios', 'venceramica'),
      'priority', 6
    )
  ),

  -- 2. Asiento Estándar Plus
  (
    'Asiento Estándar Plus',
    'asiento-estandar-plus',
    'ACC-ASIENTO-ESTANDAR-PLUS',
    'Asiento y tapa universal para inodoro redondo estándar con acabado liso y bisagras reforzadas.',
    'Asiento con tapa para inodoro de formato redondo estándar modelo Estándar Plus. Elaborado en polímero resistente de acabado brillante y bordes suaves para máxima comodidad e higiene. Sistema de sujeción universal compatible con inodoros convencionales (Valencia, Coronet y estándar).',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'accesorios' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'accesorios',
      'subitem', 'accesorios',
      'tags', jsonb_build_array('asiento', 'tapa', 'estandar plus', 'asiento redondo', 'tapa de poceta', 'inodoro', 'poceta', 'salas de bano', 'accesorios'),
      'priority', 7
    )
  ),

  -- 3. Kit de Herraje para Poceta
  (
    'Kit de Herraje para Poceta',
    'kit-herraje-poceta',
    'ACC-KIT-HERRAJE-POCETA',
    'Kit universal completo de herraje para tanque de inodoro con válvula de llenado, descarga y flapper.',
    'Juego completo de herraje universal para tanque de poceta/inodoro. Incluye válvula de entrada de agua tipo flotante con boya y varilla, válvula de descarga con tubo de rebose, flapper (sapo) con cadena de fijación, manguera de recarga y empacaduras de sellado. Solución integral para reparar o renovar el sistema interno del tanque previniendo fugas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'accesorios' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'accesorios',
      'subitem', 'accesorios',
      'tags', jsonb_build_array('herraje', 'kit de herraje', 'herraje de poceta', 'tanque', 'valvula de llenado', 'flotante', 'boya', 'valvula de descarga', 'flapper', 'sapo', 'inodoro', 'poceta', 'salas de bano', 'accesorios'),
      'priority', 8
    )
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  is_casheable = EXCLUDED.is_casheable,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  specs = EXCLUDED.specs;

COMMIT;
