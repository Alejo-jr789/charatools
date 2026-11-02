-- =============================================================================
-- Migración 072: Productos para Línea Brocas y Abrasivos (Discos de Corte y Sierra)
-- =============================================================================
-- Archivo: docs/migrations/072_add_discos_corte_y_sierra_brocas_y_abrasivos.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-02
--
-- Productos agregados:
--   1. Disco de Corte Diamantado para Vidrio, Loseta y Cerámica 4 1/2" Exxel
--   2. Disco de Corte Ultrafino Plano y Cóncavo 4 1/2" - 7" Exxel
--   3. Disco Sierra de Carburo para Madera 4 1/2" Diesel Tools
--   4. Disco de Corte para Tronzadora 12" - 14" - 16" INGCO
--   5. Disco de Corte Diamantado Segmentado 4 1/2" - 7" INGCO
-- =============================================================================

BEGIN;

-- Registrar marca 'Diesel Tools' si no existe
INSERT INTO public.brands (name, slug, is_active)
VALUES ('Diesel Tools', 'diesel-tools', true)
ON CONFLICT (slug) DO NOTHING;

-- 1. Disco de Corte Diamantado para Vidrio, Loseta y Cerámica 4 1/2" Exxel
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
  'Disco de Corte Diamantado para Vidrio, Loseta y Cerámica 4 1/2" Exxel',
  'disco-corte-vidrio-loseta-ceramica-4-1-2-exxel',
  'EXX-DISC-VID-412',
  'Disco de corte diamantado continuo ultrafino de 4 1/2" (115 mm) Exxel para corte suave, rápido y sin desportilladuras en vidrio, losetas, cerámicas, azulejos y botellas. Eje de 22.23 mm con anillo reductor a 20 mm / 16 mm.',
  'Disco diamantado ultrafino de borde continuo marca Exxel de 4 1/2 pulgadas (115 mm) con grano de diamante de alta densidad soldado por proceso electrodepositado. Diseñado especialmente para lograr cortes finos, limpios, precisos y sin astilladuras ni rebabas en materiales delicados como vidrio plano, botellas, losetas cerámicas, azulejos, porcelanato y mármol fino. Su diseño con sustrato de acero al manganeso de alta resistencia reduce la vibración durante la rotación y garantiza una disipación térmica óptima tanto en corte en seco como con agua. Compatible con cualquier esmeril angular de 4 1/2" con eje estándar de 22.23 mm (7/8") e incluye arandela reductora.',
  (SELECT id FROM public.brands WHERE slug = 'exxel' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 1,
    'diametro', '4 1/2 pulgadas (115 mm)',
    'eje', '22.23 mm (7/8") con arandela reductora a 20 mm / 16 mm',
    'tipoBorde', 'Borde continuo diamantado electrodepositado extrafino',
    'aplicaciones', 'Vidrio, loseta cerámica, porcelanato, azulejos, botellas y mármol fino',
    'corte', 'Apto para corte en seco y corte refrigerado con agua',
    'tags', jsonb_build_array(
      'disco corte vidrio',
      'disco para ceramica',
      'disco para loseta',
      'disco diamantado continuo',
      'disco exxel 4 1/2',
      'corte de vidrio',
      'esmeril 4 1/2',
      'exxel',
      'brocas y abrasivos'
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

-- 2. Disco de Corte Ultrafino Plano y Cóncavo 4 1/2" - 7" Exxel
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
  'Disco de Corte Ultrafino Plano y Cóncavo 4 1/2" - 7" Exxel',
  'disco-corte-ultrafino-plano-concavo-exxel',
  'EXX-DISC-CORTE-ULTRA',
  'Disco abrasivo ultrafino de óxido de aluminio blanco (WA60) reforzado con doble malla de fibra de vidrio para corte rápido y limpio de acero inoxidable e hierro sin quemaduras ni rebabas. Disponible en 4 1/2" y 7" en perfil plano y cóncavo.',
  'Disco de corte abrasivo ultrafino industrial marca Exxel formulado con granos de óxido de aluminio de alta pureza (White Aluminum Oxide WA60 TBF2) libres de hierro, azufre y cloro (Fe + S + Cl < 0.1%), ideal para evitar la contaminación y corrosión en acero inoxidable (Inox), tuberías de acero al carbono, chapas metálicas y perfiles estructurales. Su espesor extra delgado (1.2 mm en 4 1/2" y 1.6 mm en 7") minimiza la pérdida de material, genera menor fricción y calor, y requiere menor esfuerzo del motor del esmeril. Reforzado con doble malla de fibra de vidrio de alta tenacidad que garantiza máxima seguridad operativa a velocidades de hasta 13,300 RPM. Disponible en versión plana (Tipo 41) y centro hundido / cóncavo (Tipo 42).',
  (SELECT id FROM public.brands WHERE slug = 'exxel' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 2,
    'composicion', 'Óxido de aluminio blanco WA60 TBF2 libre de contaminantes férricos',
    'refuerzo', 'Doble malla de fibra de vidrio tejida de alta resistencia',
    'aplicaciones', 'Acero inoxidable (Inox), hierro dulce, perfiles metálicos, tubos y chapas',
    'velocidadMaxima', 'Hasta 13,300 RPM (80 m/s)',
    'variantLabel', 'Medida / Tipo',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '4 1/2" Plano Ultrafino (115 x 1.2 mm)'),
      jsonb_build_object('value', '4 1/2" Cóncavo Centro Hundido (115 x 1.2 mm)'),
      jsonb_build_object('value', '7" Plano Ultrafino (180 x 1.6 mm)'),
      jsonb_build_object('value', '7" Cóncavo Centro Hundido (180 x 1.6 mm)')
    ),
    'tags', jsonb_build_array(
      'disco corte ultrafino',
      'disco corte inox',
      'disco corte plano',
      'disco concavo',
      'disco exxel',
      'disco 4 1/2',
      'disco 7 pulgadas',
      'acero inoxidable',
      'corte de metal',
      'esmeril angular',
      'brocas y abrasivos'
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

-- 3. Disco Sierra de Carburo para Madera 4 1/2" Diesel Tools
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
  'Disco Sierra de Carburo para Madera 4 1/2" Diesel Tools',
  'disco-sierra-carburo-madera-4-1-2-diesel-tools',
  'DT-DISC-MAD-412',
  'Disco de sierra circular de 4 1/2 pulgadas (115 mm) con dientes de carburo de tungsteno (TCT) especialmente diseñado para corte rápido, suave y seguro de madera, MDF, aglomerado y plástico en esmeril angular.',
  'Disco de sierra para madera de 4 1/2 pulgadas (115 mm x 22.23 mm) marca Diesel Tools, especialmente desarrollado para su uso en esmeriles y amoladoras angulares de 4 1/2". Incorpora dientes con pastillas de carburo de tungsteno micrograno (TCT) con afilado alterno biselado (ATB) y ranuras de expansión térmica anti-bloqueo y anti-retroceso que disipan el calor y evitan que la madera se queme o la hoja se atasque. Proporciona cortes transversales y longitudinales rápidos y limpios en maderas duras, maderas blandas, contrachapados, paneles de MDF, melamina, aglomerados y perfiles plásticos/PVC. Velocidad máxima recomendada de 11,000 a 13,000 RPM.',
  (SELECT id FROM public.brands WHERE slug = 'diesel-tools' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 3,
    'diametro', '4 1/2 pulgadas (115 mm)',
    'eje', '7/8 pulgada (22.23 mm) para esmeril angular',
    'materialDientes', 'Pastillas de carburo de tungsteno TCT de alta dureza',
    'aplicaciones', 'Madera dura, madera blanda, MDF, aglomerado, triplay y tuberías plásticas',
    'caracteristicas', 'Ranuras anti-retroceso y de disipación térmica para cortes suaves sin quemaduras',
    'tags', jsonb_build_array(
      'disco sierra madera',
      'disco sierra 4 1/2',
      'disco madera esmeril',
      'carburo de tungsteno',
      'diesel tools',
      'corte de madera',
      'mdf',
      'carpinteria',
      'esmeril angular',
      'brocas y abrasivos'
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

-- 4. Disco de Corte para Tronzadora 12" - 14" - 16" INGCO
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
  'Disco de Corte para Tronzadora 12" - 14" - 16" INGCO',
  'disco-corte-tronzadora-ingco',
  'MCD355301-SERIES',
  'Disco abrasivo de corte para tronzadora de metales INGCO en medidas de 12", 14" y 16". Fabricado con óxido de aluminio de alto rendimiento y doble malla de fibra de vidrio reforzada para corte rápido de perfiles, tubos, vigas y varillas de acero. Eje estándar de 1" (25.4 mm).',
  'Disco de corte abrasivo industrial para tronzadoras pendulares de metales marca INGCO. Formulado con granos de óxido de aluminio de alta tenacidad unidos con resinas termoestables y doble refuerzo de tejido de fibra de vidrio de seguridad que previene roturas bajo cargas severas de trabajo. Diseñado para cortes rectos y precisos en perfiles estructurales de hierro, tubos de acero al carbono, cabillas, vigas en U/I, ángulos y tuberías de cerrajería y herrería pesada. Brinda un avance de corte veloz con baja generación de rebabas y óptima durabilidad. Eje central estándar de 1 pulgada (25.4 mm) con anillo de asiento de acero galvanizado. Disponible en diámetros de 12 pulgadas (305 mm), 14 pulgadas (355 mm) y 16 pulgadas (400 mm).',
  (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 4,
    'eje', '1 pulgada (25.4 mm) con anillo metálico reforzado',
    'materialAbrasivo', 'Óxido de aluminio con ligante de resina termoestable fenólica',
    'refuerzo', 'Doble malla de fibra de vidrio estructural de alta seguridad',
    'aplicaciones', 'Perfiles de hierro, tubos de acero, vigas estructurales, barras macizas y cabillas',
    'compatibilidad', 'Tronzadoras de banco y de obra de 12", 14" y 16"',
    'variantLabel', 'Diámetro',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '12" (305 x 3.0 x 25.4 mm)'),
      jsonb_build_object('value', '14" (355 x 3.0 x 25.4 mm)'),
      jsonb_build_object('value', '16" (400 x 3.2 x 25.4 mm)')
    ),
    'tags', jsonb_build_array(
      'disco corte tronzadora',
      'disco tronzadora 14',
      'disco tronzadora 12',
      'disco tronzadora 16',
      'disco ingco',
      'tronzadora de metales',
      'corte de perfiles',
      'herreria',
      'ingco',
      'brocas y abrasivos'
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

-- 5. Disco de Corte Diamantado Segmentado 4 1/2" - 7" INGCO
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
  'Disco de Corte Diamantado Segmentado 4 1/2" - 7" INGCO',
  'disco-corte-diamantado-segmentado-ingco',
  'DMD011152-SERIES',
  'Disco diamantado segmentado industrial INGCO de 4 1/2" y 7" para corte en seco y húmedo de concreto, bloques de construcción, ladrillos, baldosas y piedras naturales. Gran concentración de diamante para alta velocidad de corte y máxima vida útil.',
  'Disco de corte diamantado con borde segmentado serie Industrial marca INGCO, diseñado para máxima agresividad y velocidad de corte en materiales de construcción pesados: concreto armado, bloques de arcilla y cemento, ladrillos, adoquines, tejas, granito y piedras naturales. Sus ranuras de segmentación radial permiten un flujo constante de aire que enfría la matriz diamantada y desaloja el polvillo eficientemente durante el trabajo continuo, permitiendo el uso tanto en corte en seco como refrigerado por agua. Banda perimétrica con segmentos de diamante de alta densidad soldados por prensado en caliente sobre alma de acero templado resistente a deformaciones por choque térmico. Eje de 22.23 mm (7/8") con arandela reductora incluida. Disponible en 4 1/2 pulgadas (115 mm) para esmeril pequeño y 7 pulgadas (180 mm) para esmeril grande o cortadora.',
  (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 5,
    'eje', '22.23 mm (7/8") con arandela reductora',
    'tipoBorde', 'Segmentado con ranuras de ventilación térmica y desalojo de polvo',
    'aplicaciones', 'Concreto, mampostería, bloques de cemento y arcilla, ladrillos, tejas y piedras',
    'modoUso', 'Corte en seco y corte con agua (refrigerado)',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '4 1/2" (115 x 22.2 mm)'),
      jsonb_build_object('value', '7" (180 x 22.2 mm)')
    ),
    'tags', jsonb_build_array(
      'disco diamantado segmentado',
      'disco para concreto',
      'disco para bloques',
      'disco ingco 4 1/2',
      'disco ingco 7',
      'disco diamantado ingco',
      'corte de concreto',
      'construccion',
      'albanileria',
      'ingco',
      'brocas y abrasivos'
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
