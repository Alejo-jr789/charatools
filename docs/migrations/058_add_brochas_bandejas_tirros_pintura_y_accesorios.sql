-- =============================================================================
-- Migración 058: Productos de Brochas, Bandejas y Cintas para Pintura y Accesorios
-- =============================================================================
-- Archivo: docs/migrations/058_add_brochas_bandejas_tirros_pintura_y_accesorios.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-26
--
-- Productos agregados:
--   1. Rodillo de Goma Espuma con Mango 2" - 4"
--   2. Brochas para Pintar 1" - 2" - 3" - 4" - 5"
--   3. Bandeja para Pintar 9" y Sets de Pintura (3 y 6 Pzas)
--   4. Tirro de Papel para Pintor (Masking Tape) 1/2" a 2"
--   5. Cinta Adhesiva para Enmascarar Verde Alta Precisión 1/2" - 3/4" - 1"
-- =============================================================================

BEGIN;

-- 1. Rodillo de Goma Espuma con Mango 2" - 4"
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
  'Rodillo de Goma Espuma con Mango 2" - 4"',
  'rodillo-goma-espuma-con-mango-2-4-pulgadas',
  'PINT-ROD-ESPUMA-C-MANGO',
  'Mini rodillo completo de espuma de poliuretano de alta densidad con maneral ergonómico metálico en medidas de 2" y 4" para esmaltes y acabados lisos.',
  'Kit de mini rodillo aplicador completo (mango con varilla de acero galvanizado + rodillo de espuma cilíndrico) diseñado para trabajos de acabado fino, carpintería, rejas, marcos y esquinas. Fabricado con espuma de poliuretano de alta densidad que evita el goteo y no deja marcas de brocha ni burbujas, logrando un acabado espejo impecable con esmaltes sintéticos, barnices, poliuretanos, lacas y pinturas satinadas. Mango plástico ergonómico y ligero para máxima maniobrabilidad en áreas confinadas.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'medidasDisponibles', jsonb_build_array('2 pulgadas (5 cm)', '4 pulgadas (10 cm)'),
    'materialRodillo', 'Goma espuma de poliuretano de alta densidad',
    'estructura', 'Maneral de varilla de acero con mango plástico anatómico',
    'acabado', 'Ultra liso sin marcas ni textura',
    'aplicacion', 'Esmaltes, barnices, lacas, marcos de puertas, rejas, molduras y retoques',
    'tags', jsonb_build_array('rodillo goma espuma c/mango 2"- 4"', 'rodillo de espuma con mango', 'mini rodillo completo', 'rodillo para esmalte', '2 pulgadas', '4 pulgadas', 'pintura y accesorios', 'acabados finos')
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

-- 2. Brochas para Pintar 1" - 2" - 3" - 4" - 5"
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
  'Brochas para Pintar 1" - 2" - 3" - 4" - 5"',
  'brochas-para-pintar-1-2-3-4-5-pulgadas',
  'PINT-BROCHA-1-5-PULG',
  'Brocha profesional para pintor con cerdas mixtas de alta retención, virola metálica niquelada y mango ergonómico. Disponible en medidas de 1", 2", 3", 4" y 5".',
  'Brocha clásica para aplicación de pinturas base agua y solvente en construcción, carpintería y herrería. Confeccionada con cerdas compactas y recortadas con precisión que aseguran una excelente carga de pintura, peinado uniforme y liberación progresiva sobre la superficie sin soltar pelos. Virola metálica de hojalata estañada resistente a solventes y mango plástico ligero de diseño ergonómico con orificio para colgar. Disponible en una amplia gama de anchos: 1" y 2" para recortes y molduras, 3" para puertas y marcos, y 4" y 5" para muros y techos.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'medidasDisponibles', jsonb_build_array('1 pulgada (2.5 cm)', '2 pulgadas (5.0 cm)', '3 pulgadas (7.5 cm)', '4 pulgadas (10.0 cm)', '5 pulgadas (12.5 cm)'),
    'tipoCerda', 'Cerdas sintéticas / mixtas de alta resistencia y absorción',
    'virola', 'Acero estañado / niquelado antioxidante',
    'mango', 'Plástico inyectado de alto impacto con ojal para colgar',
    'compatibilidad', 'Pinturas de caucho, esmaltes sintéticos, barnices, selladores y fondos',
    'tags', jsonb_build_array('brocha 1" - 2" - 3" - 4" - 5"', 'brochas para pintar', 'brocha de pintor', '1 pulgada', '2 pulgadas', '3 pulgadas', '4 pulgadas', '5 pulgadas', 'pintura y accesorios', 'herramientas de pintor')
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

