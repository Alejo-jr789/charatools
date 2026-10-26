-- =============================================================================
-- Migración 061: Líneas Principales Bombas y Selladores y Adhesivo
-- =============================================================================
-- Archivo: docs/migrations/061_create_bombas_and_selladores_adhesivo_categories.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-26
-- =============================================================================

BEGIN;

-- 1. Promover categoría 'Bombas' a Línea Principal (depth: 0, parent_id: NULL)
UPDATE public.categories
SET
  name = 'Bombas',
  depth = 0,
  parent_id = NULL,
  is_active = true,
  description = 'Bombas de agua periféricas, centrífugas, sumergibles, motobombas a gasolina y sistemas de presurización'
WHERE slug = 'bombas';

-- 2. Crear o actualizar categoría principal 'Selladores y Adhesivo' (depth: 0, parent_id: NULL)
INSERT INTO public.categories (name, slug, description, depth, parent_id, is_active)
VALUES
  (
    'Selladores y Adhesivo',
    'selladores-y-adhesivo',
    'Soldaduras líquidas para PVC y CPVC, siliconas, selladores, espuma expansiva y adhesivos de montaje',
    0,
    NULL,
    true
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  depth = 0,
  parent_id = NULL,
  is_active = true;

-- 3. Reasignar subcategoría 'selladores' para que pertenezca a 'selladores-y-adhesivo'
UPDATE public.categories
SET
  parent_id = (SELECT id FROM public.categories WHERE slug = 'selladores-y-adhesivo' LIMIT 1),
  depth = 1
WHERE slug = 'selladores';

-- 4. Reasignar productos de Bombas y Motobombas a la categoría principal 'Bombas'
UPDATE public.products
SET category_id = (SELECT id FROM public.categories WHERE slug = 'bombas' LIMIT 1)
WHERE slug IN (
  'bomba-de-agua-perifrica-12-hp',
  'bomba-de-agua-perifrica-34-hp',
  'bomba-de-agua-perifrica-1-hp',
  'bomba-centrifuga',
  'motobomba-gasolina',
  'press-control-automatico'
);

-- 5. Reasignar productos de Soldaduras PVC/CPVC, Selladores y Adhesivos a 'Selladores y Adhesivo'
UPDATE public.products
SET category_id = (SELECT id FROM public.categories WHERE slug = 'selladores-y-adhesivo' LIMIT 1)
WHERE slug IN (
  'soldadura-para-pvc-condiciones-humedas-164-galon',
  'soldadura-para-pvc-condiciones-humedas-132-galon',
  'soldadura-pvc-tubrica-transparente-multiproposito-1-64',
  'soldadura-cpvc-tubrica-naranja-agua-caliente-1-64',
  'soldadura-pvc-tubrica-alta-viscosidad-resistencia-1-4',
  'cemento-plastico-super-a',
  'asfalto-plastico-bituplast',
  'sellador-impermeable-covo',
  'cinta-aluminio-butilo-zasc',
  'espuma-expansiva-run',
  'adhesivo-montaje-reinco',
  'sellador-no-mas-clavos-zasc',
  'silicona-neutra-zasc'
);

COMMIT;
