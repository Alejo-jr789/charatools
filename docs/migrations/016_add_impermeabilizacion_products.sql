-- =============================================================================
-- Migración 016: Productos de Impermeabilización
-- =============================================================================
-- Archivo: docs/migrations/016_add_impermeabilizacion_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-02
-- =============================================================================

BEGIN;

-- 1. Insertar marcas si no existen
INSERT INTO public.brands (name, slug, logo_url)
VALUES
  ('Reinco', 'reinco', NULL),
  ('Cindu', 'cindu', NULL),
  ('Edil', 'edil', NULL),
  ('Super A', 'super-a', NULL),
  ('Bituplast', 'bituplast', NULL)
ON CONFLICT (slug) DO NOTHING;

-- 2. Insertar productos de Impermeabilización
INSERT INTO public.products
  (name, slug, sku, short_desc, description, specs, is_casheable, brand_id, category_id)
VALUES
  (
    'Manto Asfáltico Cindu',
    'manto-asfaltico-cindu',
    'CINDU-MANTO',
    'Manto asfáltico certificado Cindu para impermeabilización de cubiertas.',
    'Manto asfáltico certificado Cindu diseñado para la impermeabilización de áreas comerciales y residenciales. Resiste alto tráfico y exposición UV.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":1,"tags":["manto","asfaltico","impermeabilizacion","techos","cindu"],"stockStatus":"available","unidad":"rollo","subcategory":"mantos","subitem":"mantos","variantLabel":"Espesor","variants":[{"value":"2.7 mm"},{"value":"3.2 mm"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'cindu'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  ),
  (
    'Pintura Elastomérica Impermeabilizante Reinco',
    'pintura-elastomerica-reinco',
    'REINCO-PINTURA-ELASTO',
    'Pintura impermeabilizante de alta calidad. Colores: Rojo, Verde, Negro y Blanco.',
    'Pintura elastomérica impermeabilizante formulada para sellar y proteger techos, terrazas y cubiertas. Disponible en colores Rojo, Verde, Negro y Blanco.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":2,"tags":["pintura","elastomerica","impermeabilizante","reinco","techo"],"stockStatus":"available","unidad":"und","subcategory":"pinturas","subitem":"pinturas","variantLabel":"Presentación","variants":[{"value":"Galón"},{"value":"Cuñete"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'reinco'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  ),
  (
    'Cemento Plástico Flexi Plastic Super A',
    'cemento-plastico-super-a',
    'SUPERA-CEMENTO-PLASTICO',
    'Pasta elastomérica tapa goteras para fisuras y grietas.',
    'Cemento plástico (Flexi Plastic), pasta elastomérica especialmente diseñada para tapar goteras, fisuras y reparar grietas en techos antes de impermeabilizar.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":3,"tags":["cemento","plastico","sellador","tapa goteras","pasta","elastomerica","super a"],"stockStatus":"available","unidad":"und","variantLabel":"Presentación","variants":[{"value":"1/4 Galón"},{"value":"Cuñete"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'super-a'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  ),
  (
    'Primer / Imprimador EkoPrimer Edil',
    'ekoprimer-edil',
    'EDIL-EKOPRIMER',
    'Primer asfáltico para preparación de superficies antes de impermeabilizar.',
    'EkoPrimer, imprimador asfáltico base para acondicionar placas y superficies asegurando máxima adherencia del manto o impermeabilizante.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":4,"tags":["primer","imprimador","ekoprimer","asfaltico","edil"],"stockStatus":"available","unidad":"und","variantLabel":"Presentación","variants":[{"value":"Galón"},{"value":"Cuñete"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'edil'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  ),
  (
    'Asfalto Plástico Bituplast',
    'asfalto-plastico-bituplast',
    'BITUPLAST-ASFALTO-PLAS',
    'Asfalto plástico cemento para reparaciones y sellado.',
    'Asfalto plástico (Plastic Asphalt Cement) ideal para el sellado y reparación de superficies, juntas y grietas en techos de concreto o metal.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":5,"tags":["asfalto","plastico","cemento","sellador","bituplast"],"stockStatus":"available","unidad":"und","variantLabel":"Presentación","variants":[{"value":"1/4 Galón"},{"value":"Galón"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'bituplast'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  )
ON CONFLICT (slug) DO NOTHING;

COMMIT;
