-- =============================================================================
-- Migración 054: Guante de Carnaza Azul para Soldador 16" (Hoffman Arc)
-- =============================================================================
-- Archivo: docs/migrations/054_add_guante_carnaza_azul_soldador_16.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-22
-- =============================================================================

BEGIN;

-- 1. Asegurar la marca 'Hoffman Arc'
INSERT INTO public.brands (name, slug, is_active)
VALUES ('Hoffman Arc', 'hoffman-arc', true)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  is_active = true;

-- 2. Insertar / Actualizar el producto en Seguridad Industrial
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
  'Guante de Carnaza Azul para Soldador 16"',
  'guante-carnaza-azul-soldador-16',
  'SEG-GUANTE-SOLDADOR-AZUL-16',
  'Guante profesional de carnaza azul cobalto caña larga 16 pulgadas con certificación CE EN388 (4134), forro térmico y costuras reforzadas con vivos protectores antiescoria.',
  'Guante de alta protección para soldador profesional confeccionado en carnaza de cuero vacuno de primera selección tratada al cromo en color azul cobalto. Diseñado con caña extendida de 16 pulgadas (40 cm) para resguardar muñeca, antebrazo y articulaciones de chispas, salpicaduras de metal fundido y calor radiante generado por arco eléctrico. Cuenta con certificación CE y norma EN388 (clasificación mecánica 4134 de alta resistencia a abrasión y perforación). Costuras con hilo ignífugo reforzado y ribetes (vivos) protectores blancos para prevenir la rotura de costuras por escoria. Interior acolchado con forro suave de algodón que aísla las altas temperaturas y absorbe el sudor.',
  (SELECT id FROM public.brands WHERE slug = 'hoffman-arc' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'seguridad-industrial' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'par',
    'stockStatus', 'available',
    'largo', '16 pulgadas (40 cm)',
    'material', 'Carnaza de cuero vacuno seleccionada color azul cobalto',
    'normas', 'CE / EN388 (4134)',
    'costuras', 'Hilo ignífugo reforzado con ribetes protectores (welted seams)',
    'forroInterno', 'Algodón suave térmico y absorbente',
    'aplicaciones', 'Soldadura SMAW (Electrodo), MIG/MAG, TIG, oxicorte, corte plasma y herrería pesada',
    'tags', jsonb_build_array('guante de carnaza azul para soldador 16"', 'guante carnaza azul', 'guante soldador azul', 'hoffman arc', 'en388', 'ce', '16 pulgadas', 'caña larga', 'soldadura', 'epp', 'seguridad industrial')
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
