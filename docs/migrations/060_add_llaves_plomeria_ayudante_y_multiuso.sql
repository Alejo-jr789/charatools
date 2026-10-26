-- =============================================================================
-- Migración 060: Herramientas Especializadas para Plomería
-- =============================================================================
-- Archivo: docs/migrations/060_add_llaves_plomeria_ayudante_y_multiuso.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-26
--
-- Productos agregados:
--   1. Llave Ayudante de Plomero 11"
--   2. Llave para Plomero Multiuso 10" 8 en 1
-- =============================================================================

BEGIN;

-- 1. Llave Ayudante de Plomero 11"
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
  'Llave Ayudante de Plomero 11"',
  'llave-ayudante-de-plomero-11-pulgadas',
  'PLOM-LLAV-AYUDANTE-11',
  'Llave para tuercas de lavabo (basin wrench) de 11 pulgadas en acero forjado con mordaza autoajustable pivotante de 180° y manija deslizante en T.',
  'Herramienta profesional especializada de plomería tipo llave de lavabo (Basin Wrench) de 11 pulgadas (280 mm). Diseñada específicamente para alcanzar y aflojar o apretar tuercas de grifería, mezcladoras, llaves de paso y canillas ubicadas detrás de lavamanos, bateas y fregadores en espacios ciegos y de muy difícil acceso. Cuenta con cabezal pivotante forjado con resorte que gira hasta 180° y mordaza dentada autoajustable que muerde con firmeza tuercas hexagonales o cuadradas en cualquier sentido de giro. Barra de acero cromado con mango transversal en T deslizable para aplicar alto torque con mínimo esfuerzo.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'longitud', '11 pulgadas (280 mm)',
    'material', 'Acero al carbono forjado cromado anticorrosivo',
    'cabezal', 'Mordaza dentada pivotante de 180° con resorte autoajustable',
    'mango', 'Barra deslizante en T de alto apalancamiento',
    'capacidadApertura', 'Tuercas y conexiones desde 3/8" hasta 1-1/4" (10 mm a 32 mm)',
    'aplicacion', 'Instalación y desmonte de grifos, mezcladoras, canillas y tuercas en lavamanos y fregaderos',
    'tags', jsonb_build_array('llave ayudante de plomero 11"', 'llave ayudante de plomero', 'basin wrench', 'llave de lavabo', 'llave para grifo', '11 pulgadas', 'plomería', 'herramientas de plomería')
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

-- 2. Llave para Plomero Multiuso 10" 8 en 1
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
  'Llave para Plomero Multiuso 10" 8 en 1',
  'llave-plomero-multiuso-10-8-en-1',
  'PLOM-LLAV-MULTI-8EN1',
  'Llave multifuncional para instalación de griferías, fregaderos, inodoros y calentadores 8 en 1 con ranura para tuberías y nivel de burbuja incorporado.',
  'Llave multifuncional para plomería 8 en 1 de 10 pulgadas (25 cm) fabricada en plástico de ingeniería ABS reforzado ultraliviano y aleación de aluminio de alta resistencia. Diseñada con un cuerpo ranurado abierto que permite deslizar la herramienta directamente sobre tuberías de agua y mangueras flexibles instaladas sin desmontarlas. Incluye múltiples insertos y bocas intercambiables para tuercas de grifo, válvulas angulares de paso, tuercas de colador de desagüe, tuercas de canilla y líneas de suministro de 1/2", 3/4" y 1". Incorpora nivel de burbuja integrado para alineación horizontal precisa de griferías e instalaciones.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'tamano', '10 pulgadas (250 mm)',
    'funciones', '8 en 1 (tuercas de grifo, válvulas angulares, tuercas de canilla, desagües y nivelador)',
    'material', 'Cuerpo de ABS reforzado de alta tenacidad con cabezales de aleación de aluminio',
    'caracteristicasEspeciales', 'Cuerpo ranurado abierto para cables/tuberías y nivel de burbuja integrado',
    'compatibilidad', 'Tuercas hexagonales y estriadas de 2, 3, 4 y 6 pestañas de 1/2", 3/4" y 1"',
    'aplicacion', 'Fregadores, lavamanos, inodoros, calentadores de agua y tuberías de plomería',
    'tags', jsonb_build_array('llave plomero multiuso 10" 8 en 1', 'llave multiuso plomero', 'llave 8 en 1', 'instalador de grifo', 'llave para fregadero', 'plomería', 'herramientas de plomero', 'grifería')
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
