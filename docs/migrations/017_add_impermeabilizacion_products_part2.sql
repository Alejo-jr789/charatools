-- =============================================================================
-- Migración 017: Productos de Impermeabilización (Parte 2)
-- =============================================================================
-- Archivo: docs/migrations/017_add_impermeabilizacion_products_part2.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-02
-- =============================================================================

BEGIN;

-- 1. Insertar nuevas marcas si no existen
INSERT INTO public.brands (name, slug, logo_url)
VALUES
  ('Covo', 'covo', NULL),
  ('Zasc', 'zasc', NULL),
  ('Run', 'run', NULL)
ON CONFLICT (slug) DO NOTHING;

-- 2. Insertar productos (Parte 2)
INSERT INTO public.products
  (name, slug, sku, short_desc, description, specs, is_casheable, brand_id, category_id)
VALUES
  (
    'Sellador Impermeabilizante Transparente Covo',
    'sellador-impermeable-covo',
    'COVO-SELLADOR-IMP',
    'Sellador impermeabilizante transparente para protección de superficies.',
    'Sellador impermeabilizante transparente Covo (Waterproof Sealant), ideal para sellar filtraciones y proteger superficies conservando su apariencia original.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":6,"tags":["sellador","impermeabilizante","transparente","covo"],"stockStatus":"available","unidad":"und","variantLabel":"Presentación","variants":[{"value":"500 ml"},{"value":"1 Litro"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'covo'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  ),
  (
    'Cinta de Aluminio de Butilo Zasc',
    'cinta-aluminio-butilo-zasc',
    'ZASC-CINTA-BUTILO',
    'Cinta de aluminio de butilo multipropósito.',
    'Cinta de aluminio de butilo multipropósito Zasc. Excelente resistencia térmica y poder de sellado garantizado para techos, tuberías y superficies expuestas.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":7,"tags":["cinta","aluminio","butilo","zasc","sellado","tapagoteras"],"stockStatus":"available","unidad":"rollo","subcategory":"selladores","subitem":"selladores","variantLabel":"Ancho","variants":[{"value":"3\""},{"value":"4\""}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'zasc'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  ),
  (
    'Espuma Expansiva Run',
    'espuma-expansiva-run',
    'RUN-ESPUMA-EXP',
    'Espuma expansiva para relleno y aislamiento.',
    'Espuma expansiva de poliuretano (Expanding Sealant Foam) marca Run, para el relleno, aislamiento térmico/acústico y sellado de grietas y cavidades.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":8,"tags":["espuma","expansiva","poliuretano","run","aislamiento","relleno"],"stockStatus":"available","unidad":"und","variantLabel":"Presentación","variants":[{"value":"300 ml"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'run'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  ),
  (
    'Adhesivo de Montaje Reinco',
    'adhesivo-montaje-reinco',
    'REINCO-ADHESIVO-MONTAJE',
    'Adhesivo de montaje listo para usar.',
    'Adhesivo de montaje Reinco, listo para usar y fácil de aplicar. Ideal para fijaciones fuertes en construcción y remodelación sin necesidad de perforar.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":9,"tags":["adhesivo","montaje","reinco","pegamento","fijacion"],"stockStatus":"available","unidad":"und","variantLabel":"Presentación","variants":[{"value":"1/4 Galón"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'reinco'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  ),
  (
    'Sellador No Más Clavos Zasc',
    'sellador-no-mas-clavos-zasc',
    'ZASC-NO-MAS-CLAVOS',
    'Adhesivo de montaje Unión Sin Clavo de secado rápido.',
    'Adhesivo de montaje Unión Sin Clavo Zasc (Nail-free adhesive). Extra fuerte, de secado rápido, perfecto para adherir zócalos, molduras y paneles sin usar clavos.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":10,"tags":["sellador","no mas clavos","zasc","adhesivo","montaje"],"stockStatus":"available","unidad":"und","variantLabel":"Presentación","variants":[{"value":"300 ml"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'zasc'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  )
ON CONFLICT (slug) DO NOTHING;

COMMIT;
