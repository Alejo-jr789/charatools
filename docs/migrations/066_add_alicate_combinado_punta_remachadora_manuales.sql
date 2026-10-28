-- =============================================================================
-- Migración 066: Productos para Línea Herramientas Manuales (Alicates y Remachadora)
-- =============================================================================
-- Archivo: docs/migrations/066_add_alicate_combinado_punta_remachadora_manuales.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-28
--
-- Productos agregados:
--   1. Alicate Combinado Universal 7" - 8"
--   2. Alicate de Punta Larga 6" - 8"
--   3. Remachadora Manual 10" (3/32" - 3/16")
-- =============================================================================

BEGIN;

-- 1. Alicate Combinado Universal 7" - 8"
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
  'Alicate Combinado Universal 7" - 8"',
  'alicate-combinado-universal-7-8',
  'HM-ALIC-COMB-7-8',
  'Alicate universal combinado de alta palanca en acero forjado con mordazas de agarre estriadas, zona curva para tubos y filo de corte templado por inducción. Medidas de 7" y 8".',
  'Alicate universal combinado (Lineman / Combination Pliers) forjado en acero al carbono o cromo vanadio con tratamiento térmico de alta frecuencia en filos y mordazas. Diseñado para múltiples funciones de taller, electricidad y construcción: sujeción firme de piezas planas y redondas, torsión y doblado de pernos y alambres, y corte limpio de cables de cobre, aluminio y alambres semiduros. Incorpora mangos ergonómicos bimateriales antideslizantes que ofrecen aislamiento cómodo y excelente transferencia de fuerza con menor fatiga. Disponible en medidas de 7 pulgadas (175 mm) y 8 pulgadas (200 mm).',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 13,
    'material', 'Acero al carbono forjado de alta resistencia',
    'tipoMordaza', 'Plana estriada con zona curva y cuchillas de corte lateral',
    'mangos', 'Bimaterial engomado ergonómico antideslizante',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '7"'),
      jsonb_build_object('value', '8"')
    ),
    'tags', jsonb_build_array(
      'alicate combinado',
      'alicate universal',
      'alicate de electricista',
      'alicate 8 pulgadas',
      'alicate 7 pulgadas',
      'combination pliers',
      'herramientas manuales',
      'taller',
      'electricidad'
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

-- 2. Alicate de Punta Larga 6" - 8"
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
  'Alicate de Punta Larga 6" - 8"',
  'alicate-punta-larga-6-8-pulgadas',
  'HM-ALIC-PTA-6-8',
  'Alicate de punta semirredonda larga (needle nose) en acero forjado para trabajos de precisión, sujeción en espacios reducidos y corte de alambre. Medidas de 6" y 8".',
  'Alicate de punta larga semirredonda (Long Nose / Needle Nose Pliers) forjado en acero al carbono de alta calidad con filos templados por inducción. Diseñado para alcanzar espacios estrechos, guiar, doblar y sujetar alambres, terminales eléctricos y piezas pequeñas en labores de electrónica, mecánica automotriz, refrigeración y cerrajería. Cuenta con mordaza estriada para agarre antideslizante y cuchilla lateral para corte preciso de cables. Mangos ergonómicos con recubrimiento de vinilo bimaterial antideslizante de alto confort. Disponible en medidas de 6 pulgadas (150 mm) y 8 pulgadas (200 mm).',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 14,
    'material', 'Acero al carbono forjado con tratamiento térmico',
    'tipoPunta', 'Semirredonda cónica de precisión con filo de corte lateral',
    'mangos', 'Bimaterial engomado ergonómico antideslizante',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '6"'),
      jsonb_build_object('value', '8"')
    ),
    'tags', jsonb_build_array(
      'alicate punta larga 6" - 8"',
      'alicate punta larga',
      'needle nose pliers',
      'alicate de punta',
      '6 pulgadas',
      '8 pulgadas',
      'electronica',
      'electricidad',
      'herramientas manuales'
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

-- 3. Remachadora Manual 10" (3/32" - 3/16")
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
  'Remachadora Manual 10" (3/32" - 3/16")',
  'remachadora-manual-10-pulgadas',
  'HM-REMACH-MAN-10',
  'Remachadora manual de palanca de 10 pulgadas para remaches ciegos de aluminio y acero. Incluye 4 boquillas intercambiables (3/32", 1/8", 5/32", 3/16") y llave de ajuste.',
  'Remachadora manual de palanca de 10 pulgadas (250 mm) construida con cuerpo de fundición de aluminio de alta resistencia y mango de acero tratado térmicamente. Ideal para fijación rápida y permanente de láminas metálicas, carrocerías, perfiles de aluminio, cerrajería, canaletas y ensambles generales. Equipada con sistema de mordazas de acero al cromo que sujetan y cortan el vástago del remache con mínimo esfuerzo. Incluye 4 boquillas intercambiables montadas directamente en el cuerpo para no extraviarlas (medidas: 3/32" [2.4 mm], 1/8" [3.2 mm], 5/32" [4.0 mm] y 3/16" [4.8 mm]), llave para cambio de boquillas y seguro de bloqueo metálico en el mango para almacenaje compacto.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 15,
    'longitud', '10 pulgadas (250 mm)',
    'cuerpo', 'Aleación de aluminio fundido de alta durabilidad',
    'boquillas', '4 boquillas intercambiables: 3/32" (2.4 mm), 1/8" (3.2 mm), 5/32" (4.0 mm) y 3/16" (4.8 mm)',
    'compatibilidadRemaches', 'Remaches ciegos de aluminio, acero y acero inoxidable',
    'accesorios', 'Incluye llave de servicio integrada para cambio de boquillas y seguro de cierre',
    'tags', jsonb_build_array(
      'remachadora 10" manual 3/32" - 1/8" - 5/32" - 3/16"',
      'remachadora manual',
      'remachadora 10 pulgadas',
      'hand riveter',
      'remaches ciegos',
      'aluminio',
      'herrería',
      'herramientas manuales'
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
