-- =============================================================================
-- Migración 059: Cinta Doble Faz para Pintura y Accesorios
-- =============================================================================
-- Archivo: docs/migrations/059_add_cinta_doble_faz_pintura_y_accesorios.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-26
--
-- Producto agregado:
--   - Cinta Doble Faz Transparente - Blanco - Negro
-- =============================================================================

BEGIN;

-- Insertar / Actualizar Cinta Doble Faz Transparente - Blanco - Negro
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
  'Cinta Doble Faz Transparente - Blanco - Negro',
  'cinta-doble-faz-transparente-blanco-negro',
  'PINT-CINTA-DOBLEFAZ',
  'Cinta adhesiva de doble contacto extra fuerte de alta fijación. Disponible en gel acrílico transparente (nano tape) y espuma acolchada en color blanco y negro.',
  'Cinta de doble cara de adherencia industrial para montaje, fijación y unión de objetos sin necesidad de taladrar ni usar clavos. Diseñada para alto agarre en múltiples superficies lisas como metal, vidrio, madera, cerámica, azulejos y plásticos rígidos. Disponible en tres variantes: Transparente (gel acrílico elástico invisible tipo nano tape de alta resistencia), Blanca (espuma de polietileno con adhesivo acrílico para montaje en interiores y drywall) y Negra (espuma automotriz / intemperie resistente a vibraciones y humedad).',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'rollo',
    'stockStatus', 'available',
    'variantesDisponibles', jsonb_build_array('Transparente (Gel Acrílico / Nano Tape)', 'Blanco (Espuma para Montaje)', 'Negro (Espuma Automotriz / Alta Resistencia)'),
    'material', 'Acrílico / Espuma de polietileno con adhesivo de doble contacto',
    'propiedades', 'Fijación instantánea sin perforaciones, resistente a la humedad y vibración',
    'aplicaciones', 'Montaje de espejos, molduras, cuadros, accesorios de baño, canaletas, emblemas y decoración',
    'tags', jsonb_build_array('cinta doble faz transparente - blanco - negro', 'cinta doble faz', 'cinta doble cara', 'nano tape', 'cinta de montaje', 'transparente', 'blanco', 'negro', 'adhesivo fuerte', 'pintura y accesorios')
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
