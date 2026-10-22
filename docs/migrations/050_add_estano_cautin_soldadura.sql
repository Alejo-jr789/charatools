-- =============================================================================
-- Migración 050: Productos de Soldadura Blanda (Estaño y Cautín)
-- =============================================================================
-- Archivo: docs/migrations/050_add_estano_cautin_soldadura.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-22
-- =============================================================================

BEGIN;

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
  -- 1. Estaño Rollo 250gr 1.0mm 40/60 Zasc
  (
    'Estaño Rollo 250gr 1.0mm 40/60 Zasc',
    'estano-rollo-250gr-10mm-40-60-zasc',
    'SOL-ESTANO-ROLLO-250G-ZASC',
    'Carrete de estaño para soldar de 250g Zasc, aleación 40/60 (40% estaño / 60% plomo) con diámetro de 1.0mm y núcleo de resina fundente para electrónica y electricidad.',
    'Alambre de estaño para soldadura blanda en presentación de carrete de 250 gramos marca Zasc (modelo Z-TS250G-1.0). Formulado con aleación 40% estaño y 60% plomo con un diámetro calibrado de 1.0 mm, ideal para ensambles electrónicos, uniones de cables de cobre, conexiones en placas PCB y reparaciones electrodomésticas y automotrices. Cuenta con alma de resina fundente (rosin core) que desoxida la superficie al contacto con la temperatura, permitiendo un flujo homogéneo, excelente adherencia y puntos de soldadura brillantes y resistentes.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'zasc' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'peso', '250 g',
      'diametro', '1.0 mm',
      'aleacion', '40/60 (40% Estaño / 60% Plomo)',
      'nucleo', 'Resina (Rosin Core)',
      'unidad', 'rollo',
      'stockStatus', 'available',
      'tags', jsonb_build_array('estaño rollo 250gr 1.0mm 40/60', 'estaño zasc', 'alambre de soldadura', 'estaño 250g', '1.0mm', '40/60', 'zasc', 'soldadura blanda', 'electrónica', 'soldadura'),
      'priority', 12
    )
  ),

  -- 2. Estaño Rollo 10gr 0.8mm - 1.0mm 37/63
  (
    'Estaño Rollo 10gr 0.8mm - 1.0mm 37/63',
    'estano-rollo-10gr-08mm-10mm-37-63',
    'SOL-ESTANO-TUBO-10G-37-63',
    'Tubo dispensador portátil de estaño para soldar de 10g, aleación eutéctica 63/37 con alma de resina para reparaciones rápidas de precisión en electrónica y audio.',
    'Estaño para soldar en práctico dispensador cilíndrico de bolsillo de 10 gramos con orificio guía para alimentación dosificada y protección contra enredos. Formulado en aleación de alta pureza 63% estaño y 37% plomo (punto de fusión rápido y limpio a 183°C) disponible en calibres finos de 0.8 mm y 1.0 mm con alma de resina no corrosiva incorporada. Indispensable para técnicos electrónicos, mantenimiento de tarjetas de circuitos, conectores de sonido, empalmes eléctricos y proyectos de bricolaje escolar y profesional.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'peso', '10 g',
      'diametro', '0.8 mm - 1.0 mm',
      'aleacion', '63/37 (63% Estaño / 37% Plomo)',
      'presentacion', 'Tubo dispensador de bolsillo',
      'unidad', 'tubo',
      'stockStatus', 'available',
      'tags', jsonb_build_array('estaño rollo 10gr 0.8mm - 1.0mm 37/63', 'estaño en tubo', 'estaño 10g', '63/37', '37/63', 'soldadura electronica', 'cautin', 'soldadura blanda', 'soldadura'),
      'priority', 13
    )
  ),

  -- 3. Cautín Soldador Punta Fina 80W - 100W
  (
    'Cautín Soldador Punta Fina 80W - 100W',
    'cautin-soldador-punta-fina-80w-100w',
    'SOL-CAUTIN-PUNTA-FINA-80W-100W',
    'Cautín eléctrico tipo lápiz con mango de madera aislante, potencia de 80W - 100W y punta cónica fina de alta transferencia térmica para estaño y electrónica.',
    'Soldador eléctrico tipo lápiz (cautín) de alta potencia nominal (rango 80W - 100W a 110V/120V) diseñado para labores que requieren mayor temperatura y transferencia de calor sin pérdida de calor en la unión. Incorpora mango ergonómico torneado en madera natural que ofrece excelente aislamiento térmico contra el calor radiante, resistencia tubular niquelada de larga duración y punta fina maquinada para acceder a puntos de soldadura precisos en terminales eléctricos, transformadores, cables de calibre mediano y componentes electrónicos.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'potencia', '80W - 100W',
      'voltaje', '110V - 120V',
      'mango', 'Madera aislante',
      'punta', 'Fina cónica',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('cautin soldador punta fina 80w - 100w', 'cautin', 'soldador de estaño', 'punta fina', '80w', '100w', 'mango de madera', 'soldadura de estaño', 'soldadura'),
      'priority', 14
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
