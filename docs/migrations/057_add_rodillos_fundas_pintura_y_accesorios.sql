-- =============================================================================
-- Migración 057: Productos para Línea Pintura y Accesorios
-- =============================================================================
-- Archivo: docs/migrations/057_add_rodillos_fundas_pintura_y_accesorios.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-26
--
-- Productos agregados:
--   1. Mango para Rodillo Estándar 9"
--   2. Funda para Rodillo 9" Pelo Corto - Medio - Largo
--   3. Camisa para Rodillo 9" Texturizado
--   4. Mango para Rodillo Goma Espuma 2" - 4"
--   5. Funda de Repuesto para Mini Rodillo 2" - 3" - 4"
-- =============================================================================

BEGIN;

-- 1. Mango para Rodillo Estándar 9"
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
  'Mango para Rodillo Estándar 9"',
  'mango-para-rodillo-estandar-9-pulgadas',
  'PINT-MANGO-ROD-9',
  'Maneral o mango para rodillo de 9 pulgadas con estructura de jaula de 5 alambres de acero galvanizado y rosca para extensión telescópica.',
  'Armazón o maneral estándar de 9 pulgadas para aplicación profesional de pinturas arquitectónicas en paredes, techos y fachadas. Construido con varilla de acero galvanizado anticorrosión y jaula de alambre reforzada que ofrece giro suave y sujeción firme de la funda sin deslizamientos. Empuñadura ergonómica plástica de alto impacto con cavidad roscada universal compatible con cabos y extensiones telescópicas para trabajos en altura.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'medida', '9 pulgadas (23 cm)',
    'tipoEstructura', 'Jaula de 5 alambres de acero galvanizado',
    'empunadura', 'Plástica ergonómica con rosca para extensión telescópica',
    'compatibilidad', 'Fundas y repuestos de rodillo estándar de 9 pulgadas',
    'aplicacion', 'Aplicación de pintura de caucho, esmalte y fondos en paredes y techos',
    'tags', jsonb_build_array('mango rodillo estándar 9"', 'mango para rodillo', 'maneral de rodillo', 'rodillo 9 pulgadas', 'jaula de alambre', 'pintura y accesorios', 'herramientas de pintor', 'remodelacion')
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

-- 2. Funda para Rodillo 9" Pelo Corto - Medio - Largo
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
  'Funda para Rodillo 9" Pelo Corto - Medio - Largo',
  'funda-para-rodillo-9-pelo-corto-medio-largo',
  'PINT-FUNDA-ROD-9-PELO',
  'Repuesto o funda de felpa para rodillo de 9 pulgadas en fibra de poliéster de alta densidad. Disponible en pelo corto, medio y largo para superficies lisas, semi-rugosas o rugosas.',
  'Funda de recambio para rodillo de 9 pulgadas elaborada en microfibra y poliéster trenzado de alta densidad con líneas guía. Proporciona excelente absorción, retención y transferencia uniforme de pintura sin dejar marcas ni pelusas. Disponible en tres alturas de pelo: Pelo Corto (ideal para paredes lisas, drywall y acabados satinados), Pelo Medio (para friso suave y mampostería estándar) y Pelo Largo (para texturas rústicas, bloques, ladrillos y fachadas rugosas). Núcleo plástico resistente a solventes y agua.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'medida', '9 pulgadas (23 cm)',
    'tiposDisponibles', jsonb_build_array('Pelo Corto (superficies lisas / drywall)', 'Pelo Medio (superficies semi-rugosas / mampostería)', 'Pelo Largo (superficies rugosas / fachadas)'),
    'material', 'Poliéster / felpa sintética de alta absorción',
    'tuboInterno', 'Polipropileno resistente al agua y solventes',
    'compatibilidadPintura', 'Pinturas de caucho, látex, satinadas y esmaltes base agua/solvente',
    'tags', jsonb_build_array('funda p/rodillo 9" pelo corto - medio - largo', 'funda para rodillo', 'repuesto de rodillo 9', 'felpa para rodillo', 'pelo corto', 'pelo medio', 'pelo largo', 'pintura y accesorios', 'pintor')
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

