-- =============================================================================
-- Migración 077: Productos para Línea Brocas y Abrasivos (Tarraja PVC, Cepillos de Copa y Fresas)
-- =============================================================================
-- Archivo: docs/migrations/077_add_tarraja_pvc_cepillos_copa_y_fresas_brocas_y_abrasivos.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-04
--
-- Productos agregados:
--   1. Juego de Tarraja Manual para Tuberías de PVC 1/2" - 3/4" - 1"
--   2. Cepillo de Alambre Tipo Copa Trenzado 3" - 4" - 5" Tolsen
--   3. Cepillo de Alambre Tipo Copa Ondulado 3" - 4" - 5" Tolsen
--   4. Juego de Piedras Montadas / Fresas Abrasivas para Taladro 5 Piezas
-- =============================================================================

BEGIN;

-- 1. Juego de Tarraja Manual para Tuberías de PVC 1/2" - 3/4" - 1"
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
  'Juego de Tarraja Manual para Tuberías de PVC 1/2" - 3/4" - 1"',
  'tarraja-manual-pvc-1-2-3-4-1',
  'BROC-TARR-MAN-PVC-12-1',
  'Juego de terraja o roscadora manual para tuberías de PVC y CPVC en medidas de 1/2", 3/4" y 1". Incluye maneral de alta palanca, 3 dados roscadores circulares y 2 guías plásticas de alineación y centrado para roscas limpias NPT.',
  'Kit completo de tarraja manual para roscado exterior de tuberías plásticas de PVC, CPVC y conductos conduit en diámetros estándar de fontanería de 1/2 pulgada, 3/4 de pulgada y 1 pulgada. Fabricado con cuerpo o maneral metálico forjado con doble brazo largo de torsión que proporciona una palanca uniforme y sin esfuerzo, minimizando la deformación o aplastamiento del tubo durante el corte. Incorpora 3 dados circulares de roscar en aleación de acero endurecido con dientes de corte biselados para labrar filetes estándar cónicos limpios, profundos y libres de rebabas que aseguran uniones totalmente estancas y herméticas al aplicar cinta teflón o sellador de roscas. Incluye 2 guías cilíndricas plásticas desmontables de color amarillo que estabilizan el tubo en posición perpendicular perfecta evitando trasroscados, y tornillos mariposa de bloqueo rápido para intercambiar los dados y guías en segundos sin herramientas adicionales.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 10,
    'medidasIncluidas', '1/2", 3/4" y 1"',
    'contenido', '1 Maneral porta-terrajas, 3 dados de corte (1/2", 3/4", 1") y 2 guías plásticas de alineación',
    'tipoRosca', 'Roscado exterior NPT estándar para tuberías plásticas',
    'materialesCompatibles', 'Tuberías de PVC hidráulico, sanitario, conduit y CPVC',
    'mecanismo', 'Manual de doble palanca con tornillos de fijación rápida',
    'tags', jsonb_build_array(
      'tarraja para pvc',
      'tarraja manual',
      'terraja para tubo',
      'roscadora pvc',
      'tarraja 1/2',
      'tarraja 3/4',
      'tarraja 1 pulgada',
      'plomeria',
      'fontaneria',
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

-- 2. Cepillo de Alambre Tipo Copa Trenzado 3" - 4" - 5" Tolsen
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
  'Cepillo de Alambre Tipo Copa Trenzado 3" - 4" - 5" Tolsen',
  'cepillo-alambre-copa-trenzado-tolsen',
  'TOL-CEPILLO-COPA-TRENZ-SERIES',
  'Cepillo tipo copa de alambre de acero al carbono trenzado de alta resistencia Tolsen para esmeril angular (Rosca M14). Diseñado para desbaste agresivo, limpieza profunda de cordones de soldadura, remoción pesada de óxido, pintura vieja y cascarilla en superficies metálicas. Disponible en 3", 4" y 5".',
  'Cepillo circular tipo copa con alambre de acero trenzado grueso (Knotted Wire Cup Brush) serie Industrial marca Tolsen, diseñado para trabajos pesados de decapado, remoción agresiva y limpieza mecánica sobre estructuras metálicas, perfiles de hierro, cordones de soldadura, planchas de calderería y piezas de fundición. Sus mechones de filamentos de alambre de acero templado al carbono retorcidos en espirales apretadas ofrecen una acción abrasiva de alto impacto que elimina rápidamente capas gruesas de óxido, cascarilla de laminación, restos de escoria, pintura epóxica, incrustaciones de corrosión y rebabas de corte sin desflecarse prematuramente. Cuenta con copa de contención en chapa de acero estampada recubierta con esmalte industrial anticorrosivo y tuerca central roscada M14 x 2.0 estándar con caras planas hexagonales para montaje y apriete seguro en cualquier amoladora o esmeril angular de 4 1/2", 7" o 9" (velocidad máxima de hasta 12,500 RPM según diámetro). Disponible en diámetros de 3 pulgadas (75 mm), 4 pulgadas (100 mm) y 5 pulgadas (125 mm).',
  (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 11,
    'marca', 'Tolsen',
    'tipoAlambre', 'Alambre de acero al carbono endurecido trenzado / nudado de alta resistencia',
    'tipoAcople', 'Rosca hembra M14 x 2.0 para esmeril angular',
    'aplicaciones', 'Desbaste pesado, limpieza de soldaduras, remoción de óxido severo, pintura y desbarbado de metal',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '3" (75 mm) - Rosca M14'),
      jsonb_build_object('value', '4" (100 mm) - Rosca M14'),
      jsonb_build_object('value', '5" (125 mm) - Rosca M14')
    ),
    'tags', jsonb_build_array(
      'cepillo de alambre',
      'cepillo copa trenzado',
      'cepillo tolsen',
      'alambre trenzado',
      'cepillo para esmeril',
      'limpieza de soldadura',
      'cepillo 3 pulgadas',
      'cepillo 4 pulgadas',
      'cepillo 5 pulgadas',
      'tolsen',
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

-- 3. Cepillo de Alambre Tipo Copa Ondulado 3" - 4" - 5" Tolsen
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
  'Cepillo de Alambre Tipo Copa Ondulado 3" - 4" - 5" Tolsen',
  'cepillo-alambre-copa-ondulado-tolsen',
  'TOL-CEPILLO-COPA-OND-SERIES',
  'Cepillo tipo copa de alambre de acero latonado ondulado flexible Tolsen para esmeril angular (Rosca M14). Proporciona una limpieza uniforme de intensidad media para remoción de óxido ligero, barniz, pintura, sarro y abrillantado de metales sin rayar profundamente la pieza base. Disponible en 3", 4" y 5".',
  'Cepillo circular tipo copa con alambre de acero ondulado o rizado (Crimped Wire Cup Brush) marca Tolsen, diseñado para operaciones de limpieza superficial, pulido intermedio, desoxidación ligera y preparación de superficies antes de pintar en piezas de metal ferroso y no ferroso, madera o piedra. Sus cerdas de alambre de acero de alta elasticidad con recubrimiento latonado ofrecen una flexibilidad controlada que permite adaptarse perfectamente a contornos irregulares, ranuras, esquinas y superficies curvas sin surcar ni desgastar agresivamente el material base. Ideal para eliminar herrumbre superficial, pintura descascarada, depósitos de carbón, rebabas finas de corte y suciedad acumulada. Equipado con copa metálica de soporte balanceada dinámicamente para reducir la vibración durante el uso continuo y tuerca central integrada con rosca M14 x 2.0 compatible con mandriles de amoladoras o esmeriles angulares de 4 1/2", 7" y 9" (hasta 12,500 RPM). Disponible en tamaños de 3 pulgadas (75 mm), 4 pulgadas (100 mm) y 5 pulgadas (125 mm).',
  (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 12,
    'marca', 'Tolsen',
    'tipoAlambre', 'Alambre de acero latonado ondulado / rizado flexible de alta tenacidad',
    'tipoAcople', 'Rosca hembra M14 x 2.0 para esmeril angular',
    'aplicaciones', 'Limpieza intermedia, eliminación de óxido superficial, decapado suave, pulido y preparación de piezas para pintura',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '3" (75 mm) - Rosca M14'),
      jsonb_build_object('value', '4" (100 mm) - Rosca M14'),
      jsonb_build_object('value', '5" (125 mm) - Rosca M14')
    ),
    'tags', jsonb_build_array(
      'cepillo de alambre',
      'cepillo copa ondulado',
      'cepillo tolsen',
      'alambre ondulado',
      'alambre latonado',
      'cepillo para esmeril',
      'cepillo 3 pulgadas',
      'cepillo 4 pulgadas',
      'cepillo 5 pulgadas',
      'tolsen',
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

-- 4. Juego de Piedras Montadas / Fresas Abrasivas para Taladro 5 Piezas
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
  'Juego de Piedras Montadas / Fresas Abrasivas para Taladro 5 Piezas',
  'juego-piedras-montadas-fresas-abrasivas-5-piezas',
  'BROC-PIEDRAS-MONT-5PZ',
  'Juego de 5 puntas o piedras abrasivas montadas con vástago de 1/4" (6.35 mm) para taladro y mototool. Incluye 5 formas geométricas variadas (cilíndrica, esférica, cónica, ojival y árbol) de grano de óxido de aluminio para desbaste, pulido, grabado, rectificado de soldaduras y afilado en metales.',
  'Juego de 5 piedras o puntas abrasivas montadas (Mounted Grinding Stones Set) fabricadas con aglomerado de granos de óxido de aluminio de alta pureza y dureza sobre vástagos de acero al carbono de 1/4 pulgada (6.35 mm), compatibles con mandriles de taladros eléctricos, taladros inalámbricos, mototool, rectificadores de matrices y amoladoras rectas. El conjunto incluye 5 formas geométricas diseñadas para abordar cualquier perfil de trabajo: 1 punta cilíndrica recta para desbaste de cantos planos y biselado; 1 punta esférica (bola) para cavidades cóncavas y redondeo de esquinas internas; 1 punta cónica puntiaguda para ranuras estrechas y detalle fino; 1 punta cónica redondeada (tipo árbol) para transiciones y perfiles curvos; y 1 punta cilíndrica abombada (tipo bala u ojiva) para limpieza interna de orificios y tubos. Indispensables en talleres de herrería, mecánica automotriz, cerrajería y matricería para el repasado y eliminación de rebabas en cortes metálicos, suavizado de cordones de soldadura en esquinas de difícil acceso, afilado de cuchillas y desbaste fino en hierro, acero, bronce, aluminio y piezas de fundición.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'set',
    'stockStatus', 'available',
    'priority', 13,
    'cantidadPiezas', '5 Piezas',
    'vastago', 'Cilíndrico de 1/4 pulgada (6.35 mm) compatible con mandriles estándar',
    'formasIncluidas', 'Cilíndrica, esférica (bola), cónica puntiaguda, cónica redondeada (árbol) y ojival (bala)',
    'materialAbrasivo', 'Grano de óxido de aluminio aglomerado con resinas cerámicas',
    'aplicaciones', 'Desbaste de soldadura, eliminación de rebabas, pulido de moldes, rectificado y afilado de herramientas',
    'tags', jsonb_build_array(
      'piedras montadas',
      'fresas abrasivas',
      'puntas montadas',
      'juego de fresas',
      'piedras para taladro',
      'desbaste de metal',
      'vastago 1/4',
      'oxido de aluminio',
      'rectificado',
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
