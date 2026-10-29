-- =============================================================================
-- Migración 068: Productos para Línea Electricidad (Crimpeadora Trinquete y Pelacable Multifunción Tolsen)
-- =============================================================================
-- Archivo: docs/migrations/068_add_crimpeadora_trinquete_y_alicate_pelacable_tolsen.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-29
--
-- Productos agregados:
--   1. Pinza Crimpeadora de Terminales con Trinquete
--   2. Alicate Pelacable y Crimpeador Multifunción 8.5" Tolsen
-- =============================================================================

BEGIN;

-- 1. Pinza Crimpeadora de Terminales con Trinquete
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
  'Pinza Crimpeadora de Terminales con Trinquete',
  'pinza-crimpeadora-terminales-trinquete',
  'ELEC-CRIMP-TRINQ-HS30J',
  'Pinza crimpeadora profesional con sistema de trinquete (carraca) para terminales eléctricos aislados (0.5 a 6.0 mm² / 22-10 AWG). Mecanismo de ciclo completo, liberación de emergencia y mangos ergonómicos.',
  'Pinza crimpadora / ponchadora manual con mecanismo de trinquete de alta precisión (modelo HS-30J), diseñada para el engaste seguro y uniforme de terminales eléctricos preaislados (tipo ojo, horquilla, faston macho/hembra, bala y unión a tope). Su sistema de carraca asegura que la mordaza no se abra hasta completar la presión requerida, garantizando un contacto eléctrico de óptima conductividad sin aplastamientos excesivos. Cuenta con matriz de 3 cavidades identificadas por códigos de color estándar (rojo 0.5-1.5 mm², azul 1.5-2.5 mm² y amarillo 4-6 mm²), rueda de ajuste de presión y palanca de liberación manual de emergencia en caso de atascamiento. Fabricada en acero especial al carbono tratado térmicamente con mangos bimateriales antideslizantes de alta palanca para reducir la fatiga en jornadas prolongadas.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 19,
    'modelo', 'HS-30J',
    'mecanismo', 'Trinquete / carraca de ciclo completo con seguro de liberación rápida',
    'capacidadCrimpado', '0.5 mm² a 6.0 mm² (AWG 22 - 10)',
    'cavidadesMatriz', '3 cavidades calibradas para terminales aislados (Rojo 0.5-1.5 mm² / Azul 1.5-2.5 mm² / Amarillo 4.0-6.0 mm²)',
    'material', 'Acero al carbono de alta resistencia con acabado oxidado negro anticorrosión',
    'empunadura', 'Bimaterial ergonómica antideslizante de alta transmisión de fuerza',
    'regulacion', 'Dial rotativo con rueda dentada para ajuste de presión de compresión',
    'tags', jsonb_build_array(
      'pinza crimpeadora',
      'crimpadora de terminales',
      'ponchadora de terminales',
      'pinza con trinquete',
      'crimper hs-30j',
      'terminales electricos',
      'terminales preaislados',
      'electricidad',
      'cables'
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

-- 2. Alicate Pelacable y Crimpeador Multifunción 8.5" Tolsen
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
  'Alicate Pelacable y Crimpeador Multifunción 8.5" Tolsen',
  'alicate-pelacable-crimpeador-tolsen',
  'TOL-38052',
  'Alicate pelacable y ponchador multifunción 8.5" (215 mm) Tolsen. Pela cables de 10 a 22 AWG, corta pernos y tornillos de cobre en 5 medidas, cizalla cortacables y prensa terminales aislados y no aislados.',
  'Alicate pelacables, cortador y crimpeador multifuncional de 8.5 pulgadas (215 mm) marca Tolsen (modelo 38052), indispensable en la caja de herramientas de electricistas e instaladores. Fabricado en acero al carbono especial de alta dureza con tratamiento superficial fosfatado negro anticorrosión. Integra 5 funciones en una sola herramienta: mordazas frontales estriadas para tirar y enrollar alambre; orificios afilados con corte de precisión para pelar conductores de 6 medidas (10, 12, 14, 16, 18, 20 y 22 AWG / 0.6 a 2.6 mm); cizalla para corte limpio de cables; matriz para roscar y cortar tornillos y pernos de cobre sin arruinar la rosca (medidas 4-40, 6-32, 8-32, 10-24, 10-32); y matriz ponchadora para prensar terminales eléctricos aislados y sin aislamiento. Mangos curvados con recubrimiento de vinilo amarillo ergonómico de excelente agarre y confort.',
  (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 20,
    'modelo', '38052',
    'longitud', '8.5 pulgadas (215 mm)',
    'funciones', 'Pelado de cables, corte de alambre, corte de tornillos de cobre, crimpado de terminales y pinza de sujeción',
    'rangoPelado', '10, 12, 14, 16, 18, 20, 22 AWG (0.6 mm a 2.6 mm)',
    'cortaTornillos', '5 orificios roscados para cortar tornillos de cobre (4-40, 6-32, 8-32, 10-24, 10-32)',
    'crimpado', 'Terminales aislados y no aislados (10 - 22 AWG / 0.5 - 6.0 mm²)',
    'material', 'Acero al carbono forjado con acabado pavonado negro antioxidante',
    'mango', 'Recubrimiento de vinilo ergonómico amarillo de alta adherencia',
    'tags', jsonb_build_array(
      'alicate pela cable',
      'pelacable tolsen',
      'alicate pelacables tolsen 38052',
      'crimpeador multifuncion',
      'corta pernos',
      'ponchadora tolsen',
      'electricidad',
      'cables',
      'herramientas de electricista'
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
