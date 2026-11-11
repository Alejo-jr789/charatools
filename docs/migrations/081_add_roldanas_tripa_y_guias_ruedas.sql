-- =============================================================================
-- Migración 081: Roldanas Canal V y U, Tripa 10" y Guías de Portón (Línea Ruedas)
-- =============================================================================
-- Archivo: docs/migrations/081_add_roldanas_tripa_y_guias_ruedas.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-10
--
-- Productos agregados:
--   1. Roldana con Base Canal V para Portón Corredizo (50mm, 60mm, 70mm)
--   2. Roldana sin Base Canal V para Portón Corredizo (50mm, 60mm, 70mm, 100mm)
--   3. Roldana sin Base Canal U para Tubo Redondo (2", 2.5", 3", 4")
--   4. Tripa de Aire para Rueda de Zorra y Carretilla 10" (4.10 / 3.50-4)
--   5. Rodillo Guía de Nylon para Portón Corredizo (25x40mm, 30x40mm, 40x60mm)
-- =============================================================================

BEGIN;

-- 1. Roldana con Base Canal V para Portón Corredizo 50mm - 60mm - 70mm
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
  'Roldana con Base Canal V para Portón Corredizo 50mm - 60mm - 70mm',
  'roldana-con-base-canal-v-porton-corredizo',
  'RUED-ROLD-CBASE-V-SERIES',
  'Roldana metálica de acero tropicalizado con base exterior perforada para soldar o atornillar y rodamiento sellado. Canal en "V" a 90° para riel angular en portones corredizos. Disponible en 50mm, 60mm y 70mm.',
  'Roldana o polea metálica de acero macizo mecanizado con soporte o base exterior troquelada con perforaciones para soldar o atornillar al marco inferior de portones corredizos y rejas metálicas pesadas. Diseñada con ranura en "V" (ángulo de 90° estándar) para deslizarse con precisión sobre rieles angulares de hierro o perfiles guía en V empotrados en el suelo. Fabricada en acero al carbono con tratamiento superficial de galvanizado / tropicalizado electrolítico dorado (anticorrosión para exteriores). Equipada con rodamiento de bolas interno sellado de precisión (rolinera) con perno central de acero y tuerca autofrenante que garantiza un rodamiento suave, silencioso y de mínima fricción bajo cargas elevadas sin atascos ni descarrilamientos.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'ruedas' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 2,
    'marca', 'Genérico',
    'material', 'Acero al carbono mecanizado con acabado tropicalizado / cincado dorado anticorrosivo',
    'tipoCanal', 'Canal en "V" (ángulo 90°) para perfil angular / riel en ángulo',
    'tipoMontaje', 'Con base exterior perforada para soldar o atornillar bajo el perfil del portón',
    'sistemaRodamiento', 'Rodamiento de bolas de acero sellado de alta precisión (rolinera interna)',
    'aplicaciones', 'Portones corredizos residenciales, comerciales e industriales, rejas metálicas y cancelas pesadas',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '50 mm (2")'),
      jsonb_build_object('value', '60 mm (2.4")'),
      jsonb_build_object('value', '70 mm (2.75")')
    ),
    'tags', jsonb_build_array(
      'roldana',
      'roldana con base',
      'canal v',
      'porton corredizo',
      'rueda para porton',
      'riel angular',
      'acero tropicalizado',
      'rolinera',
      'ruedas'
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

-- 2. Roldana sin Base Canal V para Portón Corredizo 50mm - 100mm
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
  'Roldana sin Base Canal V para Portón Corredizo 50mm - 100mm',
  'roldana-sin-base-canal-v-porton-corredizo',
  'RUED-ROLD-SBASE-V-SERIES',
  'Roldana metálica embutida de acero macizo con canal en "V" a 90° para portones corredizos. Incluye rodamiento de bolas sellado y perno pasante de montaje. Disponible en 50mm, 60mm, 70mm y 100mm.',
  'Roldana o rueda metálica individual para empotrar o embutir directamente dentro del tubo estructural o bastidor inferior de portones corredizos. Mecanizada en acero macizo de alta resistencia con canal en "V" a 90° para desplazamiento guiado sobre rieles de hierro angular. Acabado cincado tropicalizado dorado de alta resistencia a la intemperie y la corrosión. Incorpora rodamiento de bolas sellado (rolinera) con tornillo pasante de eje y tuerca de ajuste que permite una instalación firme y alineada en cajas o perfiles huecos. Ofrece una capacidad de carga sobresaliente y un rodaje suave y silencioso para portones de uso frecuente.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'ruedas' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 3,
    'marca', 'Genérico',
    'material', 'Acero macizo torneado con recubrimiento bicromatado / tropicalizado dorado',
    'tipoCanal', 'Canal en "V" a 90° para riel angular',
    'tipoMontaje', 'Sin base (diseño embutido para alojar dentro del perfil estructural del portón)',
    'incluye', 'Perno central de acero con tuerca de fijación',
    'sistemaRodamiento', 'Rodamiento de bolas de precisión lubricado y blindado',
    'aplicaciones', 'Portones corredizos de hierro, cancelas industriales, guías de arrastre y carros sobre riel',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '50 mm (2")'),
      jsonb_build_object('value', '60 mm (2.4")'),
      jsonb_build_object('value', '70 mm (2.75")'),
      jsonb_build_object('value', '100 mm (4")')
    ),
    'tags', jsonb_build_array(
      'roldana',
      'roldana sin base',
      'canal v',
      'rueda para embutir',
      'porton corredizo',
      'acero macizo',
      'rolinera',
      '100mm',
      'ruedas'
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

-- 3. Roldana sin Base Canal U para Tubo Redondo 2" - 4"
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
  'Roldana sin Base Canal U para Tubo Redondo 2" - 4"',
  'roldana-sin-base-canal-u-tubo-redondo',
  'RUED-ROLD-SBASE-U-SERIES',
  'Roldana metálica embutida con canal semicircular en "U" para rieles de tubo redondo o cabilla en portones corredizos. Acero tropicalizado con rolinera interna y perno pasante. Disponible en 2", 2.5", 3" y 4".',
  'Roldana metálica embutida con garganta o canal semicircular en "U", diseñada específicamente para rodar sobre rieles de tubo redondo, cabilla lisa o perfiles cilíndricos en portones corredizos, correderas de almacén y líneas de transporte guiado. Fabricada en acero forjado y torneado con baño electrolítico tropicalizado anticorrosivo que previene la oxidación por lluvia y humedad. Dispone de rodamiento interno de bolas (rolinera) de alta capacidad que reduce al mínimo la fricción de rodadura, permitiendo mover portones pesados de hierro con mínimo esfuerzo. Se suministra con perno de eje central y tuerca de seguridad para montaje embutido en el perfil inferior del portón.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'ruedas' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 4,
    'marca', 'Genérico',
    'material', 'Acero mecanizado de alta tenacidad con acabado tropicalizado dorado',
    'tipoCanal', 'Canal semicircular en "U" para riel de tubo redondo o cabilla lisa',
    'tipoMontaje', 'Sin base (para embutir en el perfil metálico inferior)',
    'incluye', 'Tornillo de eje pasante reforzado con tuerca',
    'sistemaRodamiento', 'Rodamiento sellado de bolas (rolinera de alto rendimiento)',
    'aplicaciones', 'Portones corredizos sobre tubo redondo, compuertas de garaje, rieles circulares y carros guía',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '2" (50 mm)'),
      jsonb_build_object('value', '2.5" (63 mm)'),
      jsonb_build_object('value', '3" (75 mm)'),
      jsonb_build_object('value', '4" (100 mm)')
    ),
    'tags', jsonb_build_array(
      'roldana',
      'canal u',
      'canal redondo',
      'roldana sin base',
      'tubo redondo',
      'cabilla',
      'porton corredizo',
      'acero',
      'rolinera',
      'ruedas'
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

-- 4. Tripa de Aire para Rueda de Zorra y Carretilla 10" (4.10 / 3.50-4)
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
  'Tripa de Aire para Rueda de Zorra y Carretilla 10" (4.10 / 3.50-4)',
  'tripa-de-aire-rueda-zorra-10-pulgadas',
  'RUED-TRIPA-NEUM-10',
  'Cámara de aire (tripa) de caucho butílico reforzado para ruedas de 10" (4.10/3.50-4). Válvula Schrader recta automotriz para zorras de carga, carretillas y carros de almacén.',
  'Cámara de aire (tripa) de caucho butílico reforzado de 10 pulgadas, diseñada como repuesto para neumáticos de zorras de carga (diablos), carretillas de construcción, carros de plataforma, generadores portátiles y cortacéspedes. Fabricada con elastómero de butilo de alta densidad que ofrece una excelente retención de presión de aire y resistencia al envejecimiento térmico, rozamiento interno y pinchazos por fricción. Compatible con medidas de caucho estándar 4.10/3.50-4 (rin de 4 pulgadas y diámetro exterior inflado de 10 pulgadas / 260 mm). Equipada con válvula recta estándar Schrader (tipo automotriz) con núcleo de bronce y tapa protectora, facilitando el inflado con cualquier bomba manual, compresor o calibrador de estación de servicio.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'ruedas' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 5,
    'marca', 'Genérico',
    'material', 'Caucho butílico de alta resistencia y retención de aire',
    'medidaCompatible', '4.10 / 3.50 - 4 (para ruedas de 10" de diámetro exterior con rin de 4")',
    'tipoValvula', 'Válvula Schrader recta (estándar automotriz) con núcleo de latón y tapa',
    'presionRecomendada', 'Hasta 30 PSI (según especificación del neumático)',
    'aplicaciones', 'Repuesto para ruedas neumáticas de zorras de carga, carretillas, generadores y plataformas',
    'tags', jsonb_build_array(
      'tripa',
      'camara de aire',
      'tripa para rueda',
      'rueda 10 pulgadas',
      '4.10 3.50 4',
      'zorra de carga',
      'carretilla',
      'repuesto rueda',
      'ruedas'
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

-- 5. Rodillo Guía de Nylon para Portón Corredizo 25x40mm - 40x60mm
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
  'Rodillo Guía de Nylon para Portón Corredizo 25x40mm - 40x60mm',
  'rodillo-guia-nylon-porton-corredizo',
  'RUED-GUIA-PORTON-NYLON-SERIES',
  'Rodillo guía superior de nylon blanco autolubricado con espárrago roscado de acero galvanizado y tuercas. Rodaje suave y silencioso para estabilización de portones corredizos. Disponible en 25x40mm, 30x40mm y 40x60mm.',
  'Rodillo guía cilíndrico de nylon / poliamida blanca de alta densidad con espárrago roscado de acero galvanizado, tuercas y arandelas, diseñado para la estabilización y guiado superior de portones corredizos, cancelas y rejas correderas. Su cuerpo de nylon macizo de alta resistencia al impacto rueda suavemente sobre los perfiles o canales superiores del portón sin desgastar la pintura ni rayar el metal, eliminando vibraciones y ruidos molestos durante la apertura y cierre. El espárrago roscado central de acero cincado permite un ajuste milimétrico de la separación y una fijación firme a las placas guía o soportes soldados al muro o pilar. Resistente a los rayos UV, humedad, polvo y lubricantes.',
  (SELECT id FROM public.brands WHERE slug IN ('generico', 'gen-rico') LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'ruedas' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 6,
    'marca', 'Genérico',
    'materialCuerpo', 'Nylon virgen / poliamida blanca autolubricada de alto impacto',
    'materialEje', 'Espárrago roscado de acero galvanizado anticorrosivo con tuercas y arandelas',
    'funcion', 'Guía y alineación superior para evitar cabeceos, descarrilamientos y vibraciones en portones corredizos',
    'ventajas', 'Rodaje ultrasilencioso, no raya el metal ni daña la pintura del portón, libre de mantenimiento',
    'aplicaciones', 'Portones corredizos residenciales e industriales, cancelas corredizas, rejas y puertas telescópicas',
    'variantLabel', 'Medida (Diámetro x Altura)',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '25 x 40 mm'),
      jsonb_build_object('value', '30 x 40 mm'),
      jsonb_build_object('value', '40 x 60 mm')
    ),
    'tags', jsonb_build_array(
      'guia para porton',
      'rodillo guia',
      'rodillo de nylon',
      'guia superior',
      'porton corredizo',
      'poliamida',
      'reja corrediza',
      'esparrago roscado',
      'ruedas'
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
