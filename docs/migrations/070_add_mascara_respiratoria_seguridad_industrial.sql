-- =============================================================================
-- Migración 070: Producto para Línea Seguridad Industrial (Máscara Respiratoria 1 y 2 Filtros)
-- =============================================================================
-- Archivo: docs/migrations/070_add_mascara_respiratoria_seguridad_industrial.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-30
--
-- Producto agregado:
--   1. Máscara Respiratoria 1 Filtro - 2 Filtros
-- =============================================================================

BEGIN;

-- 1. Máscara Respiratoria 1 Filtro - 2 Filtros
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
  'Máscara Respiratoria 1 Filtro - 2 Filtros',
  'mascara-respiratoria-1-filtro-2-filtros',
  'SEG-MASC-RESP-1-2F',
  'Respirador de media cara reutilizable con cuerpo en elastómero flexible, válvula de exhalación y arnés ajustable. Disponible en presentación de 1 filtro central o 2 filtros laterales de carbón activado para vapores orgánicos, pinturas, solventes y polvos.',
  'Máscara respiratoria reutilizable de media cara diseñada para la protección efectiva de las vías respiratorias en labores de pintura con pistola y brocha, aplicación de solventes, lacas, barnices, resinas, fumigación agrícola, carpintería, desbaste y ambientes con vapores orgánicos y partículas de polvo en suspensión. Fabricada en elastómero termoplástico (TPR/TPE) hipoalergénico de alta flexibilidad que se amolda herméticamente al contorno facial del operario minimizando la fuga de aire no filtrado. Cuenta con válvula de exhalación frontal que expulsa rápidamente el calor y la humedad facilitando una respiración fresca y evitando el empañamiento de lentes de seguridad. Su arnés con bandas elásticas ajustables y hebilla de cierre en la nuca proporciona una sujeción firme sin puntos de presión excesivos. Disponible en versiones de 1 filtro central (compacto y económico para labores ligeras) y 2 filtros laterales con cartuchos de carbón activado (mayor flujo respiratorio, peso balanceado y amplio campo de visión libre hacia abajo).',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'seguridad-industrial' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 26,
    'tipoPieza', 'Respirador purificador de aire de media cara (Media Máscara)',
    'materialCuerpo', 'Elastómero termoplástico (TPR) suave hipoalergénico y adaptable',
    'sistemaFiltracion', 'Cartuchos químicos reemplazables con carbón activado y prefiltro para partículas',
    'valvulaExhalacion', 'Válvula de exhalación frontal de diafragma para reducción de calor y humedad',
    'arnes', 'Bandas elásticas dobles ajustables con horquilla de soporte en coronilla y broche de nuca',
    'aplicaciones', 'Pintura con pistola / spray, esmaltes, solventes, barnices, resinas, fumigación, lijado y carpintería',
    'variantLabel', 'Modelo / Presentación',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1 Filtro (Monofiltro)'),
      jsonb_build_object('value', '2 Filtros (Doble Filtro)')
    ),
    'tags', jsonb_build_array(
      'mascara respiratoria',
      'respirador media cara',
      'mascara para pintar',
      'mascara 1 filtro',
      'mascara 2 filtros',
      'doble filtro',
      'vapores organicos',
      'pintura',
      'solventes',
      'proteccion respiratoria',
      'epp',
      'seguridad industrial'
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
