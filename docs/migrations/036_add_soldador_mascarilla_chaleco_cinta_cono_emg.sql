-- =============================================================================
-- Migración 036: Soldador, Mascarilla KN95, Chaleco, Cinta y Cono Vial EMG (Seguridad Industrial)
-- =============================================================================
-- Archivo: docs/migrations/036_add_soldador_mascarilla_chaleco_cinta_cono_emg.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-08
-- =============================================================================

BEGIN;

-- 1. Asegurar la existencia de las subcategorías en caso de correr en limpio
INSERT INTO public.categories (name, slug, parent_id)
VALUES
  ('Protección Respiratoria', 'proteccion-respiratoria', (SELECT id FROM public.categories WHERE slug = 'seguridad-industrial' LIMIT 1)),
  ('Señalización y Vialidad', 'senalizacion-vial', (SELECT id FROM public.categories WHERE slug = 'seguridad-industrial' LIMIT 1))
ON CONFLICT (slug) DO NOTHING;

-- 2. Insertar los 5 nuevos productos
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
  -- 1. Guantes de Carnaza Largo para Soldador 16"
  (
    'Guantes de Carnaza Largo para Soldador 16"',
    'guantes-carnaza-largo-soldador-16',
    'SEG-GUANTES-SOLDADOR-16',
    'Guantes de carnaza gris de caña larga 16 pulgadas para soldador con refuerzo térmico y mecánico.',
    'Guantes profesionales para soldadura y alta temperatura tipo manga larga (16 pulgadas) marca EMG. Confeccionados en carnaza de cuero vacuno de primera selección, suave y flexible pero de gran espesor para proteger contra chispas, salpicaduras de metal fundido, calor por contacto y radiación del arco eléctrico. Costuras reforzadas e interior forrado para mayor aislamiento térmico y absorción del sudor.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'carnaza', 'soldador', 'soldadura', '16 pulgadas', 'manga larga', 'cuero vacuno', 'emg', 'epp', 'seguridad industrial'),
      'priority', 9
    )
  ),

  -- 2. Mascarilla de Protección Respiratoria KN95
  (
    'Mascarilla de Protección Respiratoria KN95',
    'mascarilla-proteccion-respiratoria-kn95',
    'SEG-MASCARILLA-KN95',
    'Mascarilla autofiltrante KN95 de 5 capas de protección con clip nasal ajustable y bandas elásticas.',
    'Mascarilla de protección respiratoria desechable estándar KN95 marca EMG con eficiencia de filtración bacteriana y de partículas superior al 95% (PM2.5). Estructura ergonómica 3D plegable de 5 capas que facilita la respiración y el habla, clip nasal interno moldeable para sellado hermético y elásticos termosellados de alta resistencia. Apta para entornos industriales, polvos no tóxicos, aerosoles y prevención biológica.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'proteccion-respiratoria' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'proteccion-respiratoria',
      'subitem', 'proteccion-respiratoria',
      'variantLabel', 'Color',
      'variants', jsonb_build_array(
        jsonb_build_object('value', 'Blanco'),
        jsonb_build_object('value', 'Negro')
      ),
      'tags', jsonb_build_array('mascarilla', 'kn95', 'proteccion respiratoria', 'tapabocas', 'respirador', 'filtro pm2.5', 'emg', 'epp', 'seguridad industrial'),
      'priority', 1
    )
  ),

  -- 3. Chaleco Vial con Cinta Reflectiva
  (
    'Chaleco Vial con Cinta Reflectiva',
    'chaleco-vial-cinta-reflectiva',
    'SEG-CHALECO-VIAL-REF',
    'Chaleco de alta visibilidad para seguridad vial y obras con doble banda reflectiva horizontal.',
    'Chaleco de seguridad vial y brigadista de alta visibilidad marca EMG. Fabricado en tejido de poliéster ligero, resistente y transpirable, con cierre frontal de velcro para colocación rápida. Incorpora dos bandas reflectivas de alta intensidad de 2 pulgadas (360° de visibilidad nocturna) para advertencia en carreteras, zonas de construcción, estacionamientos y faenas industriales.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'senalizacion-vial' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'senalizacion-vial',
      'subitem', 'chalecos',
      'variantLabel', 'Color',
      'variants', jsonb_build_array(
        jsonb_build_object('value', 'Naranja'),
        jsonb_build_object('value', 'Verde Neón')
      ),
      'tags', jsonb_build_array('chaleco', 'chaleco vial', 'cinta reflectiva', 'alta visibilidad', 'seguridad vial', 'construccion', 'emg', 'epp', 'seguridad industrial'),
      'priority', 1
    )
  ),

  -- 4. Cinta de Seguridad Peligro No Pase
  (
    'Cinta de Seguridad Peligro No Pase',
    'cinta-seguridad-peligro-no-pase',
    'SEG-CINTA-PELIGRO-NO-PASE',
    'Cinta plástica de señalización y delimitación amarilla con leyenda PELIGRO NO PASE de alta visibilidad.',
    'Cinta de advertencia y delimitación perimetral no adhesiva fabricada en polietileno de alta resistencia color amarillo brillante con tipografía negra PELIGRO NO PASE. Esencial para demarcar zonas de excavación, obras civiles, áreas de riesgo eléctrico, derrumbes, reparaciones o control de acceso en faenas comerciales e industriales.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'senalizacion-vial' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'rollo',
      'subcategory', 'senalizacion-vial',
      'subitem', 'cintas-seguridad',
      'tags', jsonb_build_array('cinta de seguridad', 'peligro no pase', 'cinta de peligro', 'delimitacion', 'senalizacion', 'rollo', 'emg', 'epp', 'seguridad industrial'),
      'priority', 2
    )
  ),

  -- 5. Cono Vial Flexible con Base Pesada y Cinta Reflectiva
  (
    'Cono Vial Flexible con Base Pesada y Cinta Reflectiva',
    'cono-vial-flexible-base-pesada',
    'SEG-CONO-VIAL-FLEXIBLE',
    'Cono de tránsito flexible en PVC de alta durabilidad con bandas reflectivas y base negra de alta estabilidad.',
    'Cono vial de señalización de tráfico fabricado en PVC flexible termoestable de alta resistencia al impacto y rayos UV marca EMG. Su composición deformable le permite recuperar su forma tras ser arrollado sin romperse. Cuenta con doble collarín de cinta reflectiva de grado ingeniería para máxima visibilidad nocturna y base cuadrada pesada antideslizante que previene su caída por el viento o turbulencias de vehículos.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'senalizacion-vial' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'senalizacion-vial',
      'subitem', 'conos-viales',
      'tags', jsonb_build_array('cono vial', 'cono de transito', 'flexible', 'base pesada', 'cintas reflectivas', 'seguridad vial', 'senalizacion', 'emg', 'epp', 'seguridad industrial'),
      'priority', 3
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
