-- =============================================================================
-- Migración 045: Herramientas Eléctricas Lote 4 (Llave de Impacto, Hidrolavadoras)
-- =============================================================================
-- Archivo: docs/migrations/045_add_llave_impacto_hidrolavadoras_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-12
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
  -- 1. Llave de Impacto Inalámbrica 20V INGCO
  (
    'Llave de Impacto Inalámbrica 20V INGCO',
    'llave-de-impacto-inalambrica-20v-ingco',
    'HER-LLAVE-IMPACTO-20V-INGCO',
    'Llave de impacto inalámbrica 20V plataforma P20S INGCO con alto torque de apriete, encastre cuadrado de 1/2" y luz LED de trabajo.',
    'Llave de impacto a batería de 20V INGCO diseñada para tareas mecánicas automotrices, montaje de estructuras metálicas y mantenimiento industrial. Ofrece un elevado torque de torsión para aflojar y apretar pernos y tuercas oxidadas o de alta resistencia sin esfuerzo para el usuario. Cuenta con encastre cuadrado estándar de 1/2 pulgada, gatillo de velocidad variable reversible con freno electrónico instantáneo, empuñadura ergonómica antideslizante y luz LED focalizada para iluminar el punto de trabajo.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'voltageVolts', 20,
      'tags', jsonb_build_array('llave de impacto', 'inalámbrico', '20v', 'p20s', 'ingco', 'mecánica', 'tuercas', 'pernos', 'automotriz', 'herramientas eléctricas', 'inalambrico'),
      'priority', 16
    )
  ),

  -- 2. Hidrolavadora con Motor de Inducción 1500W 100 Bar INGCO
  (
    'Hidrolavadora con Motor de Inducción 1500W 100 Bar INGCO',
    'hidrolavadora-motor-induccion-1500w-ingco',
    'HER-HIDROLAVADORA-IND-1500W-INGCO',
    'Hidrolavadora industrial compacta INGCO con motor de inducción silencioso de 1500W, presión de 100 Bar y caudal de 6.7 L/min para lavado continuo.',
    'Hidrolavadora de alta presión INGCO equipada con motor de inducción electromagnético de 1500W de larga vida útil y funcionamiento silencioso sin escobillas. Entrega una presión máxima de 100 Bar con un caudal de agua de 6.7 litros por minuto, ideal para lavado de flotas vehiculares, fachadas, patios, maquinaria industrial y talleres. Incluye pistola de alta presión con boquilla regulable, manguera reforzada, filtro de entrada de agua, acoples rápidos y depósito dosificador de jabón/espuma.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'kit',
      'stockStatus', 'available',
      'powerWatts', 1500,
      'tags', jsonb_build_array('hidrolavadora', 'motor de inducción', '1500w', '100 bar', 'ingco', 'lavado a presión', 'alta presión', 'autolavado', 'herramientas eléctricas'),
      'priority', 17
    )
  ),

  -- 3. Hidrolavadora Eléctrica de Alta Presión INGCO
  (
    'Hidrolavadora Eléctrica de Alta Presión INGCO',
    'hidrolavadora-electrica-alta-presion-ingco',
    'HER-HIDROLAVADORA-ALTA-PRES-INGCO',
    'Hidrolavadora vertical con ruedas de transporte INGCO, sistema de parada automática (Auto-Stop) y depósito de espuma. Disponible en 1200W, 1400W y 2000W.',
    'Hidrolavadora de diseño vertical ergonómico INGCO para limpieza profunda en exteriores, vehículos, pisos de concreto, tejados y áreas comerciales. Equipada con ruedas de alto tránsito, manillar integrado de transporte, carrete/soporte para manguera y cable, y sistema Auto-Stop que apaga automáticamente la bomba al soltar el gatillo para prolongar la vida útil del motor y ahorrar energía. Incluye lanza de chorro ajustable, botella dispensadora de detergente y manguera de alta presión.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'kit',
      'stockStatus', 'available',
      'variantLabel', 'Potencia',
      'variants', jsonb_build_array(
        jsonb_build_object('value', '1200W'),
        jsonb_build_object('value', '1400W'),
        jsonb_build_object('value', '2000W')
      ),
      'tags', jsonb_build_array('hidrolavadora', 'alta presión', 'ingco', '1200w', '1400w', '2000w', 'auto stop', 'limpieza', 'herramientas eléctricas'),
      'priority', 18
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
