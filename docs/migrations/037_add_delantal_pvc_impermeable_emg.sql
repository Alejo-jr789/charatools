-- =============================================================================
-- Migración 037: Delantal de PVC Impermeable EMG (Seguridad Industrial)
-- =============================================================================
-- Archivo: docs/migrations/037_add_delantal_pvc_impermeable_emg.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-08
-- =============================================================================

BEGIN;

INSERT INTO public.categories (name, slug, parent_id)
VALUES
  ('Protección Corporal', 'proteccion-corporal', (SELECT id FROM public.categories WHERE slug = 'seguridad-industrial' LIMIT 1))
ON CONFLICT (slug) DO NOTHING;

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
    'Delantal de PVC Impermeable EMG',
    'delantal-de-pvc-impermeable-emg',
    'SEG-DELANTAL-PVC-IMP',
    'Delantal industrial de PVC impermeable de alta resistencia química y al agua con tiras de ajuste.',
    'Delantal de protección industrial confeccionado en PVC vinílico impermeable de alto calibre marca EMG. Diseñado para proteger el torso y extremidades inferiores contra salpicaduras de agua, grasas, aceites, químicos ligeros, detergentes y productos de limpieza. Cuenta con ojetes termosellados y cordones de sujeción ajustables al cuello y cintura. Ideal para carnicerías, plantas de procesamiento de alimentos, frigoríficos, lavado industrial, talleres y labores de saneamiento.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'proteccion-corporal' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'proteccion-corporal',
      'subitem', 'delantales',
      'variantLabel', 'Color',
      'variants', jsonb_build_array(
        jsonb_build_object('value', 'Blanco'),
        jsonb_build_object('value', 'Negro')
      ),
      'tags', jsonb_build_array('delantal', 'delantal de pvc', 'impermeable', 'mandil', 'proteccion corporal', 'lavado', 'alimentos', 'emg', 'epp', 'seguridad industrial'),
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
