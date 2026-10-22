-- =============================================================================
-- Migración 053: Productos para Línea Herramientas Manuales
-- =============================================================================
-- Archivo: docs/migrations/053_add_destornilladores_dados_llaves_alicate_herramientas_manuales.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-22
--
-- Productos agregados:
--   1. Juego de Destornilladores 2pzas - 6pzas - 8pzas - 10pzas
--   2. Juego de Dados con Rachet 12pzas - 14pzas 1/4 - 3/8 - 1/2
--   3. Llaves Ajustables 6" - 8" - 10" - 12"
--   4. Alicate de Presión 10"
-- =============================================================================

BEGIN;

-- 1. Juego de Destornilladores 2pzas - 6pzas - 8pzas - 10pzas
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
  'Juego de Destornilladores 2pzas - 6pzas - 8pzas - 10pzas',
  'juego-de-destornilladores-2pzas-6pzas-8pzas-10pzas',
  'HM-DEST-SET',
  'Set de destornilladores planos (pala) y de estría (Phillips) con mango ergonómico de alto agarre, disponible en presentaciones de 2, 6, 8 y 10 piezas para taller y electricidad.',
  'Juego de destornilladores profesionales para mantenimiento eléctrico, automotriz y ensambles mecánicos. Fabricados con varillas de acero cromo vanadio tratadas térmicamente para evitar desgaste en las puntas y deformación bajo torsión. Mangos ergonómicos fabricados en polímero de alta resistencia dieléctrica y química, con diseño antideslizante que optimiza la transferencia de fuerza y reduce la fatiga del operario. Puntas magnetizadas para un manejo seguro y preciso de la tornillería en áreas reducidas.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'set',
    'stockStatus', 'available',
    'presentaciones', jsonb_build_array('2 piezas', '6 piezas', '8 piezas', '10 piezas'),
    'materialVarilla', 'Acero Cromo Vanadio (Cr-V)',
    'tipoPunta', 'Pala (Plano) y Estría (Phillips)',
    'acabadoPunta', 'Puntas magnetizadas de alta precisión',
    'mango', 'Polímero ergonómico de alto impacto antideslizante',
    'aplicacion', 'Mecánica general, electricidad, mantenimiento industrial y hogar',
    'tags', jsonb_build_array('juego de destornilladores 2pzas - 6pzas - 8pzas - 10pzas', 'destornilladores', 'juego de destornilladores', 'destornillador pala', 'destornillador estria', 'phillips', 'herramientas de mano', 'herramientas manuales', 'taller', 'cr-v')
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

-- 2. Juego de Dados con Rachet 12pzas - 14pzas 1/4 - 3/8 - 1/2
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
  'Juego de Dados con Rachet 12pzas - 14pzas 1/4 - 3/8 - 1/2',
  'juego-de-dados-con-rachet-12pzas-14pzas-1-4-3-8-1-2',
  'HM-DADOS-RACHET',
  'Set de dados hexagonales con llave de carraca (rachet) reversible de liberación rápida. Presentaciones de 12 y 14 piezas en cuadrantes de 1/4", 3/8" y 1/2".',
  'Kit de dados mecánicos y rachet reversible de alta precisión diseñado para talleres mecánicos, líneas de ensamblaje y mantenimiento industrial. Fabricados en acero cromo vanadio forjado en frío con tratamiento anticorrosivo en cromo pulido. La llave rachet cuenta con mecanismo de dientes de precisión para operar en ángulos cerrados, botón de desacople rápido (quick release) y selector de giro reversible. Incluye riel/organizador de transporte compacto de alto impacto.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'set',
    'stockStatus', 'available',
    'presentaciones', jsonb_build_array('12 piezas', '14 piezas'),
    'cuadrantesDisponibles', jsonb_build_array('1/4 pulgada', '3/8 pulgada', '1/2 pulgada'),
    'material', 'Acero Cromo Vanadio (Cr-V) forjado',
    'mecanismoRachet', 'Carraca reversible con botón de liberación rápida',
    'tipoDado', 'Hexagonal de 6 puntas con grabado milimétrico / en pulgadas',
    'acabado', 'Cromo pulido espejo anticorrosión',
    'incluye', 'Llave rachet reversible, extensión y organizador plástico',
    'tags', jsonb_build_array('juego de dados con rachet 12pzas - 14pzas 1/4 - 3/8 - 1/2', 'juego de dados', 'dados con rachet', 'rachet', 'carraca', 'dados 1/4', 'dados 3/8', 'dados 1/2', 'herramientas manuales', 'mecanica', 'taller')
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

