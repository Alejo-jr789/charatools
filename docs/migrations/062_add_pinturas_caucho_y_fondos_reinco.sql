-- =============================================================================
-- Migración 062: Pinturas de Caucho Mate y Fondos Reinco
-- =============================================================================
-- Archivo: docs/migrations/062_add_pinturas_caucho_y_fondos_reinco.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-27
--
-- Productos agregados a Línea 'Pintura y Accesorios':
--   1. Pintura de Caucho Mate Clase C Reinco Blanco (Galón / Cuñete)
--   2. Pintura de Caucho Mate Clase B Reinco Blanco (Galón / Cuñete)
--   3. Pintura de Caucho Mate Clase A Reinco Blanco (Galón / Cuñete)
--   4. Fondo de Herrería Reinco (1/4 Galón / Galón - Blanco, Negro, Gris)
--   5. Fondo Anticorrosivo Reinco (1/4 Galón / Galón - Blanco, Negro, Gris)
-- =============================================================================

BEGIN;

-- 1. Pintura de Caucho Mate Clase C Reinco Blanco
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
  'Pintura de Caucho Mate Clase C Reinco Blanco',
  'pintura-caucho-mate-clase-c-reinco-blanco',
  'REINCO-CAUCHO-MATE-CLASE-C-BLANCO',
  'Pintura de caucho emulsionada acabado mate Clase C formulada para ambientes interiores y exteriores. Disponible en presentación Galón y Cuñete (4 Galones).',
  'Pintura de caucho emulsionada clase C marca Reinco de acabado mate uniforme para interiores y exteriores. Desarrollada para ofrecer excelente rendimiento, poder cubriente y facilidad de aplicación con brocha o rodillo en paredes de mampostería, friso, yeso, drywall y concreto. Fórmula lavable y de bajo olor que proporciona protección y embellecimiento en obras residenciales, comerciales y mantenimientos generales. Color Blanco.',
  (SELECT id FROM public.brands WHERE slug = 'reinco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 12,
    'color', 'Blanco',
    'tipoPintura', 'Caucho emulsionada acabado mate',
    'clase', 'Clase C',
    'uso', 'Interior y Exterior',
    'variantLabel', 'Presentación',
    'variants', jsonb_build_array(
      jsonb_build_object('value', 'Galón'),
      jsonb_build_object('value', 'Cuñete (4 Galones)')
    ),
    'tags', jsonb_build_array(
      'pintura caucho mate clase c reinco blanco',
      'pintura de caucho clase c reinco',
      'pintura caucho blanco',
      'pintura mate clase c',
      'reinco',
      'cuñete clase c',
      'galon clase c',
      'pintura y accesorios',
      'pintura para pared',
      'remodelacion'
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

-- 2. Pintura de Caucho Mate Clase B Reinco Blanco
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
  'Pintura de Caucho Mate Clase B Reinco Blanco',
  'pintura-caucho-mate-clase-b-reinco-blanco',
  'REINCO-CAUCHO-MATE-CLASE-B-BLANCO',
  'Pintura de caucho mate de calidad intermedia Clase B con alta lavabilidad y excelente cubrimiento para interiores y exteriores. Presentación en Galón y Cuñete.',
  'Pintura arquitectónica de caucho de calidad Clase B marca Reinco con acabado mate decorativo. Ofrece un balance superior entre rendimiento por metro cuadrado, blancura duradera y alta resistencia a la intemperie y al lavado frecuente. Especialmente recomendada para áreas de tráfico moderado a alto, fachadas, salas, pasillos y edificaciones que demandan un acabado estético impecable y duradero. Color Blanco.',
  (SELECT id FROM public.brands WHERE slug = 'reinco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 13,
    'color', 'Blanco',
    'tipoPintura', 'Caucho emulsionada acabado mate',
    'clase', 'Clase B',
    'uso', 'Interior y Exterior',
    'variantLabel', 'Presentación',
    'variants', jsonb_build_array(
      jsonb_build_object('value', 'Galón'),
      jsonb_build_object('value', 'Cuñete (4 Galones)')
    ),
    'tags', jsonb_build_array(
      'pintura caucho mate clase b reinco blanco',
      'pintura de caucho clase b reinco',
      'pintura caucho blanco',
      'pintura mate clase b',
      'reinco',
      'cuñete clase b',
      'galon clase b',
      'pintura lavable',
      'pintura y accesorios',
      'remodelacion'
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

-- 3. Pintura de Caucho Mate Clase A Reinco Blanco
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
  'Pintura de Caucho Mate Clase A Reinco Blanco',
  'pintura-caucho-mate-clase-a-reinco-blanco',
  'REINCO-CAUCHO-MATE-CLASE-A-BLANCO',
  'Pintura de caucho mate de máxima calidad Clase A con máximo poder cubriente, ultra lavable y durabilidad extrema en intemperie. Disponible en Galón y Cuñete.',
  'Pintura emulsionada de calidad superior Clase A marca Reinco formulada con resinas acrílicas puras de altísimo desempeño. Proporciona máximo poder cubriente al secar, acabado mate aterciopelado impecable y resistencia extrema a la radiación UV, decoloración, humedad y ciclos continuos de lavado. La mejor opción profesional para proyectos de alta gama, fachadas exteriores exigentes y ambientes interiores de alto estándar. Color Blanco.',
  (SELECT id FROM public.brands WHERE slug = 'reinco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 14,
    'color', 'Blanco',
    'tipoPintura', 'Caucho emulsionada acabado mate premium',
    'clase', 'Clase A',
    'uso', 'Interior y Exterior de alto tráfico',
    'variantLabel', 'Presentación',
    'variants', jsonb_build_array(
      jsonb_build_object('value', 'Galón'),
      jsonb_build_object('value', 'Cuñete (4 Galones)')
    ),
    'tags', jsonb_build_array(
      'pintura caucho mate clase a reinco blanco',
      'pintura de caucho clase a reinco',
      'pintura caucho blanco',
      'pintura mate clase a',
      'reinco',
      'cuñete clase a',
      'galon clase a',
      'pintura premium',
      'ultra lavable',
      'pintura y accesorios'
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

-- 4. Fondo de Herrería Reinco
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
  'Fondo de Herrería Reinco',
  'fondo-de-herreria-reinco',
  'REINCO-FONDO-HERRERIA',
  'Fondo anticorrosivo de secado rápido para herrería y estructuras metálicas. Disponible en presentaciones de Galón y 1/4 Galón, en colores Blanco, Negro y Gris.',
  'Fondo para herrería base alquídica de secado rápido formulado por Reinco para la protección primaria de perfiles de hierro, acero, rejas, marcos, portones, tuberías estructurales y láminas metálicas. Ofrece excelente adherencia sobre metales ferrosos, sellando los poros superficiales y creando una película protectora uniforme que previene la corrosión y optimiza la adherencia y acabado de esmaltes sintéticos. Disponible en Galón y 1/4 Galón, en acabados Blanco, Negro y Gris.',
  (SELECT id FROM public.brands WHERE slug = 'reinco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 15,
    'tipoProducto', 'Fondo alquídico de herrería',
    'aplicacion', 'Herrería general, estructuras metálicas, marcos, perfiles y portones',
    'variantLabel', 'Presentación y Color',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1/4 Galón - Gris'),
      jsonb_build_object('value', '1/4 Galón - Negro'),
      jsonb_build_object('value', '1/4 Galón - Blanco'),
      jsonb_build_object('value', 'Galón - Gris'),
      jsonb_build_object('value', 'Galón - Negro'),
      jsonb_build_object('value', 'Galón - Blanco')
    ),
    'tags', jsonb_build_array(
      'fondo de herrería reinco',
      'fondo de herreria',
      'reinco',
      'fondo para metal',
      'fondo gris',
      'fondo negro',
      'fondo blanco',
      'herrería',
      'estructuras metálicas',
      'pintura y accesorios'
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

-- 5. Fondo Anticorrosivo Reinco
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
  'Fondo Anticorrosivo Reinco',
  'fondo-anticorrosivo-reinco',
  'REINCO-FONDO-ANTICORROSIVO',
  'Fondo anticorrosivo de alto rendimiento para máxima protección de metales contra el óxido y humedad. Presentaciones de Galón y 1/4 Galón en Blanco, Negro y Gris.',
  'Fondo anticorrosivo industrial y arquitectónico marca Reinco diseñado para inhibir y prevenir la formación de óxido y corrosión sobre superficies de hierro y acero expuestas a la intemperie o ambientes de humedad media/alta. Su formulación con pigmentos inhibidores de corrosión de alta eficiencia crea una barrera química impenetrable, mejorando notablemente el agarre y la vida útil del esmalte final de acabado. Disponible en Galón y 1/4 Galón, en colores Blanco, Negro y Gris.',
  (SELECT id FROM public.brands WHERE slug = 'reinco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'pintura-y-accesorios' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 16,
    'tipoProducto', 'Fondo anticorrosivo inhibidor de óxido',
    'aplicacion', 'Protección anticorrosiva de metales ferrosos en intemperie y estructuras',
    'variantLabel', 'Presentación y Color',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '1/4 Galón - Gris'),
      jsonb_build_object('value', '1/4 Galón - Negro'),
      jsonb_build_object('value', '1/4 Galón - Blanco'),
      jsonb_build_object('value', 'Galón - Gris'),
      jsonb_build_object('value', 'Galón - Negro'),
      jsonb_build_object('value', 'Galón - Blanco')
    ),
    'tags', jsonb_build_array(
      'fondo anticorrosivo reinco',
      'fondo anticorrosivo',
      'anticorrosivo',
      'reinco',
      'fondo metal',
      'fondo gris',
      'fondo negro',
      'fondo blanco',
      'herrería',
      'antioxidante',
      'pintura y accesorios'
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
