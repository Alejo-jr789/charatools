-- =============================================================================
-- Migración 043: Herramientas Eléctricas Lote 2 (Tronzadora, Pistolas, Lijadoras)
-- =============================================================================
-- Archivo: docs/migrations/043_add_tronzadora_pistolas_lijadoras_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-12
-- =============================================================================

BEGIN;

-- 1. Asegurar Marcas Ronix y Daewoo
INSERT INTO public.brands (name, slug)
VALUES
  ('Ronix', 'ronix'),
  ('Daewoo', 'daewoo')
ON CONFLICT (slug) DO NOTHING;

-- 2. Inserción de Productos
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
  -- 1. Tronzadora de Metal 14" INGCO
  (
    'Tronzadora de Metal 14" INGCO',
    'tronzadora-metal-14-ingco',
    'HER-TRONZADORA-INGCO-14',
    'Tronzadora eléctrica industrial de 14" (355 mm) con motor de 2400W para corte rápido y preciso de perfiles metálicos, tubos y cabillas.',
    'Tronzadora industrial para metales INGCO de 14 pulgadas (355 mm). Equipada con potente motor de 2400W para trabajo pesado continuo en talleres metalúrgicos y obras de construcción. Incluye prensa de fijación rápida con mordaza inclinable hasta 45° para cortes en inglete, deflector de chispas ajustable, empuñadura ergonómica tipo ''D'' y botón de bloqueo de eje para cambio fácil del disco abrasivo.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('tronzadora', 'cortadora de metal', 'ingco', 'disco 14', 'corte de acero', 'herrería', 'herramientas eléctricas', 'alambrico'),
      'priority', 6
    )
  ),

  -- 2. Pistola para Pintar Alámbrica WADFOW
  (
    'Pistola para Pintar Alámbrica WADFOW',
    'pistola-para-pintar-alambrica-wadfow',
    'HER-PISTOLA-PINTAR-WADFOW',
    'Pistola de pulverización eléctrica alámbrica WADFOW con depósito graduado de 800 ml para aplicación uniforme de pinturas, esmaltes y barnices.',
    'Pistola eléctrica para pintar alámbrica WADFOW de alta eficiencia y cobertura homogénea. Diseñada con boquilla ajustable de 3 patrones de rociado (vertical, horizontal y circular), perilla reguladora de flujo de pintura y depósito desmontable con escala de medición de 800 ml. Ideal para pintar rejas, paredes, muebles de madera, cercas y acabados automotrices ligeros sin necesidad de compresor de aire externo.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'wadfow' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('pistola para pintar', 'pulverizador', 'wadfow', 'pintura', 'esmalte', 'barniz', 'acabados', 'herramientas eléctricas', 'alambrico'),
      'priority', 7
    )
  ),

  -- 3. Lijadora Orbital Alámbrica Ronix
  (
    'Lijadora Orbital Alámbrica Ronix',
    'lijadora-orbital-alambrica-ronix',
    'HER-LIJADORA-ORBITAL-RONIX',
    'Lijadora orbital eléctrica alámbrica Ronix con base rectangular de sujeción rápida para acabado fino y desbaste en madera y masilla.',
    'Lijadora orbital alámbrica profesional Ronix con diseño ergonómico de perfil bajo y agarre acolchado antideslizante para minimizar la fatiga durante sesiones prolongadas. Cuenta con motor de altas revoluciones que produce oscilaciones ultra finas para acabados libres de marcas, sistema de presillas metálicas para fijación rápida de pliegos de lija estándar y puerto extractor de polvo para mantener el área de trabajo limpia.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ronix' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('lijadora', 'lijadora orbital', 'ronix', 'madera', 'carpintería', 'acabado fino', 'masilla', 'herramientas eléctricas', 'alambrico'),
      'priority', 8
    )
  ),

  -- 4. Lijadora de Banda Alámbrica Tolsen
  (
    'Lijadora de Banda Alámbrica Tolsen',
    'lijadora-de-banda-alambrica-tolsen',
    'HER-LIJADORA-BANDA-TOLSEN-79568',
    'Lijadora de banda industrial Tolsen de alto desbaste con perilla de centrado automático y empuñadura auxiliar para madera y metales.',
    'Lijadora de banda eléctrica alámbrica TOLSEN serie Industrial FX Force Speed (modelo 79568). Diseñada para lijado rápido, desbaste pesado y nivelación de grandes superficies en madera maciza, pisos, tableros y piezas metálicas. Cuenta con perilla micrométrica para alineación precisa de la banda, sistema de tensión y liberación rápida de cambio de lija, empuñadura frontal envolvente para máximo control y conector para bolsa recolectora de virutas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('lijadora', 'lijadora de banda', 'tolsen', 'desbaste pesado', 'madera', 'carpintería', 'herramientas eléctricas', 'alambrico'),
      'priority', 9
    )
  ),

  -- 5. Pistola de Calor Alámbrica Daewoo
  (
    'Pistola de Calor Alámbrica Daewoo',
    'pistola-de-calor-alambrica-daewoo',
    'HER-PISTOLA-CALOR-DAEWOO',
    'Pistola de calor industrial alámbrica Daewoo con doble nivel de temperatura y flujo de aire para decapado, retráctil térmico y moldeado.',
    'Pistola de calor eléctrica alámbrica Daewoo Power Products para aplicaciones técnicas y térmicas industriales. Equipada con selector de doble nivel de temperatura y flujo de aire caliente, soporte trasero integrado para colocación vertical manos libres y empuñadura ergonómica con protector para nudillos. Indispensable para termocontracción de cables y tuberías, remoción de pinturas y barnices viejos, desoldadura, moldeado de plásticos y secado rápido.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'daewoo' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('pistola de calor', 'decapador térmico', 'daewoo', 'termoencogible', 'pintura', 'moldeado', 'herramientas eléctricas', 'alambrico'),
      'priority', 10
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
  specs = EXCLUDED.specs,
  updated_at = now();

COMMIT;
