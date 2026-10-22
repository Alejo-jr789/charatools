-- =============================================================================
-- Migración 051: Productos de Seguridad Industrial (Guante Carnaza Corto Reforzado y Delantal de Soldar)
-- =============================================================================
-- Archivo: docs/migrations/051_add_guante_carnaza_delantal_soldar_seguridad.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-22
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
  -- 1. Guante Carnaza Corto Reforzado Palma y 5 Dedos
  (
    'Guante Carnaza Corto Reforzado Palma y 5 Dedos',
    'guante-carnaza-corto-reforzado-palma-5-dedos',
    'SEG-GUANTE-CARNAZA-CORTO-REF',
    'Guantes de seguridad en carnaza gris de puño corto con doble refuerzo exterior en palma y en los 5 dedos para máxima protección mecánica y abrasión.',
    'Guantes industriales de carnaza de cuero vacuno de primera calidad en diseño de caña corta (tipo operador / constructor). Incorporan refuerzo cocido de carnaza adicional tanto en la palma como en las yemas y caras frontales de los 5 dedos, brindando una barrera de resistencia superior contra cortes por fricción, astillas, abrasión severa, chispas ligeras y punzonamiento. Confeccionados con costuras reforzadas de hilo de alta tenacidad y forro interno suave que absorbe la humedad, ofreciendo un calce anatómico, cómodo y flexible para manejo de cargas pesadas, herrería, carpintería, minería, construcción civil y maniobra de herramientas de alto torque.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'seguridad-industrial' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'material', 'Carnaza de Cuero Vacuno',
      'refuerzo', 'Doble refuerzo en palma y 5 dedos',
      'tipoCana', 'Corta',
      'unidad', 'par',
      'stockStatus', 'available',
      'tags', jsonb_build_array('guante carnaza corto reforzado palma y 5 dedos', 'guantes de carnaza', 'guante reforzado', '5 dedos', 'carnaza corta', 'protección de manos', 'epp', 'seguridad industrial'),
      'priority', 23
    )
  ),

  -- 2. Delantal para Soldar Carnaza - Cuero
  (
    'Delantal para Soldar Carnaza - Cuero',
    'delantal-para-soldar-carnaza-cuero',
    'SEG-DELANTAL-SOLDAR-CARNAZA',
    'Peto / delantal de protección para soldador confeccionado en carnaza gruesa de cuero vacuno con tiras ajustables y bolsillo frontal.',
    'Delantal protector para soldador (mandil de soldadura) confeccionado en carnaza curtida de cuero vacuno de alto espesor y gran resistencia al calor radiante, chispas de esmerilado y salpicaduras incandescentes de soldadura (MMA, MIG, TIG). Diseñado con corte amplio para cubrir óptimamente desde el pecho hasta las rodillas, cuenta con tiras ajustables de amarre cruzado en espalda y cuello con hebillas metálicas de liberación rápida para un ajuste anatómico sin fatiga cervical, costuras reforzadas con hilo ignífugo de alta resistencia y bolsillo delantero para portar electrodos, tiza industrial o marcadores térmicos.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'seguridad-industrial' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'material', 'Carnaza de Cuero Vacuno Ignífuga',
      'dimensiones', 'Aproximadamente 60 x 90 cm',
      'ajuste', 'Tiras ajustables al cuello y cintura',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('delantal para soldar carnaza - cuero', 'delantal de carnaza', 'mandil para soldar', 'peto soldador', 'cuero vacuno', 'proteccion corporal', 'soldadura', 'epp', 'seguridad industrial'),
      'priority', 24
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
