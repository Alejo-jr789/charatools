-- =============================================================================
-- Migración 055: Productos de Llaves para Herramientas Manuales
-- =============================================================================
-- Archivo: docs/migrations/055_add_llaves_allen_torx_tolsen_herramientas_manuales.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-22
--
-- Productos agregados:
--   1. Juego de Llaves Combinadas Pulgadas - MM
--   2. Juego de Llaves Allen MM 1.5mm - 10mm
--   3. Juego de Llaves Torx Corto/Larga T10 - T50 Tolsen
--   4. Juego de Llaves de Dos Bocas MM 6x7 - 20x22 Tolsen (8 Pzas)
-- =============================================================================

BEGIN;

-- 1. Juego de Llaves Combinadas Pulgadas - MM
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
  'Juego de Llaves Combinadas Pulgadas - MM',
  'juego-de-llaves-combinadas-pulgadas-mm',
  'HM-LLAV-COMB-PULG-MM',
  'Juego de llaves combinadas (boca fija y corona de 12 puntas) forjadas en acero cromo vanadio, disponible en medidas métricas (MM) y en pulgadas con estuche organizador portátil.',
  'Set de llaves combinadas de alto rendimiento mecánico diseñadas para talleres automotrices, cuadrillas de mantenimiento e industria. Fabricadas en acero cromo vanadio (Cr-V) forjado y templado con acabado satinado anticorrosión. Cada llave cuenta con una boca abierta en un extremo inclinada a 15° para giros rápidos y una boca cerrada (corona) estriada de 12 puntas en el otro extremo para máxima distribución de torque sin redondear las aristas de tuercas o pernos. Incluye soporte plástico organizador de transporte con manija.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'juego',
    'stockStatus', 'available',
    'sistemasMedida', jsonb_build_array('Milimétrico (MM)', 'Pulgadas (SAE)'),
    'material', 'Acero Cromo Vanadio (Cr-V) forjado',
    'tipoBoca', 'Combinada (Boca fija 15° y Corona estriada de 12 puntas)',
    'acabado', 'Cromado satinado anticorrosivo',
    'organizador', 'Rack / soporte plástico portátil de alto impacto con manija',
    'aplicacion', 'Mecánica automotriz, mantenimiento industrial y ensamble',
    'tags', jsonb_build_array('juego de llaves combinadas pulgadas - mm', 'llaves combinadas', 'juego de llaves', 'llave boca fija', 'llave corona', 'pulgadas', 'milimetricas', 'cr-v', 'herramientas manuales', 'taller', 'mecanica')
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

-- 2. Juego de Llaves Allen MM 1.5mm - 10mm
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
  'Juego de Llaves Allen MM 1.5mm - 10mm',
  'juego-de-llaves-allen-mm-1-5mm-10mm',
  'HM-LLAV-ALLEN-1-5-10',
  'Juego de 9 llaves hexagonales (Allen) métricas de 1.5 mm a 10 mm en acero aleado con punta bola esférica y estuche compacto organizador.',
  'Juego de llaves hexagonales tipo Allen de caña larga fabricadas en acero cromo vanadio tratado térmicamente para alta tenacidad y resistencia a la torsión. Incorpora punta esférica (cabeza de bola) en el extremo largo que permite trabajar con una inclinación angular de hasta 25° para acceder a tornillos prisioneros o de difícil acceso, y extremo recto tradicional para aplicaciones de alto torque. Incluye estuche organizador abatible de plástico de ingeniería con marcas de calibre en bajo relieve.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'juego',
    'stockStatus', 'available',
    'contenido', '9 piezas',
    'medidas', jsonb_build_array('1.5 mm', '2.0 mm', '2.5 mm', '3.0 mm', '4.0 mm', '5.0 mm', '6.0 mm', '8.0 mm', '10.0 mm'),
    'tipoPunta', 'Punta esférica (Ball End) y hexagonal recta',
    'material', 'Acero Cromo Vanadio (Cr-V) templado',
    'acabado', 'Satinado / niquelado resistente a la corrosión',
    'estuche', 'Soporte plegable ergonómico con marcas numéricas',
    'aplicacion', 'Mecánica de precisión, ensamble de maquinaria, bicicletas y cerrajería',
    'tags', jsonb_build_array('juego de llaves allen mm 1.5mm - 10mm', 'llaves allen', 'juego allen', 'punta bola', 'hexagonal', '1.5mm a 10mm', 'cr-v', 'herramientas manuales', 'taller', 'mecanica')
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