-- 3. Camisa para Rodillo 9" Texturizado
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
  'Camisa para Rodillo 9" Texturizado',
  'camisa-para-rodillo-9-texturizado',
  'PINT-CAMISA-ROD-9-TEXT',
  'Funda de esponja / espuma porosa de 9 pulgadas para aplicación de pastas texturizadas, revestimientos rústicos, efectos decorativos y acabados rugosos.',
  'Camisa o funda especial de 9 pulgadas fabricada en espuma de poliuretano de celda abierta y poro grueso (espuma alveolar). Diseñada específicamente para la aplicación homogénea y creación de efectos en revestimientos texturizados, pastas profesionales, estucos, granoplast y pinturas rústicas de alto espesor. Deja un relieve parejo y uniforme sobre frisos, columnas, fachadas y paredes decorativas. Reutilizable y fácil de lavar con agua tras su uso.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'medida', '9 pulgadas (23 cm)',
    'material', 'Espuma de poliuretano de celda abierta / poro grueso',
    'tuboInterno', 'Tubo plástico de alta resistencia a tracción',
    'usoRecomendado', 'Pastas texturizadas, pinturas elastoméricas, estucos y revestimientos rústicos',
    'acabado', 'Textura en relieve uniforme (efecto piqué / rústico)',
    'tags', jsonb_build_array('camisa p/rodillo 9" texturizado', 'rodillo texturizado', 'funda para texturizar', 'esponja texturizada', 'pastas texturizadas', 'estuco', '9 pulgadas', 'pintura y accesorios', 'acabados')
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

-- 4. Mango para Rodillo Goma Espuma 2" - 4"
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
  'Mango para Rodillo Goma Espuma 2" - 4"',
  'mango-para-rodillo-goma-espuma-2-4-pulgadas',
  'PINT-MANGO-MINIROD-2-4',
  'Maneral o mango metálico para mini rodillos de espuma y felpa de 2" a 4" con varilla delgada y empuñadura plástica ergonómica para esquinas, marcos y áreas estrechas.',
  'Mini armazón o mango aplicador diseñado para rodillos de espuma y microfibra en calibres de 2 a 4 pulgadas (5 cm a 10 cm). Estructura de varilla de acero zincado de perfil delgado que facilita el acceso a zonas estrechas como marcos de puertas, rejas, molduras, zócalos, esquinas y terminaciones de carpintería o herrería. Mango de plástico anatómico y ligero que permite un control preciso en trabajos de recorte y detalles finos.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'compatibilidadMedidas', jsonb_build_array('2 pulgadas (5 cm)', '3 pulgadas (7.5 cm)', '4 pulgadas (10 cm)'),
    'varilla', 'Acero zincado de 6 mm resistente a la torsión',
    'empunadura', 'Polímero liviano ergonómico de alta precisión',
    'aplicacion', 'Marcos de ventanas, puertas, rejas, tuberías, zócalos y retoques en espacios reducidos',
    'tags', jsonb_build_array('mango p/rodillo goma espuma 2" - 4"', 'mango mini rodillo', 'maneral para rodillo pequeño', '2 pulgadas', '4 pulgadas', 'goma espuma', 'pintura y accesorios', 'detalles y marcos')
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

-- 5. Funda de Repuesto para Mini Rodillo 2" - 3" - 4"
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
  'Funda de Repuesto para Mini Rodillo 2" - 3" - 4"',
  'funda-de-repuesto-mini-rodillo-2-3-4-pulgadas',
  'PINT-FUNDA-MINIROD-ESPUMA',
  'Repuestos de espuma de poliuretano de alta densidad para mini rodillos en medidas de 2", 3" y 4". Acabado extra liso sin marcas para esmaltes, lacas y barnices.',
  'Tubos o fundas de recambio fabricados en goma espuma de poliuretano de alta densidad (espuma fina sin poros) ideales para mini rodillos de 2, 3 y 4 pulgadas. Proporcionan un acabado ultra liso, parejo y libre de burbujas en superficies planas de metal, madera y mampostería. Especialmente indicados para la aplicación de esmaltes sintéticos, barnices, anticorrosivos y pinturas al agua en puertas, ventanas, muebles, muebles de cocina, tuberías y rejas metálicas. Fácil sustitución a presión sobre el maneral.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'medidasDisponibles', jsonb_build_array('2 pulgadas (5 cm)', '3 pulgadas (7.5 cm)', '4 pulgadas (10 cm)'),
    'material', 'Goma espuma de poliuretano de alta densidad (espuma fina)',
    'acabado', 'Superficie ultra lisa sin burbujas ni textura',
    'pinturasRecomendadas', 'Esmaltes sintéticos, anticorrosivos, barnices, lacas y pinturas acrílicas',
    'tags', jsonb_build_array('funda de repuesto mini rodillo 2" - 3" - 4"', 'repuesto mini rodillo', 'rodillos de espuma', 'esponja mini rodillo', '2 pulgadas', '3 pulgadas', '4 pulgadas', 'esmaltes y barnices', 'pintura y accesorios')
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
