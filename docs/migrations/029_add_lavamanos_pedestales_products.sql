-- =============================================================================
-- Migración 029: Productos de Sublínea Lavamanos y Pedestales (Salas de Baño)
-- =============================================================================
-- Archivo: docs/migrations/029_add_lavamanos_pedestales_products.sql
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
  -- 1. Lavamanos Shelby de Pedestal o para Colgar
  (
    'Lavamanos Shelby de Pedestal o para Colgar',
    'lavamanos-shelby-pedestal-o-para-colgar',
    'VENC-LAV-SHELBY-PEDESTAL',
    'Lavamanos versátil modelo Shelby para instalación con pedestal o suspendido a la pared (para colgar).',
    'Lavamanos de porcelana sanitaria vitrificada modelo Shelby. Diseño funcional y versátil que permite su instalación tanto con pedestal de apoyo como suspendido directamente a la pared (para colgar). Cuenta con superficie vitrificada brillante resistente a manchas y rayaduras, con perforaciones estándar para grifería monomando o individual.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'venceramica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'lavamanos-pedestales' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'lavamanos-pedestales',
      'subitem', 'lavamanos-pedestales',
      'tags', jsonb_build_array('lavamanos', 'pedestal', 'shelby', 'lavamanos para colgar', 'lavamanos con pedestal', 'salas de bano', 'sanitario', 'venceramica'),
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
