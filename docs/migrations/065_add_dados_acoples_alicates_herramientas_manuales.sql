-- =============================================================================
-- Migración 065: Productos para Línea Herramientas Manuales
-- =============================================================================
-- Archivo: docs/migrations/065_add_dados_acoples_alicates_herramientas_manuales.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-27
--
-- Productos agregados:
--   1. Juego de Dados de Impacto Dr 1/2" 10mm - 24mm
--   2. Juego de Acoples Neumáticos Rápidos 1/4" NPT (6 Piezas)
--   3. Alicate Mecánico 8"
--   4. Alicate Pico de Loro 10"
-- =============================================================================

BEGIN;

-- 1. Juego de Dados de Impacto Dr 1/2" 10mm - 24mm
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
  'Juego de Dados de Impacto Dr 1/2" 10mm - 24mm',
  'juego-de-dados-impacto-1-2-10mm-24mm',
  'HM-DADOS-IMP-12-10-24',
  'Juego de dados de impacto de 1/2" en acero cromo molibdeno (Cr-Mo) de alta resistencia para llaves de impacto neumáticas y eléctricas. Rango métrico de 10mm a 24mm.',
  'Juego de dados de impacto métricos con cuadrante de 1/2 pulgada (Dr. 1/2") fabricados en acero cromo-molibdeno (Cr-Mo) forjado y tratado térmicamente con acabado fosfatado negro anticorrosivo. Diseñados para resistir el alto torque y vibraciones de pistolas y llaves de impacto neumáticas, a batería o eléctricas sin deformarse ni fracturarse. Incluye dados de 6 puntas (diseño lobular que aplica fuerza sobre las caras planas del perno evitando redondear las esquinas) en las medidas más utilizadas: 10mm, 12mm, 13mm, 14mm, 15mm, 17mm, 19mm, 21mm, 22mm y 24mm. Perforación lateral para pasador y anillo de retención de seguridad.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'set',
    'stockStatus', 'available',
    'priority', 9,
    'cuadrante', '1/2 pulgada (12.7 mm)',
    'material', 'Acero Cromo Molibdeno (Cr-Mo) fosfatado en negro',
    'perfil', 'Hexagonal de 6 puntas con diseño lobular anti-desgaste',
    'medidas', jsonb_build_array('10 mm', '12 mm', '13 mm', '14 mm', '15 mm', '17 mm', '19 mm', '21 mm', '22 mm', '24 mm'),
    'aplicacion', 'Uso en talleres mecánicos, pistolas de impacto neumáticas y a batería',
    'tags', jsonb_build_array(
      'juego de dados impacto dr 1/2" 10mm - 24mm',
      'dados de impacto 1/2',
      'dados impacto',
      'cr-mo',
      'cromo molibdeno',
      'llave de impacto',
      'mecanica automotriz',
      'herramientas manuales',
      'taller'
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

-- 2. Juego de Acoples Neumáticos Rápidos 1/4" NPT (6 Piezas)
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
  'Juego de Acoples Neumáticos Rápidos 1/4" NPT (6 Piezas)',
  'juego-acoples-neumaticos-rapidos-1-4-npt-6pzas',
  'HM-ACOPLES-NEUM-14-6P',
  'Kit de 6 acoples y conectores rápidos para aire comprimido con rosca estándar de 1/4" NPT en acero galvanizado anticorrosivo para mangueras y herramientas neumáticas.',
  'Juego de conectores y acoples rápidos neumáticos de 6 piezas diseñado para líneas de aire comprimido, compresores y herramientas neumáticas de taller (pistolas de impacto, esmeriles, infladores, pistolas de pintar). Fabricados en acero templado galvanizado de alta resistencia mecánica a la fricción y presión de trabajo, con sistema de conexión y desconexión rápida por manguito deslizante con balines de acero y sello hermético de nitrilo que previene fugas de aire. Conexión roscada universal de 1/4 pulgada NPT estándar. Incluye acoples rápidos hembra y conectores macho y hembra.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'set',
    'stockStatus', 'available',
    'priority', 10,
    'cantidadPiezas', '6 piezas',
    'tamanoRosca', '1/4 pulgada NPT universal',
    'material', 'Acero templado cincado / galvanizado resistente a la corrosión',
    'tipoConexion', 'Acople rápido de balines con seguro deslizante y espigas macho/hembra',
    'aplicacion', 'Líneas neumáticas, compresores, pistolas de impacto y herramientas de aire',
    'tags', jsonb_build_array(
      'juego acople neumático 1/4 npt 6pzas',
      'acople rapido neumatico',
      'conectores neumaticos',
      'acoples de aire',
      '1/4 npt',
      'herramientas neumaticas',
      'compresor',
      'herramientas manuales'
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

-- 3. Alicate Mecánico 8"
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
  'Alicate Mecánico 8"',
  'alicate-mecanico-8-pulgadas',
  'HM-ALIC-MEC-8',
  'Alicate mecánico ajustable de 8 pulgadas (200 mm) en acero forjado con mordaza curva de apertura regulable en dos posiciones y mangos engomados antideslizantes.',
  'Alicate de mecánico tipo articulado (Slip Joint Pliers) de 8 pulgadas (200 mm) forjado en acero al carbono tratado térmicamente para máxima resistencia a la torsión y desgaste. Cuenta con articulación deslizante de doble posición que permite ampliar la apertura de las mordazas para sujetar piezas, tuercas, pernos y tuberías de diversos diámetros. Incorpora mordaza plana dentada para sujeción de objetos planos, sección curva cóncava para elementos cilíndricos y cizalla cortacables en la base de la quijada. Mangos recubiertos en polímero engomado ergonómico antideslizante que proporcionan agarre seguro y confortable durante labores prolongadas.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 11,
    'longitud', '8 pulgadas (200 mm)',
    'material', 'Acero al carbono forjado con mordazas endurecidas',
    'tipoArticulacion', 'Articulación deslizante de 2 posiciones (Slip Joint)',
    'mangos', 'Bimaterial engomado ergonómico antideslizante',
    'aplicacion', 'Mecánica automotriz, ajuste y sujeción de pernos, tuberías y alambres',
    'tags', jsonb_build_array(
      'alicate mecánico 8"',
      'alicate mecanico',
      'slip joint pliers',
      'alicate de chofer',
      'alicate articulado',
      '8 pulgadas',
      'herramientas manuales',
      'mecanica',
      'taller'
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

-- 4. Alicate Pico de Loro 10"
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
  'Alicate Pico de Loro 10"',
  'alicate-pico-de-loro-10-pulgadas',
  'HM-ALIC-PICOLORO-10',
  'Alicate ajustable tipo pico de loro de 10 pulgadas (250 mm) en acero forjado con múltiples posiciones de ranura para sujeción de tuberías, tuercas y piezas irregulares.',
  'Alicate extensible ajustable tipo pico de loro (Water Pump Pliers / Canal de ranura) de 10 pulgadas (250 mm) forjado en acero al carbono de alta resistencia con dientes endurecidos por inducción en ángulo opuesto para garantizar agarre antideslizante sobre tuberías redondas, pernos hexagonales y accesorios sanitarios o mecánicos. Sistema de ranuras maquinadas con múltiples posiciones de ajuste que amplía el rango de apertura con deslizamiento rápido y bloqueo firme bajo carga. Mangos bimateriales antideslizantes de diseño ergonómico que protegen contra pellizcos y optimizan la palanca de apriete con menor esfuerzo.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 12,
    'longitud', '10 pulgadas (250 mm)',
    'material', 'Acero de alto carbono forjado con tratamiento térmico',
    'mordaza', 'Dientes endurecidos por inducción con perfil de agarre autobloqueante',
    'ajuste', 'Múltiples posiciones de ranura mecanizada con bloqueo firme',
    'mangos', 'Mangos engomados ergonómicos antideslizantes y anti-pellizco',
    'aplicacion', 'Plomería, instalaciones sanitarias, gas, cerrajería y mecánica pesada',
    'tags', jsonb_build_array(
      'alicate pico de loro 10"',
      'alicate pico de loro',
      'water pump pliers',
      'alicate ajustable',
      'alicate de extension',
      '10 pulgadas',
      'herramientas manuales',
      'plomeria',
      'mecanica'
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
