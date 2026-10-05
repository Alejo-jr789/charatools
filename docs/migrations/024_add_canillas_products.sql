-- =============================================================================
-- Migración 024: Productos de Sublínea Canillas (Plomería)
-- =============================================================================
-- Archivo: docs/migrations/024_add_canillas_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-05
-- =============================================================================

BEGIN;

-- 1. Asegurar vinculación jerárquica de Canillas con Plomería
UPDATE public.categories 
SET parent_id = (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
    depth = 1
WHERE slug = 'canillas';

-- 2. Insertar productos de Canillas
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
  -- 1. Canilla Plástica Flexible
  (
    'Canilla Plástica Flexible',
    'canilla-plastica-flexible',
    'GEN-CANILLA-PLASTICA-FLEX',
    'Canilla plástica flexible para lavamanos y sanitarios en medidas 1/2" x 1/2" y 1/2" x 5/8" (40cm y 60cm).',
    'Canilla plástica flexible de alta resistencia para conexión de agua en lavamanos, fregaderos y sanitarios. Fabricada con materiales termoplásticos de gran durabilidad y tuercas ergonómicas de fácil ajuste manual sin necesidad de herramientas pesadas. Disponible en conexiones 1/2" x 1/2" y 1/2" x 5/8", en largos de 40 cm y 60 cm.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'canillas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'canillas',
      'subitem', 'canillas',
      'variantLabel', 'Medida y Largo',
      'variants', jsonb_build_array(
        jsonb_build_object('value', '1/2" x 1/2" (40 cm)'),
        jsonb_build_object('value', '1/2" x 1/2" (60 cm)'),
        jsonb_build_object('value', '1/2" x 5/8" (40 cm)'),
        jsonb_build_object('value', '1/2" x 5/8" (60 cm)')
      ),
      'tags', jsonb_build_array('canilla', 'plastica', 'canilla flexible', 'lavamano', 'sanitario', 'plomeria', '1/2', '5/8', '40cm', '60cm'),
      'priority', 1
    )
  ),

  -- 2. Canilla Flexible Malla de Acero
  (
    'Canilla Flexible Malla de Acero',
    'canilla-flexible-malla-acero',
    'GEN-CANILLA-MALLA-ACERO',
    'Canilla flexible trenzada con malla de acero inoxidable para alta presión en 1/2" x 1/2" y 1/2" x 5/8" (40cm y 60cm).',
    'Canilla flexible con recubrimiento trenzado en malla de acero inoxidable para conexiones hidrosanitarias de alta presión y temperatura. Tubo interior de caucho sintético EPDM y conectores metálicos reforzados que garantizan máxima estanqueidad y resistencia a la corrosión. Disponible en conexiones 1/2" x 1/2" y 1/2" x 5/8", en longitudes de 40 cm y 60 cm.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'canillas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'canillas',
      'subitem', 'canillas',
      'variantLabel', 'Medida y Largo',
      'variants', jsonb_build_array(
        jsonb_build_object('value', '1/2" x 1/2" (40 cm)'),
        jsonb_build_object('value', '1/2" x 1/2" (60 cm)'),
        jsonb_build_object('value', '1/2" x 5/8" (40 cm)'),
        jsonb_build_object('value', '1/2" x 5/8" (60 cm)')
      ),
      'tags', jsonb_build_array('canilla', 'acero', 'malla de acero', 'inox', 'canilla flexible', 'lavamano', 'fregadero', 'sanitario', 'plomeria', '1/2', '5/8', '40cm', '60cm'),
      'priority', 2
    )
  ),

  -- 3. Canilla Flexible para Monomando
  (
    'Canilla Flexible para Monomando',
    'canilla-flexible-monomando',
    'GEN-CANILLA-MONOMANDO',
    'Canilla flexible trenzada de acero inoxidable especial para griferías monomando en largos de 40cm y 60cm.',
    'Canilla flexible trenzada en acero inoxidable especialmente diseñada para la conexión de griferías tipo monomando en lavamanos y fregaderos. Incluye terminal con espiga y sellos de doble junta tórica para inserción hermética en la base del monomando y tuerca de 1/2" para llave de arresto. Disponible en 40 cm y 60 cm.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'canillas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'canillas',
      'subitem', 'canillas',
      'variantLabel', 'Largo',
      'variants', jsonb_build_array(
        jsonb_build_object('value', '40 cm'),
        jsonb_build_object('value', '60 cm')
      ),
      'tags', jsonb_build_array('canilla', 'monomando', 'griferia', 'canilla flexible', 'acero inoxidable', 'lavamano', 'fregadero', 'plomeria', '40cm', '60cm'),
      'priority', 3
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
