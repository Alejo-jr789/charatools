-- =============================================================================
-- Migración 079: Sifones y Desagües para Fregaderos y Lavamanos (Línea Plomería)
-- =============================================================================
-- Archivo: docs/migrations/079_add_sifones_y_desagues_plomeria.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-09
--
-- Productos agregados:
--   1. Sifón Flexible Doble para Fregadero 1 1/2"
--   2. Desagüe para Fregadero con Canasta de Acero Inoxidable
--   3. Sifón Metálico Cromado Tipo P para Fregadero y Lavamanos
--   4. Sifón Rígido de PVC Sanitario para Fregadero y Lavamanos
--   5. Sifón Flexible Extensible Universal para Fregadero y Lavamanos
--   6. Conexión Doble Metálica para Fregadero de Dos Poncheras 1 1/2"
-- =============================================================================

BEGIN;

-- 1. Sifón Flexible Doble para Fregadero 1 1/2"
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
  'Sifón Flexible Doble para Fregadero 1 1/2"',
  'sifon-flexible-doble-fregadero-1-1-2',
  'PLOM-SIFON-FLEX-DOB-112',
  'Sifón de doble entrada tipo Y flexible y extensible de polipropileno para fregaderos de dos poncheras (1 1/2"). Se adapta a desalineaciones y desniveles de desagüe con sellos herméticos antiolores.',
  'Sifón doble flexible para desagüe de fregaderos de dos tinas o poncheras, diseñado con cuerpo bifurcado tipo "Y" en polipropileno blanco virgen de alta resistencia química y térmica. Sus dos ramas corrugadas extensibles tipo acordeón permiten salvar desalineaciones pronunciadas entre las descargas del fregadero y el punto de empalme a la tubería sanitaria de la pared. Incluye tuercas locas de 1 1/2" con roscas estándar y empaques cónicos de elastómero para un acople hermético libre de filtraciones con las canastas de desagüe. Su diseño con trampa hidráulica previene el retorno de malos olores y gases cloacales hacia la cocina. Altamente resistente al agua caliente, jabones desengrasantes y detergentes de uso doméstico.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 16,
    'marca', 'Genérico',
    'material', 'Polipropileno (PP) virgen flexible blanco',
    'medidaEntrada', '1 1/2" (2 entradas con tuerca y empaque)',
    'tipoSalida', 'Tubo liso de conexión a pared / tubería sanitaria 1 1/2"',
    'diseño', 'Tipo "Y" con mangueras corrugadas extensibles y flexibles',
    'compatibilidad', 'Fregaderos de dos tinas o poncheras con canastas estándar de 1 1/2"',
    'caracteristicas', 'Trampa antiolores moldeable, tuercas de fácil apriete manual, resistente a grasas y agua hirviendo',
    'tags', jsonb_build_array(
      'sifón',
      'sifón flexible',
      'sifón doble',
      'sifón para fregadero',
      'fregadero doble ponchera',
      'desagüe',
      'polipropileno',
      '1 1/2 pulgada',
      'plomería'
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

-- 2. Desagüe para Fregadero con Canasta de Acero Inoxidable
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
  'Desagüe para Fregadero con Canasta de Acero Inoxidable',
  'desague-fregadero-canasta-acero-inoxidable',
  'PLOM-DESAGUE-FREG-CANASTA',
  'Desagüe estándar para fregadero con copa y canastilla coladora removible en acero inoxidable, cuerpo roscado de 1 1/2" con tuerca y empaques de estanqueidad para orificios de fregadero estándar.',
  'Válvula de desagüe para fregadero de cocina fabricada con canastilla coladora removible y brida superior en acero inoxidable de grado sanitario, resistente a la corrosión y manchas de alimentos. Diseñada para fregaderos de orificio estándar (3 1/2" a 4"), cuenta con cuerpo roscado inferior de alta durabilidad con rosca de 1 1/2" compatible con todo tipo de sifones rígidos o flexibles. Su canastilla interior perforada retiene restos de comida para evitar atascos en la tubería y dispone de perilla central con función tapón para retener el agua en la ponchera cuando sea necesario. Incluye tuerca de apriete inferior y juntas de goma / arandelas de fricción para sellado impermeable sin fugas bajo el mesón.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 17,
    'marca', 'Genérico',
    'material', 'Brida superior y canastilla en Acero Inoxidable, cuerpo roscado reforzado',
    'diametroSuperior', 'Para orificios de fregadero estándar de 3 1/2" a 4" (85 a 110 mm)',
    'roscaDescarga', '1 1/2" estándar compatible con sifones plásticos y metálicos',
    'incluye', 'Canastilla colador removible con función tapón hermético, empaques y contratuerca de fijación',
    'aplicacion', 'Fregaderos de cocina de acero inoxidable, granito, sobre mesón o empotrados',
    'tags', jsonb_build_array(
      'desagüe',
      'desagüe fregadero',
      'canasta fregadero',
      'colador fregadero',
      'acero inoxidable',
      'valvula fregadero',
      '1 1/2',
      'plomería'
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

-- 3. Sifón Metálico Cromado Tipo P para Fregadero y Lavamanos
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
  'Sifón Metálico Cromado Tipo P para Fregadero y Lavamanos',
  'sifon-metalico-cromado-tipo-p-fregadero-lavamanos',
  'PLOM-SIFON-MET-CROM-P',
  'Sifón metálico rígido tipo P con acabado cromado brillante para lavamanos y fregaderos. Incluye tubo de descarga a pared, escudo embellecedor (chapetón), tuercas roscadas y empaques de sellado.',
  'Sifón trampa hidráulica metálico tipo P con acabado cromado brillante de alta durabilidad y resistencia al desgaste, ideal para instalaciones vistas y bajo mesón en lavamanos de baños y fregaderos de cocina. Su cuerpo curvado en P mantiene un sello de agua constante que bloquea por completo la salida de malos olores y gases procedentes de la red sanitaria. Fabricado con tubos metálicos de pared reforzada, cuenta con tuercas metálicas de unión roscadas de fácil montaje y desmontaje para limpieza rápida de sedimentos, tubo de extensión horizontal hacia la pared con escudo embellecedor (chapetón) para un acabado estético impecable, y arandelas de fricción de polímero de alta estanqueidad. Disponible en medidas de 1 1/4" (lavamanos) y 1 1/2" (fregadero).',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 18,
    'marca', 'Genérico',
    'material', 'Aleación metálica con baño de cromo pulido brillante',
    'tipo', 'Sifón trampa en "P" (P-Trap)',
    'medidasDisponibles', '1 1/4" (Lavamanos) y 1 1/2" (Fregadero)',
    'incluye', 'Curva en U, tubo de extensión horizontal a pared, chapetón embellecedor, tuercas de ajuste y sellos',
    'acabado', 'Cromado espejo resistente a la corrosión y humedad',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1 1/4" (Lavamanos)'),
      jsonb_build_object('value', '1 1/2" (Fregadero)')
    ),
    'tags', jsonb_build_array(
      'sifón',
      'sifón metálico',
      'sifón cromado',
      'sifón tipo p',
      'p-trap',
      'sifón lavamanos',
      'sifón fregadero',
      'chapetón',
      'plomería'
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

-- 4. Sifón Rígido de PVC Sanitario para Fregadero y Lavamanos
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
  'Sifón Rígido de PVC Sanitario para Fregadero y Lavamanos',
  'sifon-rigido-pvc-sanitario-fregadero-lavamanos',
  'PLOM-SIFON-RIGIDO-PVC-P',
  'Sifón rígido de PVC sanitario tipo P con tapón de inspección y registro inferior para limpieza rápida. Diseñado para lavamanos y fregaderos con tuercas roscadas y tubo de desagüe a pared.',
  'Sifón fijo rígido en PVC sanitario blanco de alta densidad para evacuación de aguas servidas en fregaderos de cocina y lavamanos. Equipado con una sólida curva tipo P que asegura un sello hidráulico constante contra malos olores y una práctica tapa o tapón de registro roscado en la parte inferior de la curva, el cual permite drenar agua, retirar sedimentos y recuperar objetos caídos accidentalmente sin necesidad de desmontar toda la tubería. Incluye tuercas plásticas roscadas ergonómicas de ajuste manual, empaques cónicos de sellado hermético y tubo codo de descarga para conexión a pared. Gran resistencia al impacto, ácidos débiles, aceites domésticos y productos de limpieza.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 19,
    'marca', 'Genérico',
    'material', 'PVC Sanitario blanco virgen de alta resistencia',
    'tipo', 'Sifón rígido tipo P con tapón de registro inferior',
    'medidasDisponibles', '1 1/4" (Lavamanos) y 1 1/2" (Fregadero)',
    'caracteristicaEspecial', 'Tapón roscado de registro/inspección inferior para fácil mantenimiento',
    'instalacion', 'Tuercas ergonómicas de apriete manual con empaques cónicos herméticos',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1 1/4" (Lavamanos)'),
      jsonb_build_object('value', '1 1/2" (Fregadero)')
    ),
    'tags', jsonb_build_array(
      'sifón',
      'sifón pvc',
      'sifón fijo',
      'sifón rígido',
      'con registro',
      'sifón lavamanos',
      'sifón fregadero',
      'pvc blanco',
      'plomería'
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

-- 5. Sifón Flexible Extensible Universal para Fregadero y Lavamanos
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
  'Sifón Flexible Extensible Universal para Fregadero y Lavamanos',
  'sifon-flexible-extensible-universal-fregadero-lavamanos',
  'PLOM-SIFON-FLEX-EXT-UNIV',
  'Sifón universal flexible tipo fuelle acordeón de polipropileno blanco virgen. Extensible y orientable en 360°, resuelve cualquier desalineación entre el desagüe y la pared en medidas 1 1/4" y 1 1/2".',
  'Sifón corrugado universal flexible extensible tipo acordeón, fabricado en polipropileno virgen de primera calidad que ofrece máxima flexibilidad y resistencia a la fatiga mecánica. Su tubo extensible se estira, comprime y dobla en cualquier dirección (360°), permitiendo formar la trampa antiolores en "S" o "P" y solucionar fácilmente problemas de desalineación o distancias incómodas entre el desagüe del lavamanos o fregadero y la boca de la tubería sanitaria de la pared. Provisto de tuerca de acople con rosca estándar con empaque de estanqueidad de alta compresión, y terminal escalonado de salida adaptable a tuberías sanitarias de 32 mm, 40 mm y 50 mm (1 1/4", 1 1/2" y 2"). Fácil de limpiar y de instalar con la mano sin herramientas especiales ni pegamentos.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 20,
    'marca', 'Genérico',
    'material', 'Polipropileno virgen blanco flexible',
    'diseño', 'Manguera corrugada tipo fuelle extensible y moldeable 360°',
    'longitud', 'Extensible de 35 cm a 80 cm aprox.',
    'conexionSalida', 'Terminal escalonado universal 1 1/4", 1 1/2" y 2" (32 / 40 / 50 mm)',
    'medidasDisponibles', '1 1/4" (Lavamanos) y 1 1/2" (Fregadero)',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1 1/4" (Lavamanos)'),
      jsonb_build_object('value', '1 1/2" (Fregadero)')
    ),
    'tags', jsonb_build_array(
      'sifón',
      'sifón flexible',
      'sifón acordeón',
      'sifón extensible',
      'sifón universal',
      'sifón lavamanos',
      'sifón fregadero',
      'plomería'
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

-- 6. Conexión Doble Metálica para Fregadero de Dos Poncheras 1 1/2"
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
  'Conexión Doble Metálica para Fregadero de Dos Poncheras 1 1/2"',
  'conexion-doble-metalica-fregadero-1-1-2',
  'PLOM-CONEX-DOBLE-MET-112',
  'Brazo colector doble metálico cromado de 1 1/2" para fregadero de dos tinas. Une las dos descargas de las canastas hacia una única bajante central de conexión al sifón con tuercas y empaques herméticos.',
  'Colector o ramal de desagüe doble metálico de 1 1/2" con acabado cromado brillante para fregaderos de cocina con doble tina o ponchera. Fabricado con tubos metálicos de latón/aleación de alta durabilidad que ofrecen gran solidez mecánica y resistencia ante vertidos continuos de agua caliente y grasas. Su diseño horizontal con codos de entrada de 1 1/2" se adapta a la separación entre las canastas de desagüe de ambas poncheras, canalizando el flujo de ambas tinas de manera uniforme hacia un tubo central vertical de salida de 1 1/2", listo para conectar al sifón trampa (rígido o metálico). Incluye tuercas de unión roscadas de metal y empaques cónicos herméticos de ajuste perfecto, evitando filtraciones en muebles bajo mesón.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 21,
    'marca', 'Genérico',
    'material', 'Aleación metálica reforzada con acabado cromado',
    'medidaEntradas', '2 Entradas verticales de 1 1/2" con tuerca metálica y junta',
    'medidaSalida', 'Bajante vertical central de 1 1/2" para acople a sifón',
    'diseño', 'Brazos telescópicos de desagüe doble con tee central unificadora',
    'aplicacion', 'Fregaderos de dos tinas o poncheras con canastas estándar',
    'beneficio', 'Unifica las dos descargas en una sola salida de drenaje ahorrando espacio bajo el mueble',
    'tags', jsonb_build_array(
      'sifón doble',
      'conexión doble',
      'brazo doble metálico',
      'fregadero doble',
      'desagüe doble',
      'fregadero dos poncheras',
      'acabado cromado',
      '1 1/2 pulgada',
      'plomería'
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
