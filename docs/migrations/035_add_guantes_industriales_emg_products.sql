-- =============================================================================
-- Migración 035: Guantes Industriales Adicionales EMG (Seguridad Industrial)
-- =============================================================================
-- Archivo: docs/migrations/035_add_guantes_industriales_emg_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-08
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
  -- 1. Guantes de Nitrilo Negro ProGloves (Caja 100 Und)
  (
    'Guantes de Nitrilo Negro ProGloves (Caja 100 Und)',
    'guantes-nitrilo-negro-progloves-caja-100',
    'SEG-GUANTES-NITRILO-N-100',
    'Caja de 100 guantes de nitrilo negro descartables ProGloves Serie Pro, sin talco y texturizados.',
    'Caja dispensadora de 100 guantes de nitrilo negro desechables ProGloves Serie Pro marca EMG. Diseñados para máxima protección biológica, química y mecánica ligera. Libres de polvo (sin talco) y látex para evitar alergias, con acabado texturizado en dedos para un agarre firme. Aprobados para uso clínico, gastronómico, estético, automotriz y manejo de sustancias químicas ligeras.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'caja',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'guantes de nitrilo', 'nitrilo negro', 'progloves', 'serie pro', 'descartables', 'sin polvo', 'emg', 'epp', 'seguridad industrial'),
      'priority', 4
    )
  ),

  -- 2. Guantes KleenGuard con Recubrimiento de Látex
  (
    'Guantes KleenGuard con Recubrimiento de Látex',
    'guantes-kleenguard-recubrimiento-latex',
    'SEG-GUANTES-KLEENGUARD',
    'Guantes de trabajo KleenGuard con soporte textil de punto y palma rugosa recubierta en látex azul antideslizante.',
    'Guantes industriales multipropósito tipo KleenGuard marca EMG. Fabricados con tejido de punto de poliéster y algodón sin costuras en color gris, con recubrimiento de látex natural azul corrugado en la palma y yemas de los dedos. Ofrecen excelente resistencia a la abrasión, gran flexibilidad, transpirabilidad y adherencia superior tanto en seco como en superficies húmedas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'kleenguard', 'guantes de latex', 'palma rugosa', 'antideslizante', 'emg', 'epp', 'seguridad industrial'),
      'priority', 5
    )
  ),

  -- 3. Guantes Mecánico Premium de Nitrilo
  (
    'Guantes Mecánico Premium de Nitrilo',
    'guantes-mecanico-premium-nitrilo',
    'SEG-GUANTES-MECANICO-PREM',
    'Guantes ergonómicos para mecánico con soporte de nylon azul y palma recubierta de nitrilo negro de alto agarre.',
    'Guantes profesionales para mecánico y mantenimiento industrial modelo Premium marca EMG. Tejido elástico transpirable de alta densidad en color azul con recubrimiento de nitrilo microespumado negro en palma y dedos. Proporcionan excepcional sensibilidad táctil, destreza y resistencia frente a aceites, grasas y abrasión mecánica moderada.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'mecanico premium', 'guantes para mecanico', 'nitrilo', 'aceite y grasa', 'precision', 'emg', 'epp', 'seguridad industrial'),
      'priority', 6
    )
  ),

  -- 4. Guantes de Tejido con Puntos de PVC
  (
    'Guantes de Tejido con Puntos de PVC',
    'guantes-tejido-puntos-pvc',
    'SEG-GUANTES-PUNTOS-PVC',
    'Guantes de algodón y poliéster blanco con motas antideslizantes de PVC negro en la palma.',
    'Guantes ligeros de punto continuo de algodón y poliéster con acabado punteado de PVC (tipo mota) en la palma y dedos marca EMG. Diseñados para brindar un agarre firme y seguro en manipulación de cajas, herramientas, vidrios, láminas y mercancía general, previniendo deslizamientos sin restar comodidad ni ventilación a las manos.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'puntos de pvc', 'guantes mota', 'tejido de punto', 'antideslizante', 'emg', 'epp', 'seguridad industrial'),
      'priority', 7
    )
  ),

  -- 5. Guantes de Carnaza y Tela Reforzado en Palma (101R)
  (
    'Guantes de Carnaza y Tela Reforzado en Palma (101R)',
    'guantes-carnaza-tela-reforzado-palma-101r',
    'SEG-GUANTES-CARNAZA-TELA-101R',
    'Guantes tipo chófer/ingeniero en carnaza gris de alta densidad y tela reforzada con palma doble 101R.',
    'Guantes de seguridad industrial para trabajo pesado modelo 101R marca EMG. Elaborados con carnaza de cuero vacuno de alta resistencia en palma, dedos y nudillos, combinada con tela de lona drill reforzada en el dorso y puño de seguridad engomado. Cuentan con refuerzo adicional de carnaza en la palma para resistir abrasión extrema, rozamiento, cargas pesadas y manipulación de perfiles metálicos y materiales de construcción.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'carnaza', 'carnaza y tela', 'reforzado en palma', '101r', 'trabajo pesado', 'construccion', 'emg', 'epp', 'seguridad industrial'),
      'priority', 8
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
