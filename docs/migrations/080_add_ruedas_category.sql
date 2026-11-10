-- =============================================================================
-- Migración 080: Línea Principal Ruedas y Primer Producto
-- =============================================================================
-- Archivo: docs/migrations/080_add_ruedas_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-10
--
-- Contenido:
--   1. Categoría Principal 'Ruedas' (depth: 0, parent_id: NULL)
--   2. Producto: Rueda Neumática para Zorra de Carga 10" (RIN metálico / rolinera)
-- =============================================================================

BEGIN;

-- 1. Crear o actualizar categoría principal 'Ruedas'
INSERT INTO public.categories (name, slug, description, depth, parent_id, is_active)
VALUES
  (
    'Ruedas',
    'ruedas',
    'Ruedas neumáticas, macizas, garruchas giratorias y fijas para zorras, carretillas y carros de carga industrial y comercial',
    0,
    NULL,
    true
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  depth = 0,
  parent_id = NULL,
  is_active = true;

-- 2. Rueda Neumática para Zorra de Carga 10"
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
  'Rueda Neumática para Zorra de Carga 10"',
  'rueda-neumatica-zorra-10-pulgadas',
  'RUED-NEUM-ZORRA-10',
  'Rueda neumática de 10" (4.10/3.50-4) para zorras y carros de carga con rin metálico desmontable de 2 piezas y rodamientos de bolas. Capacidad de carga de 136 kg (300 lb) con excelente absorción de impactos.',
  'Rueda neumática de alta resistencia de 10 pulgadas (medida estándar 4.10 / 3.50-4) especialmente diseñada para zorras de carga de mano (diablos), carretillas de almacén, plataformas rodantes y carros de transporte industrial. Equipada con un neumático de caucho reforzado de 2 a 4 lonas con grabado de tacos antideslizantes que proporciona una tracción suave y una amortiguación superior contra baches y desniveles en asfalto, concreto, baldosas o tierra. Incorpora un rin de acero estampado galvanizado/plateado desmontable en dos mitades unidas por tornillería de alta resistencia, lo que permite sustituir con facilidad la tripa (cámara de aire) o la cubierta sin requerir prensa mecánica. Su centro de eje cuenta con rodamientos dobles de bolas (rolineras) que aseguran un giro libre, fluido y sin fricción excesiva incluso bajo cargas pesadas continuas de hasta 136 kg (300 libras). Válvula de inflado tipo auto (Schrader) reforzada de fácil acceso.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'ruedas' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 1,
    'marca', 'Genérico',
    'diametroExterior', '10 pulgadas (~260 mm)',
    'medidaCaucho', '4.10 / 3.50 - 4',
    'tipoRueda', 'Neumática con cámara de aire (tripa con válvula Schrader / auto)',
    'materialRin', 'Chapa de acero estampado galvanizado de 2 piezas atornilladas',
    'sistemaEje', 'Rodamientos de bolas dobles (rolineras de precisión)',
    'capacidadCarga', 'Hasta 136 kg (300 lb) por rueda',
    'aplicaciones', 'Zorras de carga de mano (diablos), carros de almacén, carretillas y plataformas móviles',
    'tags', jsonb_build_array(
      'rueda',
      'rueda neumática',
      'rueda zorra',
      'rueda 10 pulgadas',
      'zorra de carga',
      'diablo de carga',
      'rin metalico',
      'carretilla',
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
