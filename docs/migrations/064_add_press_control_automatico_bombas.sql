-- =============================================================================
-- Migración 064: Agregar Press Control Automático a Línea Bombas
-- =============================================================================
-- Archivo: docs/migrations/064_add_press_control_automatico_bombas.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-27
--
-- Producto agregado:
--   - Press Control Automático para Bomba de Agua 110V (1.1 kW / 10 bar)
-- =============================================================================

BEGIN;

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
  'Press Control Automático para Bomba de Agua 110V',
  'press-control-automatico',
  'BOMB-PRESS-CONTROL-110V',
  'Controlador electrónico automático de presión y flujo para bombas de agua de hasta 1.5 HP (1.1 kW). 110V-120V / 60Hz, presión máxima 10 bar (1 MPa) con protección contra marcha en seco.',
  'Regulador y presostato electrónico digital automático (Press Control) para automatización de electrobombas de agua periféricas, centrífugas o sumergibles en sistemas hidroneumáticos residenciales y comerciales. Reemplaza el tanque hidroneumático tradicional, manómetro, presostato mecánico y flotante. Arranca automáticamente la bomba al detectar apertura de cualquier grifo o punto de consumo y la detiene al cerrar el flujo. Incorpora sistema inteligente de protección que apaga el motor ante falta de agua evitando que trabaje en seco y se queme, con luces indicadoras LED (Power On, Pump On, Failure) y botón de reinicio manual (Restart). Roscas macho estándar de 1" NPT.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'bombas' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 6,
    'voltaje', '110V - 120V / 60 Hz',
    'potenciaMaxima', '1.1 kW (1.5 HP)',
    'corrienteMaxima', '10 A',
    'presionMaxima', '10 bar (1 MPa)',
    'conexion', '1" Rosca Macho NPT',
    'proteccion', 'Corte automático por marcha en seco / rearme manual',
    'indicadores', 'LEDs de Power On, Pump On, Failure',
    'tags', jsonb_build_array(
      'press control automático para bomba de agua 110v',
      'press control',
      'controlador de presion',
      'regulador automatico de bomba',
      'automatic pump control',
      '110v',
      '10 bar',
      'bombas',
      'hidroneumatico'
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
