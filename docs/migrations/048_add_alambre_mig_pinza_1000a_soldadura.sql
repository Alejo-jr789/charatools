-- =============================================================================
-- Migración 048: Productos de Línea Soldadura Lote 2 (Alambre MIG Flux-Core y Pinza 1000A)
-- =============================================================================
-- Archivo: docs/migrations/048_add_alambre_mig_pinza_1000a_soldadura.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-20
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
  -- 1. Alambre MIG Flux-Core 0.9mm 1kg
  (
    'Alambre MIG Flux-Core 0.9mm 1kg',
    'alambre-mig-flux-core-09mm-1kg',
    'SOL-ALAMBRE-FLUX-09MM-1KG',
    'Carrete de alambre tubular auto-protegido Flux-Core de 0.9mm (1 kg) para soldadura MIG/MAG sin necesidad de gas protector externo.',
    'Alambre tubular auto-protegido (Flux-Cored Wire) de 0.9 mm (0.035") en presentación de bobina compacta de 1 kg. Especialmente formulado para equipos de soldadura MIG sin requerir botellas ni suministro de gas exterior (gasless), ideal para trabajos al aire libre, herrería en obra, cerrajería y chapistería. Ofrece excelente estabilidad de arco, baja salpicadura, óptima fluidez de baño y una escoria ligera de muy fácil desprendimiento, garantizando cordones de soldadura resistentes y de excelente aspecto visual en aceros al carbono.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'diametro', '0.9 mm',
      'pesoKg', 1,
      'tipo', 'Flux-Core (Gasless)',
      'unidad', 'rollo',
      'stockStatus', 'available',
      'tags', jsonb_build_array('alambre mig flux-core 0.9mm 1kg', 'alambre mig', 'flux-core', 'alambre tubular', 'sin gas', '0.9mm', '1kg', 'soldadura mig', 'soldadura'),
      'priority', 6
    )
  ),

  -- 2. Pinza Porta Electrodo 1000 Amp
  (
    'Pinza Porta Electrodo 1000 Amp',
    'pinza-porta-electrodo-1000-amp',
    'SOL-PINZA-ELECTRODO-1000A',
    'Pinza porta electrodo industrial de 1000 Amperios para uso extrapesado continuo con mandíbulas de cobre macizo y empuñadura aislante de alta resistencia térmica.',
    'Pinza porta electrodo de máxima capacidad industrial de 1000 Amperios diseñada para trabajos severos de alto amperaje, electrodos de grueso calibre y corte/resanado por arco aire (gouging). Fabricada con cuerpo y mordazas forjadas en aleación de cobre puro para una conductividad eléctrica superior sin sobrecalentamientos, resorte de compresión templado de alta resistencia y mango ergonómico acanalado con aislamiento dieléctrico y térmico de alto impacto, garantizando máxima seguridad y rendimiento bajo las condiciones más exigentes de maestranzas, astilleros y plantas industriales.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'amperaje', '1000A',
      'amperajeMax', 1000,
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('pinza porta electrodo 1000 amp', 'porta electrodo 1000a', '1000 amp', '1000a', 'uso extrapesado', 'industrial', 'soldadura', 'electrodo', 'accesorios soldadura'),
      'priority', 7
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
