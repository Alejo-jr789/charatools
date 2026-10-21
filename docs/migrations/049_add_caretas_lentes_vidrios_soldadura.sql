-- =============================================================================
-- Migración 049: Productos de Línea Soldadura Lote 3 (Caretas, Lentes y Vidrios)
-- =============================================================================
-- Archivo: docs/migrations/049_add_caretas_lentes_vidrios_soldadura.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-21
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
  -- 1. Caretas para Soldar Automática Profesional
  (
    'Careta para Soldar Automática Profesional',
    'careta-para-soldar-automatica-profesional',
    'SOL-CARETA-AUTOMATICA-PRO',
    'Careta de soldar electrónica fotosensible profesional con oscurecimiento automático ultrarrápido (DIN 9-13), celda solar y batería de litio.',
    'Máscara para soldar con filtro de oscurecimiento automático de alta definición para procesos MMA, MIG/MAG y TIG. Equipada con sensores de arco de respuesta ultrarrápida (1/25.000s), perilla externa para regulación de sombra DIN 9 a 13, perilla de sensibilidad y retardo, y función ''Grind'' (esmerilado). Fabricada en poliamida de alta resistencia térmica y al impacto con arnés ergonómico regulable y banda antisudor para máxima comodidad durante jornadas prolongadas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'tipo', 'Fotosensible Automática',
      'sombra', 'DIN 9-13 (Ajustable)',
      'alimentacion', 'Celdas Solares + Batería Li',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('caretas para soldar automatica profesional', 'careta automatica', 'careta fotosensible', 'máscara de soldar', 'din 9-13', 'solar', 'soldadura', 'proteccion visual', 'epp'),
      'priority', 8
    )
  ),

  -- 2. Careta para Soldar Sencilla
  (
    'Careta para Soldar Sencilla',
    'careta-para-soldar-sencilla',
    'SOL-CARETA-SENCILLA-FLIP',
    'Careta clásica tipo abatible (Flip-Front) para soldador fabricada en polipropileno termorresistente con visor basculante de 2" x 4-1/4" y arnés tipo trinquete.',
    'Careta tradicional de soldadura con visor abatible (flip-front) que permite inspeccionar la pieza y escoria sin necesidad de retirarse el casco protector. Elaborada en polipropileno de alto impacto y retardante de llama, resistente a chispas y radiación ultravioleta/infrarroja. Incluye arnés tipo cremallera/trinquete ajustable y marco porta-cristal estándar compatible con vidrios inactínicos y policarbonatos transparentes de 2" x 4-1/4".',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'tipo', 'Abatible (Flip-Front)',
      'medidaVisor', '2" x 4-1/4"',
      'material', 'Polipropileno Termorresistente',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('careta para soldar sencilla', 'careta abatible', 'careta tradicional', 'flip-front', 'máscara de soldar', 'soldadura', 'proteccion visual'),
      'priority', 9
    )
  ),

  -- 3. Lentes para Soldar Fotosensible
  (
    'Lentes para Soldar Fotosensible',
    'lentes-para-soldar-fotosensible',
    'SOL-LENTES-FOTOSENSIBLE',
    'Gafas de soldadura electrónicas compactas con filtro fotosensible automático, carga solar y banda elástica ajustable para espacios reducidos.',
    'Gafas panorámicas de seguridad para soldadura con sistema de oscurecimiento automático ultraligero y compacto. Diseñadas para trabajos en lugares de difícil acceso, tuberías, mantenimiento automotriz y herrería ligera donde una careta convencional resulta voluminosa. Cuentan con celda solar de auto-recarga, sensores ópticos de arco, protección UV/IR permanente y cinta elástica ajustable para un sellado cómodo y hermético al rostro.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'tipo', 'Gafas Fotosensibles Automáticas',
      'alimentacion', 'Celda Solar',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('lentes para soldar fotosensible', 'gafas de soldar', 'lentes fotosensibles', 'gafas automaticas', 'soldadura', 'espacios reducidos', 'proteccion visual'),
      'priority', 10
    )
  ),

  -- 4. Vidrios para Careta de Soldar Nº 10 - 11 - 12
  (
    'Vidrios para Careta de Soldar Nº 10 - 11 - 12',
    'vidrios-para-careta-de-soldar-10-11-12',
    'SOL-VIDRIOS-CARETA-10-11-12',
    'Lentes y cristales inactínicos de repuesto para caretas de soldadura estándar (2" x 4-1/4") disponibles en gradientes de sombra DIN 10, 11 y 12.',
    'Filtros ópticos de vidrio inactínico oscuro de alta pureza para caretas y gafas de soldadura por arco. Medida universal estándar de 2" x 4-1/4" (50 mm x 108 mm) compatibles con la gran mayoría de cascos del mercado. Diseñados para bloquear el 99.9% de radiación infrarroja y ultravioleta protegiendo la vista del operario contra el deslumbramiento y queratitis actínica. Disponibles en las graduaciones de sombra más comunes para soldadura por electrodo revestido y MIG: DIN 10 (trabajos ligeros/medianos), DIN 11 (uso general de taller) y DIN 12 (amperajes medios-altos).',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'medida', '2" x 4-1/4" (50 x 108 mm)',
      'sombrasDisponibles', 'DIN 10 / DIN 11 / DIN 12',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('vidrios para careta de soldar nº 10 - 11 - 12', 'vidrios inactinicos', 'cristal oscuro', 'repuesto careta', 'sombra 10', 'sombra 11', 'sombra 12', 'soldadura'),
      'priority', 11
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