-- 3. Bandeja para Pintar 9" y Sets de Pintura (3 y 6 Pzas)
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
  'Bandeja para Pintar 9" y Sets de Pintura (3 y 6 Pzas)',
  'bandeja-para-pintar-9-sets-3-y-6-piezas',
  'PINT-BANDEJA-SET-3-6',
  'Bandeja plástica para rodillo de 9 pulgadas con rampa de escurrido estriada, disponible individual y en sets completos de 3 y 6 piezas para pintar.',
  'Bandeja para pintura de 9 pulgadas fabricada en polipropileno virgen de alta resistencia a solventes, caídas e impactos. Cuenta con depósito hondo para optimizar la carga de pintura y rampa texturizada con estrías antideslizantes que distribuyen homogéneamente la pintura sobre el rodillo y eliminan excesos sin salpicar. Disponible como bandeja individual o en convenientes kits de pintor: Set de 3 piezas (bandeja, rodillo 9" y brocha) y Set de 6 piezas (bandeja, maneral, 2 fundas, brocha y espátula/accesorios).',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'presentaciones', jsonb_build_array('Bandeja Individual 9 pulgadas', 'Set de 3 piezas (Bandeja + Rodillo 9" + Brocha)', 'Set de 6 piezas (Bandeja + Maneral + Repuestos + Brocha + Accesorios)'),
    'material', 'Polipropileno de alto impacto resistente a químicos y solventes',
    'rampa', 'Superficie estriada para escurrido parejo sin salpicaduras',
    'compatibilidad', 'Rodillos estándar de hasta 9 pulgadas (23 cm)',
    'tags', jsonb_build_array('bandeja para pintar 9" set de 3pzas - set de 6pzas', 'bandeja para pintar', 'set de pintar', 'kit de pintor', 'bandeja 9 pulgadas', 'set 3 piezas', 'set 6 piezas', 'pintura y accesorios')
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

-- 4. Tirro de Papel para Pintor (Masking Tape) 1/2" a 2"
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
  'Tirro de Papel para Pintor (Masking Tape) 1/2" a 2"',
  'tirro-de-papel-para-pintor-masking-tape-1-2-a-2-pulgadas',
  'PINT-TIRRO-PAPEL-MASKING',
  'Cinta de enmascarar (tirro de papel crepé) de uso general y profesional para pintura. Medidas: 1/2", 3/4", 1", 1-1/2" y 2" con adhesivo de remoción limpia sin residuos.',
  'Cinta adhesiva de papel crepé color beige / natural para enmascarado, protección de zócalos, marcos, vidrios y delimitación de líneas de pintura en paredes. Formulada con adhesivo de caucho natural de adherencia media que fija firmemente sobre madera, metal, yeso y vidrio, pero se despega limpiamente sin dejar residuos gomosos ni levantar la pintura base recién aplicada. Fácil de cortar a mano y flexible para contornear esquinas y bordes curvos.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'rollo',
    'stockStatus', 'available',
    'medidasDisponibles', jsonb_build_array('1/2 pulgada (12 mm)', '3/4 pulgada (18 mm)', '1 pulgada (24 mm)', '1-1/2 pulgada (36 mm)', '2 pulgadas (48 mm)'),
    'material', 'Papel crepé saturado con adhesivo de caucho sensible a la presión',
    'remocion', 'Limpia sin residuos ni desprendimiento de película de pintura',
    'color', 'Beige / Blanco hueso',
    'aplicaciones', 'Enmascarado en interiores, sellado de paquetes, rotulación y protección',
    'tags', jsonb_build_array('tirro papel 1/2 - 3/4 - 1" - 1" 1/2 - 2"', 'tirro de papel', 'masking tape', 'cinta de enmascarar', 'cinta de pintor', '1/2', '3/4', '1 pulgada', '1 1/2', '2 pulgadas', 'pintura y accesorios')
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

-- 5. Cinta Adhesiva para Enmascarar Verde Alta Precisión 1/2" - 3/4" - 1"
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
  'Cinta Adhesiva para Enmascarar Verde Alta Precisión 1/2" - 3/4" - 1"',
  'cinta-adhesiva-enmascarar-verde-alta-precision',
  'PINT-CINTA-ENMASC-VERDE',
  'Cinta de enmascarar verde de alta precisión para acabado automotriz e industrial. Resistente a solventes, calor y radiación UV con corte de pintura ultra nítido.',
  'Cinta de enmascarar verde de alto rendimiento (High Performance Green Masking Tape) especialmente diseñada para talleres de latonería y pintura automotriz, cabinas de horneado y acabados decorativos de máxima exigencia. Su soporte especial de papel impermeable resiste la filtración de esmaltes catalizados, lacas, poliuretanos y agua. Soporta ciclos de temperatura moderada y exposición solar sin degradarse ni resecarse. Proporciona bordes de pintura extra nítidos sin sangrado y se remueve de forma impecable sin dejar pegamento ni romper el sustrato.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'rollo',
    'stockStatus', 'available',
    'medidasDisponibles', jsonb_build_array('1/2 pulgada (12 mm)', '3/4 pulgada (18 mm)', '1 pulgada (24 mm)'),
    'color', 'Verde brillante (Green Masking Tape)',
    'resistenciaTermica', 'Resistente a ciclos de secado y cabinas de pintura',
    'adhesivo', 'Caucho sintético de alto agarre con remoción libre de residuos',
    'aplicacion', 'Pintura automotriz, latonería, aerografía, líneas bicolores y metales',
    'tags', jsonb_build_array('cinta adhesiva para enmascarar 1/2 - 3/4', 'cinta verde de enmascarar', 'masking tape verde', 'cinta automotriz', 'lineas nitidas', 'alta precision', 'latoneria y pintura', 'pintura y accesorios')
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
