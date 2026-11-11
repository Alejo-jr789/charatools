-- =============================================================================
-- Migración 082: Garrucha de 4 Ruedas para Riel Colgante (Línea Ruedas)
-- =============================================================================
-- Archivo: docs/migrations/082_add_garruchas_riel_colgante_ruedas.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-10
--
-- Productos agregados:
--   1. Garrucha de 4 Ruedas para Riel Colgante (1" P/Riel 1 1/2", 1 1/2" P/Riel 2", 2" P/Riel 2 1/2")
-- =============================================================================

BEGIN;

-- 1. Garrucha de 4 Ruedas para Riel Colgante 1" - 1 1/2" - 2"
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
  'Garrucha de 4 Ruedas para Riel Colgante 1" - 1 1/2" - 2"',
  'garrucha-4-ruedas-para-riel-colgante',
  'RUED-GARR-RIEL-COLG-SERIES',
  'Carretilla o garrucha colgante de 4 rodamientos de acero galvanizado con vástago roscado de suspensión, tuercas y pletina de anclaje para portones y puertas corredizas suspendidas sobre riel tipo C. Disponible en 1" (riel 1 1/2"), 1 1/2" (riel 2") y 2" (riel 2 1/2").',
  'Garrucha o carretilla colgante de 4 ruedas para puertas y portones corredizos suspendidos de servicio pesado. Fabricada con un cuerpo robusto de acero al carbono galvanizado que integra cuatro rodamientos de bolas de acero templado blindados (rolineras) montados en pares tándem, proporcionando un deslizamiento ultra suave, silencioso y de bajo rozamiento dentro de rieles superiores tipo caja o perfil "C". Equipada con un vástago roscado central de acero de alta resistencia que permite calibrar y nivelar con exactitud la altura y plomo de la hoja de la puerta, pletina o soporte de fijación con perforaciones para atornillar o soldar al marco superior del portón, y contratuercas hexagonales de seguridad para evitar desajustes por vibración. Diseñada para soportar cargas pesadas continuas en portones de galpones industriales, talleres, almacenes, cancelas y cerramientos corredizos suspendidos.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'ruedas' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 7,
    'marca', 'Genérico',
    'material', 'Acero al carbono con acabado cincado / galvanizado electrolítico anticorrosión',
    'tipoCarretilla', 'Garrucha colgante de 4 ruedas tándem con rodamientos de bolas sellados',
    'incluye', 'Cuerpo de 4 ruedas, espárrago roscado de regulación vertical, pletina de sujeción al portón y 2 tuercas de seguridad',
    'ajuste', 'Regulación de altura y nivelación milimétrica mediante perno roscado',
    'aplicaciones', 'Portones corredizos colgantes, puertas de galpón, puertas de granero pesadas, cancelas suspendidas e instalaciones industriales',
    'variantLabel', 'Medida de Rueda y Riel Compatible',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1" (para Riel 1 1/2")'),
      jsonb_build_object('value', '1 1/2" (para Riel 2")'),
      jsonb_build_object('value', '2" (para Riel 2 1/2")')
    ),
    'tags', jsonb_build_array(
      'garrucha',
      'garrucha colgante',
      'carretilla para riel',
      'riel colgante',
      'porton colgante',
      '4 ruedas',
      'riel tipo c',
      'puerta corrediza colgante',
      'ruedas'
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