-- 3. Juego de Llaves Torx Corto/Larga T10 - T50 Tolsen
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
  'Juego de Llaves Torx Corto/Larga T10 - T50 Tolsen',
  'juego-de-llaves-torx-corto-larga-t10-t50-tolsen',
  'HM-LLAV-TORX-T10-T50',
  'Juego de 9 llaves Torx estrella de alta resistencia de T10 a T50 en versiones corta y larga con soporte organizador Tolsen.',
  'Juego de llaves acodadas de perfil Torx (estrella de 6 puntas) marca Tolsen. Fabricadas en acero cromo vanadio (Cr-V) de grado industrial endurecido y templado para soportar torques elevados sin desgastar las estrías ni deformar los pernos de seguridad. Diseñadas para mantenimiento automotriz, electrodomésticos, maquinaria pesada y electrónica donde se requieren fijaciones Torx inviolables o de alta precisión. Incluye estuche organizador plástico bicolor de apertura rápida con marcas visibles para cada tamaño.',
  (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'juego',
    'stockStatus', 'available',
    'marca', 'Tolsen',
    'contenido', '9 piezas',
    'medidas', jsonb_build_array('T10', 'T15', 'T20', 'T25', 'T27', 'T30', 'T40', 'T45', 'T50'),
    'diseno', 'Disponible en formato corto y caña larga',
    'material', 'Acero Cromo Vanadio (Cr-V) de grado industrial',
    'acabado', 'Cromado satinado anticorrosivo',
    'estuche', 'Soporte plástico compacto Tolsen de alta resistencia',
    'aplicacion', 'Automotriz, motocicletas, maquinaria industrial, cerrajería y electrónica',
    'tags', jsonb_build_array('juego de llaves torx corto/larga t10 - t50', 'llaves torx', 'juego torx', 'tolsen', 't10 a t50', 'estrella', 'herramientas manuales', 'taller', 'automotriz')
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

-- 4. Juego de Llaves de Dos Bocas MM 6x7 - 20x22 Tolsen (8 Pzas)
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
  'Juego de Llaves de Dos Bocas MM 6x7 - 20x22 Tolsen (8 Pzas)',
  'juego-de-llaves-dos-bocas-mm-6x7-20x22-tolsen-8-pzas',
  'HM-LLAV-DOSBOCAS-TOLSEN-15891',
  'Set de 8 llaves de dos bocas abiertas métricas de 6x7 mm a 20x22 mm Tolsen Ref. 15891 en acero Cr-V forjado con estuche de lona enrollable para colgar.',
  'Juego profesional de 8 llaves de dos bocas (Double Open End Spanners) marca Tolsen Ref. 15891. Forjadas en acero cromo vanadio (Cr-V) de alta calidad con tratamiento térmico integral y acabado cromado mate satinado para máxima durabilidad y resistencia al óxido. Cada llave ofrece dos medidas milimétricas contiguas con cabezas inclinadas a 15° para facilitar el apriete en espacios confinados. Incluye funda / estuche de lona de alta resistencia con compartimentos individuales y orificios metálicos reforzados para colgar en panel de herramientas de taller o enrollar para transporte seguro.',
  (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'juego',
    'stockStatus', 'available',
    'marca', 'Tolsen',
    'referenciaFabricante', '15891',
    'contenido', '8 piezas',
    'medidas', jsonb_build_array('6x7 mm', '8x9 mm', '10x11 mm', '12x13 mm', '14x15 mm', '16x17 mm', '18x19 mm', '20x22 mm'),
    'tipoLlave', 'Dos bocas abiertas (Double Open End) inclinadas a 15°',
    'material', 'Acero Cromo Vanadio (Cr-V) forjado',
    'acabado', 'Cromado satinado mate anticorrosión',
    'estuche', 'Funda de lona reforzada enrollable con ojales para colgar',
    'aplicacion', 'Mecánica automotriz, montaje de tuberías, mantenimiento y taller industrial',
    'tags', jsonb_build_array('juego de llaves mm combinadas 6x7 - 20x22', 'juego de llaves dos bocas', 'llaves fijas', 'tolsen', '15891', '6x7 a 20x22', 'cr-v', 'herramientas manuales', 'taller', 'mecanica')
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
