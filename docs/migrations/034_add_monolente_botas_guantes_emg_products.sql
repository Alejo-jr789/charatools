-- =============================================================================
-- Migración 034: Monolente, Botas PVC y Guantes Industriales EMG (Seguridad Industrial)
-- =============================================================================
-- Archivo: docs/migrations/034_add_monolente_botas_guantes_emg_products.sql
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
  -- 1. Monolente Especial Serie Pro
  (
    'Monolente Especial Serie Pro',
    'monolente-especial-serie-pro',
    'SEG-MONOLENTE-ESP-PRO',
    'Gafas de seguridad panorámicas Serie Pro con marco acolchado, banda elástica y tratamiento antiempañante.',
    'Monolente de seguridad panorámica de alto rendimiento Serie Pro marca EMG. Diseñado para ofrecer máxima hermeticidad y protección contra salpicaduras químicas, polvos finos y esquirlas de impacto. Posee estructura anatómica con junta suave de sellado facial, banda elástica ajustable de alta tensión y lente de policarbonato con tratamiento antiempañante y antirrayaduras.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'lentes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'lentes',
      'subitem', 'lentes',
      'tags', jsonb_build_array('monolente', 'gafas de seguridad', 'serie pro', 'emg', 'antiempanante', 'proteccion visual', 'epp', 'seguridad industrial'),
      'priority', 7
    )
  ),

  -- 2. Botas de PVC sin Puntera
  (
    'Botas de PVC sin Puntera',
    'botas-de-pvc-sin-puntera',
    'SEG-BOTAS-PVC-SIN-PUNT',
    'Botas de caña alta fabricadas en PVC impermeable sin puntera metálica para trabajo pesado y agroindustria.',
    'Botas industriales de caña alta moldeadas en policloruro de vinilo (PVC) de primera calidad, 100% impermeables y resistentes a grasas, agua, barro y derivados químicos comunes. Suela antideslizante con diseño de autolimpieza que brinda óptima tracción en superficies húmedas o resbaladizas. Modelo sin puntera metálica para mayor ligereza y comodidad durante largas jornadas laborales.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'calzado' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'calzado',
      'subitem', 'calzado',
      'variantLabel', 'Color',
      'variants', jsonb_build_array(
        jsonb_build_object('value', 'Negro'),
        jsonb_build_object('value', 'Blanco'),
        jsonb_build_object('value', 'Beige')
      ),
      'tags', jsonb_build_array('botas', 'botas de pvc', 'sin puntera', 'calzado industrial', 'impermeable', 'emg', 'epp', 'seguridad industrial'),
      'priority', 1
    )
  ),

  -- 3. Guantes de Nitrilo Verde Calibre 18
  (
    'Guantes de Nitrilo Verde Calibre 18',
    'guantes-nitrilo-verde-calibre-18',
    'SEG-GUANTES-NITRILO-V18',
    'Guantes de nitrilo verde calibre 18 de alta resistencia química a solventes, aceites y grasas.',
    'Guantes industriales de protección química fabricados en nitrilo de alto grosor (calibre 18). Formulados para proporcionar excelente resistencia mecánica contra abrasión, enganches y perforaciones, así como barrera efectiva ante solventes, hidrocarburos, aceites y sustancias corrosivas. Interior con flocado de algodón para absorción del sudor y palma diamantada para agarre firme en húmedo o aceitado.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'guantes de nitrilo', 'nitrilo verde', 'calibre 18', 'quimicos', 'emg', 'epp', 'seguridad industrial'),
      'priority', 1
    )
  ),

  -- 4. Guantes de Látex Negro Industrial
  (
    'Guantes de Látex Negro Industrial',
    'guantes-latex-negro-industrial',
    'SEG-GUANTES-LATEX-NEGRO',
    'Guantes industriales de látex negro reforzado para manipulación química moderada y mantenimiento.',
    'Guantes de látex natural negro de alta resistencia y espesor reforzado para tareas de mantenimiento severo, galvanoplastia, saneamiento y manejo de ácidos y álcalis diluidos. Textura antideslizante en palma y dedos para óptimo agarre en seco o mojado. Caña semi-larga para resguardo de muñeca y antebrazo.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'guantes de latex', 'latex negro', 'guantes industriales', 'emg', 'epp', 'seguridad industrial'),
      'priority', 2
    )
  ),

  -- 5. Guantes de Neopreno Negro 16"
  (
    'Guantes de Neopreno Negro 16"',
    'guantes-neopreno-negro-16',
    'SEG-GUANTES-NEOPRENO-16',
    'Guantes de neopreno negro de caña larga 16 pulgadas con alta resistencia química y térmica.',
    'Guantes industriales de neopreno premium color negro con longitud extendida de 16 pulgadas (caña alta) para protección total de manos y antebrazos. Excelente barrera contra una amplia gama de productos químicos agresivos, ácidos, alcoholes, aceites y grasas. Interior afelpado suave para máximo confort térmico y destreza ergonómica en faenas continuas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'guantes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'par',
      'subcategory', 'guantes',
      'subitem', 'guantes',
      'tags', jsonb_build_array('guantes', 'neopreno', 'neopreno negro', 'guantes 16 pulgadas', 'cana larga', 'quimicos', 'emg', 'epp', 'seguridad industrial'),
      'priority', 3
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
