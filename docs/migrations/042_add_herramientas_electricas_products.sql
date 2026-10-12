-- =============================================================================
-- Migración 042: Productos de Herramientas Eléctricas (Tolsen, INGCO, WADFOW)
-- =============================================================================
-- Archivo: docs/migrations/042_add_herramientas_electricas_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-12
-- =============================================================================

BEGIN;

-- 1. Asegurar Marcas Tolsen y Wadfow
INSERT INTO public.brands (name, slug)
VALUES
  ('Tolsen', 'tolsen'),
  ('Wadfow', 'wadfow')
ON CONFLICT (slug) DO NOTHING;

-- 2. Asegurar que las categorías de herramientas sean raíz (depth 0)
UPDATE public.categories
SET slug = 'herramientas-electricas',
    depth = 0,
    parent_id = NULL
WHERE id = 'cba1982a-61a2-4eb6-b5e3-ccc0bbd2bd41';

UPDATE public.categories
SET slug = 'herramientas-manuales',
    depth = 0,
    parent_id = NULL
WHERE id = 'dc281a82-66df-4f6b-ad0b-c2e5cf3943ce';

UPDATE public.categories
SET is_active = false
WHERE id = '648acbfa-53df-498c-9541-567317592215';

-- 3. Inserción de Productos de Herramientas Eléctricas
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
  -- 1. Esmeril Angular Alámbrico 4" - 9" Tolsen
  (
    'Esmeril Angular Alámbrico 4" - 9" Tolsen',
    'esmeril-angular-alambrico-tolsen',
    'HER-ESM-TOLSEN-79720',
    'Esmeril angular alámbrico industrial Tolsen de alto rendimiento para corte y desbaste. Disponible en medidas de 4" a 9".',
    'Esmeril angular alámbrico industrial TOLSEN diseñado para exigentes labores de corte, desbaste, lijado y pulido en perfiles metálicos, soldadura, piedra y mampostería. Motor de alta potencia con bobinado de cobre, cabezal de engranajes de aluminio fundido, empuñadura auxiliar ergonómica de 2 posiciones y guarda protectora ajustable. Diseñado para ofrecer máxima durabilidad y seguridad en entornos de taller y construcción civil.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'variantLabel', 'Medida',
      'variants', jsonb_build_array(
        jsonb_build_object('value', '4"'),
        jsonb_build_object('value', '4½"'),
        jsonb_build_object('value', '7"'),
        jsonb_build_object('value', '9"')
      ),
      'tags', jsonb_build_array('esmeril', 'esmeril angular', 'amoladora', 'tolsen', 'corte', 'desbaste', 'herramientas eléctricas', 'alambrico'),
      'priority', 1
    )
  ),

  -- 2. Taladro Percutor Alámbrico 3/8" - 1/2" Tolsen
  (
    'Taladro Percutor Alámbrico 3/8" - 1/2" Tolsen',
    'taladro-percutor-alambrico-tolsen',
    'HER-TAL-TOLSEN-PERC',
    'Taladro percutor alámbrico Tolsen de alto torque con doble modo de rotación y percusión. Mandril disponible en 3/8" y 1/2".',
    'Taladro percutor eléctrico alámbrico TOLSEN de grado profesional, diseñado para trabajos continuos de perforación y atornillado de alta exigencia. Cuenta con selector de doble modo (rotación estándar y rotopercusión), gatillo con velocidad variable reversible, tope de profundidad milimétrico y mango auxiliar antideslizante ajustable a 360°. Ideal para perforaciones precisas en concreto, mampostería, madera y perfiles metálicos.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'variantLabel', 'Mandril',
      'variants', jsonb_build_array(
        jsonb_build_object('value', '3/8"'),
        jsonb_build_object('value', '1/2"')
      ),
      'tags', jsonb_build_array('taladro', 'taladro percutor', 'tolsen', 'mandril', 'perforación', 'concreto', 'herramientas eléctricas', 'alambrico'),
      'priority', 2
    )
  ),

  -- 3. Sierra Caladora Alámbrica INGCO
  (
    'Sierra Caladora Alámbrica INGCO',
    'sierra-caladora-alambrica-ingco',
    'HER-CALADORA-INGCO',
    'Sierra caladora pendular alámbrica INGCO de alta precisión con base inclinable a 45° para cortes en madera, plástico y metales.',
    'Sierra caladora eléctrica alámbrica INGCO con sistema de acción pendular de múltiples posiciones para optimizar la velocidad y calidad del corte según el material. Incorpora base metálica inclinable hasta 45° para biselados exactos, guía de corte lateral, mango ergonómico recubierto en goma para mayor control y sistema de cambio rápido de segueta. Diseñada para carpintería, herrería ligera, instalaciones y corte de paneles decorativos.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('sierra', 'sierra caladora', 'caladora', 'ingco', 'corte de madera', 'carpintería', 'herramientas eléctricas', 'alambrico'),
      'priority', 3
    )
  ),

  -- 4. Rotomartillo Alámbrico SDS Plus WADFOW
  (
    'Rotomartillo Alámbrico SDS Plus WADFOW',
    'rotomartillo-alambrico-sds-plus-wadfow',
    'HER-ROTOMARTILLO-WADFOW',
    'Rotomartillo industrial alámbrico WADFOW con encastre SDS Plus y maletín rígido para perforación pesada y cincelado.',
    'Rotomartillo profesional alámbrico WADFOW de alta potencia y rendimiento mecánico superior. Equipado con encastre SDS Plus de fijación rápida, selector multifunción (taladro, rotopercusión y cincelado libre/bloqueado) y robusta caja de engranajes metálica. Incluye maletín de transporte rígido de alto impacto, empuñadura auxiliar antivibración y barra de tope de profundidad. Ideal para labores pesadas de anclaje, perforación estructural y demolición ligera en concreto y mampostería.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'wadfow' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('rotomartillo', 'sds plus', 'wadfow', 'perforación', 'cincelado', 'demolición', 'concreto', 'herramientas eléctricas', 'alambrico'),
      'priority', 4
    )
  ),

  -- 5. Sierra Circular Alámbrica 7-1/4" con Láser Tolsen
  (
    'Sierra Circular Alámbrica 7-1/4" con Láser Tolsen',
    'sierra-circular-alambrica-tolsen',
    'HER-CIRCULAR-TOLSEN-79731',
    'Sierra circular industrial alámbrica Tolsen de 7-1/4" con guía láser integrada para cortes rectos y biselados exactos en madera.',
    'Sierra circular alámbrica profesional TOLSEN serie Industrial FX Force Speed (modelo 79731). Cuenta con potente motor para discos de 7-1/4 pulgadas (185 mm), puntero láser integrado que proyecta la línea de corte para máxima exactitud, base de acero reforzada regulable en profundidad y ángulo de bisel hasta 45°. Equipada con protector de disco retráctil de aluminio fundido, puerto de extracción de virutas y empuñadura suave ergonómica para jornadas de trabajo prolongadas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('sierra circular', 'sierra', 'tolsen', 'láser', 'madera', 'corte recto', 'disco 7 1/4', 'herramientas eléctricas', 'alambrico'),
      'priority', 5
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
