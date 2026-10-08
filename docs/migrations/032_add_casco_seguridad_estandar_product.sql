-- =============================================================================
-- Migración 032: Casco de Seguridad Estándar (Seguridad Industrial)
-- =============================================================================
-- Archivo: docs/migrations/032_add_casco_seguridad_estandar_product.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-08
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
  (
    'Casco de Seguridad Estándar',
    'casco-de-seguridad-estandar',
    'SEG-CASCO-ESTANDAR',
    'Casco de seguridad industrial estándar con suspensión ajustable resistente a impactos.',
    'Casco de protección para seguridad industrial tipo estándar. Fabricado en polietileno de alta densidad (HDPE) resistente a impactos, penetración y salpicaduras. Cuenta con suspensión interior de cintas con ajuste regulable para máxima comodidad durante jornadas laborales en construcción, talleres e industria.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'cascos' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'cascos',
      'subitem', 'cascos',
      'tags', jsonb_build_array('casco', 'seguridad', 'casco de seguridad', 'proteccion', 'obra', 'construccion', 'seguridad industrial', 'epp'),
      'priority', 1
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
