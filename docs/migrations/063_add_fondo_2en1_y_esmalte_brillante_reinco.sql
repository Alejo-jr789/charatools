-- =============================================================================
-- Migración 063: Fondo 2 en 1 Fondox y Esmalte Brillante Reinco
-- =============================================================================
-- Archivo: docs/migrations/063_add_fondo_2en1_y_esmalte_brillante_reinco.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-27
--
-- Productos agregados a Línea 'Pintura y Accesorios':
--   1. Fondo 2 en 1 Fondox Reinco (Galón / 1/4 Galón - Blanco, Negro, Gris)
--   2. Esmalte Brillante Alta Protección Reinco (Galón / 1/4 Galón - Blanco, Negro, Gris)
-- =============================================================================

BEGIN;

-- 1. Fondo 2 en 1 Fondox Reinco
INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  brand_id,
  category_id,
  is_casheable,
  specs
)
VALUES (
  'Fondo 2 en 1 Fondox Reinco',
  'fondo-2-en-1-fondox-reinco',
  'REINCO-FONDO-2EN1-FONDOX',
  'Fondo anticorrosivo y acabado 2 en 1 (Fondox) para metal y herrería. Disponible en Galón y 1/4 Galón en colores Blanco, Negro y Gris.',
  'Fondo y acabado 2 en 1 base solvente marca Reinco (línea Fondox). Combina en una sola aplicación las propiedades inhibidoras de corrosión de un fondo protector de alta adherencia con la cobertura estética y resistencia de una pintura de acabado. Formulado para simplificar los trabajos de herrería, rejas, portones, tuberías y estructuras metálicas en general tanto en interiores como en exteriores, reduciendo tiempos de aplicación y costos de mano de obra. Presentaciones de Galón y 1/4 Galón en colores Blanco, Negro y Gris.',
  (SELECT id FROM public.brands WHERE slug = 'reinco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 17,
    'tipoProducto', 'Fondo y Acabado 2 en 1 (Fondox)',
    'aplicacion', 'Protección anticorrosiva y acabado directo sobre metales ferrosos y herrería',
    'variantLabel', 'Presentación y Color',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1/4 Galón - Gris'),
      jsonb_build_object('value', '1/4 Galón - Negro'),
      jsonb_build_object('value', '1/4 Galón - Blanco'),
      jsonb_build_object('value', 'Galón - Gris'),
      jsonb_build_object('value', 'Galón - Negro'),
      jsonb_build_object('value', 'Galón - Blanco')
    ),
    'tags', jsonb_build_array(
      'fondo 2 en 1 fondox reinco',
      'fondo 2 en 1 reinco',
      'fondox',
      'reinco',
      'fondo y acabado',
      'fondo anticorrosivo 2 en 1',
      'fondo gris',
      'fondo negro',
      'fondo blanco',
      'herrería',
      'pintura y accesorios'
    )
  )
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  is_casheable = EXCLUDED.is_casheable,
  specs = EXCLUDED.specs,
  updated_at = now();

-- 2. Esmalte Brillante Alta Protección Reinco
INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  brand_id,
  category_id,
  is_casheable,
  specs
)
VALUES (
  'Esmalte Brillante Alta Protección Reinco',
  'esmalte-brillante-alta-proteccion-reinco',
  'REINCO-ESMALTE-BRILLANTE-ALTA-PROT',
  'Esmalte sintético brillante alquídico de alta protección y resistencia para metales y madera. Presentaciones de Galón y 1/4 Galón en Blanco, Negro y Gris.',
  'Esmalte sintético brillante de alta protección marca Reinco formulado con resinas alquídicas de máxima calidad. Proporciona una película de alto brillo, dureza y elasticidad que resiste la intemperie, la abrasión y la radiación solar. Ideal para el embellecimiento y protección duradera de superficies metálicas (portones, rejas, marcos, maquinarias) y de madera en ambientes interiores y exteriores. Excelente nivelación, secado uniforme y máxima retención de brillo y color. Presentaciones en Galón y 1/4 Galón, en colores Blanco, Negro y Gris.',
  (SELECT id FROM public.brands WHERE slug = 'reinco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 18,
    'tipoProducto', 'Esmalte sintético brillante alquídico',
    'acabado', 'Brillante / Alta protección',
    'aplicacion', 'Metales ferrosos, madera, portones, rejas, marcos y maquinarias',
    'variantLabel', 'Presentación y Color',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1/4 Galón - Gris'),
      jsonb_build_object('value', '1/4 Galón - Negro'),
      jsonb_build_object('value', '1/4 Galón - Blanco'),
      jsonb_build_object('value', 'Galón - Gris'),
      jsonb_build_object('value', 'Galón - Negro'),
      jsonb_build_object('value', 'Galón - Blanco')
    ),
    'tags', jsonb_build_array(
      'esmalte brillante alta protección reinco',
      'esmalte brillante reinco',
      'esmalte alta proteccion',
      'esmalte sintetico',
      'reinco',
      'esmalte blanco',
      'esmalte negro',
      'esmalte gris',
      'galon esmalte',
      'pintura brillante',
      'pintura y accesorios'
    )
  )
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  is_casheable = EXCLUDED.is_casheable,
  specs = EXCLUDED.specs,
  updated_at = now();

COMMIT;