-- 3. Llaves Ajustables 6" - 8" - 10" - 12"
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
  'Llaves Ajustables 6" - 8" - 10" - 12"',
  'llaves-ajustables-6-8-10-12-pulgadas',
  'HM-LLAV-AJUST',
  'Llave ajustable inglesa (perico / expansiva) de alta resistencia en medidas de 6", 8", 10" y 12", forjada en acero de alta tenacidad con escala milimétrica grabada.',
  'Llave ajustable tipo perico o expansiva indispensable para plomería, mantenimiento mecánico, tuberías e instalaciones industriales. Mecanismo de tornillo sinfín de ajuste suave y precisión que asegura mordazas firmes sin desajuste involuntario bajo carga. Fabricada en acero al carbono forjado y tratado térmicamente con protección anticorrosiva. Quijada moleteada con escala de apertura grabada con láser para rápida calibración de tuercas y pernos.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'medidasDisponibles', jsonb_build_array('6 pulgadas (150 mm)', '8 pulgadas (200 mm)', '10 pulgadas (250 mm)', '12 pulgadas (300 mm)'),
    'material', 'Acero al carbono forjado / Aleación templada',
    'mecanismo', 'Tornillo sinfín de ajuste milimétrico suave',
    'escala', 'Calibración métrica grabada con láser en la quijada',
    'acabado', 'Cromado satinado resistente al óxido y corrosión',
    'aplicaciones', 'Plomería, apriete de conexiones, tuberías, mecánica y cerrajería',
    'tags', jsonb_build_array('llaves ajustables 6"- 8"- 10"- 12"', 'llave ajustable', 'llave francesa', 'perico', 'llave expansiva', '6 pulgadas', '8 pulgadas', '10 pulgadas', '12 pulgadas', 'herramientas manuales', 'plomeria', 'mecanica')
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

-- 4. Alicate de Presión 10"
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
  'Alicate de Presión 10"',
  'alicate-de-presion-10-pulgadas',
  'HM-ALIC-PRES-10',
  'Alicate de presión curvo de 10 pulgadas (250 mm) con mordazas templadas, tornillo de ajuste micrométrico y palanca de liberación rápida para sujeción de alta fuerza.',
  'Alicate de presión tipo mordaza curva de 10 pulgadas diseñado para sujeción extrapesada, torsión de piezas atascadas, fijación para soldadura y corte de alambre integrado. Fabricado en acero forjado con dientes endurecidos por inducción que garantizan agarre sin deslizamiento sobre tuberías, pernos desgastados y superficies curvas o planas. Incluye tornillo de regulación en el extremo del mango para calibrar la presión de apriete exacta y gatillo de liberación rápida ergonómico.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'tamano', '10 pulgadas (250 mm)',
    'tipoMordaza', 'Curva con ranura de agarre y cortaalambre incorporado',
    'material', 'Cuerpo de acero laminado de alta resistencia con mordazas forjadas',
    'mecanismo', 'Bloqueo con resorte de alta tensión y tornillo de regulación micrométrica',
    'palanca', 'Gatillo de destrabe / liberación rápida protegido',
    'aplicacion', 'Herrería, soldadura, mecánica pesada, cerrajería y sujeción de pernos',
    'tags', jsonb_build_array('alicate de presión 10"', 'alicate de presion', 'mordaza de presion', 'alicate perro', 'locking pliers', '10 pulgadas', '250 mm', 'herramientas manuales', 'herrería', 'soldadura', 'mecanica')
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
