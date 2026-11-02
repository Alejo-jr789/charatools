-- =============================================================================
-- Migración 073: Productos para Líneas Brocas y Abrasivos y Soldadura
-- =============================================================================
-- Archivo: docs/migrations/073_add_multiproposito_soldadora_turbo_escalonada_tarraja.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-02
--
-- Productos agregados:
--   1. Disco de Corte Diamantado Multipropósito 4 1/2" Wolfgang (Brocas y Abrasivos)
--   2. Máquina de Soldar Inverter 160 Amp - 180 Amp INGCO (Soldadura)
--   3. Disco Copa Turbo Segmentado Diamantado 4 1/2" Tolsen (Brocas y Abrasivos)
--   4. Mecha Escalonada HSS Titanio 1/4" (4-12mm - 4-20mm) (Brocas y Abrasivos)
--   5. Tarraja Dual Mecánica para PVC 1/2" - 3/4" (Acople a Taladro) (Brocas y Abrasivos)
-- =============================================================================

BEGIN;

-- Registrar marca 'Wolfgang' si no existe
INSERT INTO public.brands (name, slug, is_active)
VALUES ('Wolfgang', 'wolfgang', true)
ON CONFLICT (slug) DO NOTHING;

-- 1. Disco de Corte Diamantado Multipropósito 4 1/2" Wolfgang
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
  'Disco de Corte Diamantado Multipropósito 4 1/2" Wolfgang',
  'disco-corte-4-1-2-multiproposito-wolfgang',
  'WLF-DISC-MULTI-412',
  'Disco de corte diamantado multipropósito de 4 1/2" (115 mm x 1.2 mm x 22.23 mm) con tecnología vacuum brazed para corte en seco y húmedo de metales, acero inoxidable, cabillas, madera, PVC, plásticos, cerámica y losetas.',
  'Disco de corte diamantado multipropósito de 4 1/2 pulgadas (115 mm x 1.2 mm) marca Wolfgang con tecnología de diamante soldado al vacío (Vacuum Brazed). Diseñado como una solución universal todo-en-uno que sustituye múltiples discos especializados en obras y talleres, permitiendo cortar con rapidez y alta seguridad perfiles metálicos, tubos de hierro, cabillas de construcción, láminas de acero inoxidable, metales no ferrosos (aluminio, cobre), madera con o sin clavos, tuberías de PVC, plásticos duros, placas de yeso/drywall, fibra de vidrio y losetas cerámicas. Su alma de acero sólido indeformable elimina el riesgo de rotura o estallido característico de los discos abrasivos convencionales, manteniendo un diámetro constante durante toda su vida útil. Apto para uso en esmeril angular a velocidades de hasta 13,200 RPM con eje estándar de 22.23 mm (7/8") y arandela reductora.',
  (SELECT id FROM public.brands WHERE slug = 'wolfgang' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 6,
    'diametro', '4 1/2 pulgadas (115 mm x 1.2 mm)',
    'eje', '22.23 mm (7/8") con arandela reductora',
    'tecnologia', 'Diamante electrofundido al vacío (Vacuum Brazed Technology)',
    'materiales', 'Metal, acero inoxidable, cabillas, madera con clavos, PVC, plástico, yeso y loseta',
    'velocidadMaxima', '13,200 RPM (80 m/s)',
    'tags', jsonb_build_array(
      'disco de corte multiproposito',
      'disco wolfgang 4 1/2',
      'disco vacuum brazed',
      'disco universal esmeril',
      'corte de metal y madera',
      'acero inoxidable',
      'pvc',
      'wolfgang',
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

-- 2. Máquina de Soldar Inverter 160 Amp - 180 Amp INGCO
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
  'Máquina de Soldar Inverter 160 Amp - 180 Amp INGCO',
  'maquina-soldar-inverter-160amp-180amp-ingco',
  'ING-MMA-INV-160-180',
  'Máquina para soldar inverter compacta INGCO con tecnología IGBT, display digital y sistema MMA. Incluye careta para soldar, cable con pinza porta electrodo, cable con pinza a tierra y cepillo con piqueta para escoria.',
  'Máquina de soldar portátil con tecnología inversora IGBT avanzada marca INGCO, diseñada para trabajos profesionales de herrería, cerrajería, mantenimiento industrial y reparaciones generales. Ofrece un arco eléctrico suave, estable y uniforme con encendido rápido (Hot Start), anti-adherencia de electrodo (Anti-Stick) y compensador dinámico de arco (Arc Force), permitiendo fundir electrodos rutilicos y básicos (E6013, E7018, etc.) con penetración profunda y mínima salpicadura. Equipada con pantalla digital para ajuste preciso de amperaje, protección térmica contra sobrecalentamiento y sobretensión con luz indicadora LED, y sistema de ventilación forzada de alto flujo. El kit incluye: máquina de soldar inverter, cable portaelectrodo con pinza de alta conductividad, cable de masa con pinza a tierra, máscara protectora para soldar de mano con visor oscuro y martillo-piqueta con cepillo de alambre para desescoriado. Disponible en capacidades de 160 Amperios y 180 Amperios.',
  (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 15,
    'tecnologia', 'Inverter IGBT de alta frecuencia y eficiencia energética',
    'pantalla', 'Display digital LED indicador de corriente en tiempo real',
    'funciones', 'Hot Start (arranque fácil), Arc Force (arco estable) y Anti-Stick (anti-pegado)',
    'incluye', 'Careta de soldar, cable con pinza portaelectrodo, cable con pinza a tierra y martillo-cepillo',
    'variantLabel', 'Potencia / Amperaje',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '160 Amp'),
      jsonb_build_object('value', '180 Amp')
    ),
    'tags', jsonb_build_array(
      'maquina de soldar',
      'maquina inverter ingco',
      'soldadora 160 amp',
      'soldadora 180 amp',
      'ingco',
      'soldadura mma',
      'tecnologia igbt',
      'inverter',
      'soldadura',
      'herreria'
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

-- 3. Disco Copa Turbo Segmentado Diamantado 4 1/2" Tolsen
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
  'Disco Copa Turbo Segmentado Diamantado 4 1/2" Tolsen',
  'disco-copa-turbo-segmentado-4-1-2-tolsen',
  'TOL-76681',
  'Muela copa diamantada turbo segmentada de 4 1/2" (115 mm x 22.2 mm) Tolsen para desbaste pesado, nivelación y pulido de concreto, mampostería, granito, mármol y remoción de epoxi o pintura en pisos.',
  'Copa de desbaste diamantada tipo turbo segmentada de 4 1/2 pulgadas (115 mm x 22.2 mm) marca Tolsen (modelo 76681), fabricada bajo norma de seguridad europea EN 13236. Diseñada para desbaste agresivo, rectificado, perfilado y nivelación de superficies de concreto rugoso, losas de cemento, bloques de mampostería, granito, mármol y piedras duras, así como para la remoción eficiente de adhesivos secos, mortero, recubrimientos epóxicos y pinturas viejas en pisos. Su disposición de segmentos diamantados en espiral turbo con orificios de ventilación en el plato de acero reduce la carga térmica, optimiza la evacuación de polvo y permite un acabado uniforme sin saltos. Velocidad máxima operativa de 13,300 RPM (80 m/s). Compatible con esmeriles angulares de 4 1/2".',
  (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 7,
    'diametro', '4 1/2 pulgadas (115 mm x 22.2 mm)',
    'modelo', '76681',
    'tipoSegmento', 'Turbo segmentado en espiral con orificios de refrigeración en el cuerpo',
    'norma', 'Certificación de seguridad EN 13236',
    'velocidadMaxima', '13,300 RPM (80 m/s)',
    'aplicaciones', 'Concreto, mampostería, granito, mármol, piedras duras y remoción de pinturas y adhesivos',
    'tags', jsonb_build_array(
      'disco turbo segmentado',
      'copa diamantada tolsen',
      'copa desbaste concreto',
      'copa turbo 4 1/2',
      'tolsen 76681',
      'muela diamantada',
      'desbaste de concreto',
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

-- 4. Mecha Escalonada HSS Titanio 1/4" (4-12mm - 4-20mm)
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
  'Mecha Escalonada HSS Titanio 1/4" (4-12mm - 4-20mm)',
  'mecha-escalonada-hss-titanio-4-12mm-4-20mm',
  'BROC-ESC-HSS-14',
  'Broca o mecha cónica escalonada de acero rápido (HSS) con recubrimiento de nitruro de titanio dorado y vástago hexagonal de 1/4". Perfora, ensancha y desbarba agujeros limpios en láminas metálicas, aluminio, PVC, madera y plástico. Disponible en 4-12 mm y 4-20 mm.',
  'Mecha o broca escalonada cónica fabricada en acero rápido de alta resistencia (HSS) con recubrimiento de nitruro de titanio (TiN) que reduce la fricción, disipa el calor y triplica la durabilidad del filo. Su diseño de doble flauta helicoidal o recta con punta autocentrante permite iniciar la perforación sin resbalamientos y realizar orificios de múltiples diámetros con una sola herramienta, ensanchando y desbarbando los bordes en un solo movimiento. Ideal para perforaciones limpias y cilíndricas en láminas de hierro, acero al carbono delgado, aluminio, cobre, latón, plástico, acrílico, fibra de vidrio y madera. Cada escalón cuenta con marcado láser indeleble del diámetro correspondiente. Dispone de vástago hexagonal de 1/4 pulgada (6.35 mm) compatible con mandriles de taladro convencional y atornilladores de impacto. Disponible en rango de 4 a 12 mm y de 4 a 20 mm en incrementos de 2 mm.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 8,
    'material', 'Acero rápido HSS tratado térmicamente con recubrimiento de nitruro de titanio (TiN)',
    'vastago', 'Hexagonal de 1/4 pulgada (6.35 mm) de cambio rápido',
    'diseno', 'Doble flauta de corte con punta autocentrante',
    'aplicaciones', 'Láminas de metal, hierro dulce, aluminio, latón, madera, PVC y acrílico',
    'variantLabel', 'Rango de Perforación',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '4 - 12 mm (9 pasos / vástago 1/4")'),
      jsonb_build_object('value', '4 - 20 mm (9 pasos / vástago 1/4")')
    ),
    'tags', jsonb_build_array(
      'mecha escalonada',
      'broca escalonada',
      'mecha escalonada 4-12mm',
      'mecha escalonada 4-20mm',
      'hss titanio',
      'vastago 1/4',
      'perforacion de laminas',
      'brocas y abrasivos',
      'herramientas'
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

-- 5. Tarraja Dual Mecánica para PVC 1/2" - 3/4" (Acople a Taladro)
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
  'Tarraja Dual Mecánica para PVC 1/2" - 3/4" (Acople a Taladro)',
  'tarraja-dual-mecanica-pvc-1-2-3-4',
  'BROC-TARR-DUAL-PVC',
  'Roscadora o tarraja mecánica dual macho y hembra para tuberías plásticas de PVC y CPVC en medidas de 1/2" y 3/4". Cuenta con vástago de acople para mandril de taladro, permitiendo hacer roscas exteriores e interiores uniformes y estancas en segundos.',
  'Tarraja mecánica dual de acoplamiento a taladro diseñada para el roscado rápido, preciso y sin esfuerzo de tuberías y conexiones de PVC, CPVC y plásticos rígidos en medidas estándar de 1/2 pulgada y 3/4 de pulgada. Su innovador sistema dual permite labrar roscas machos (exteriores en extremos de tubos) y roscas hembras (interiores en bocas de conexiones o tubos ensanchados) garantizando filetes perfectos y libres de rebabas que aseguran uniones totalmente herméticas sin fugas de agua. Fabricada en aleación metálica templada de alta resistencia al desgaste con cuchillas afiladas de corte limpio. Equipada con vástago para sujeción directa en el mandril de cualquier taladro eléctrico o inalámbrico, ahorrando tiempo y eliminando la fatiga de las tarrajas manuales convencionales de matraca en instalaciones de plomería y riego.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'brocas-y-abrasivos' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 9,
    'medidas', '1/2 pulgada y 3/4 pulgada (medidas estándar para tuberías plásticas)',
    'tipoRoscado', 'Dual: Roscado macho exterior e interior hembra',
    'acople', 'Vástago para mandril de taladro eléctrico o inalámbrico',
    'materialesCompatibles', 'Tuberías y accesorios de PVC, CPVC y plásticos rígidos',
    'tags', jsonb_build_array(
      'tarraja para pvc',
      'tarraja dual',
      'tarraja para taladro',
      'terraja pvc',
      'roscadora pvc',
      'tarraja 1/2',
      'tarraja 3/4',
      'plomeria',
      'brocas y abrasivos',
      'accesorios para taladro'
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
