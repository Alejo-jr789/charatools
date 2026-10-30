-- =============================================================================
-- Migración 069: Productos para Línea Herramientas Manuales (Niveles y Extractor de Ventosa)
-- =============================================================================
-- Archivo: docs/migrations/069_add_niveles_y_extractor_ventosa_herramientas_manuales.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-30
--
-- Productos agregados:
--   1. Nivel Torpedo 9"
--   2. Nivel 3 Gotas Aluminio 16" - 24" - 32" - 40" - 60" Tolsen
--   3. Extractor de Ventosa 25kg
-- =============================================================================

BEGIN;

-- 1. Nivel Torpedo 9"
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
  'Nivel Torpedo 9"',
  'nivel-torpedo-9-pulgadas',
  'HM-NIVEL-TORP-9',
  'Nivel de burbuja torpedo magnético de 9 pulgadas (225 mm) con 3 gotas (0°, 90°, 45°). Cuerpo en ABS de alto impacto con base magnética y ranura en V para tubos y perfiles metálicos.',
  'Nivel torpedo magnético de 9 pulgadas (225 mm - 230 mm) diseñado para trabajos de precisión en espacios reducidos en herrería, plomería, electricidad, albañilería e instalación de tabiquería. Fabricado con cuerpo robusto en polímero ABS de alto impacto que resiste caídas y golpes en obra. Incorpora 3 viales o gotas acrílicas de alta visibilidad: 0° (horizontal), 90° (vertical / plomada) y 45° (inclinación / ángulo). Dispone de una potente tira magnética longitudinal a lo largo de su base que permite adherirse firmemente a tuberías de acero, vigas y perfiles metálicos para operar con manos libres, además de una ranura en V (surco longitudinal) que facilita un apoyo estable y sin deslizamientos sobre superficies cilíndricas y tubos conduit.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 16,
    'longitud', '9 pulgadas (225 mm - 230 mm)',
    'gotas', '3 gotas acrílicas de alta visibilidad (0° horizontal, 90° vertical y 45° inclinación)',
    'base', 'Banda magnética longitudinal de alta adherencia con ranura en V para tubos',
    'material', 'Cuerpo en polímero ABS de alta resistencia al impacto',
    'tags', jsonb_build_array(
      'nivel torpedo 9"',
      'nivel torpedo',
      'nivel de mano',
      'nivel torpedo magnetico',
      'nivel 3 gotas',
      'nivel 9 pulgadas',
      'torpedo level',
      'herramientas manuales',
      'plomeria',
      'electricidad',
      'herrería'
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

-- 2. Nivel 3 Gotas Aluminio 16" - 24" - 32" - 40" - 60"
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
  'Nivel 3 Gotas Aluminio 16" - 24" - 32" - 40" - 60"',
  'nivel-3-gotas-aluminio-tolsen',
  'TOL-35111-SERIES',
  'Nivel profesional de aluminio reforzado Tolsen con 3 gotas de alta visibilidad (0°, 45°, 90°), base magnética y topes laterales de goma antichoque. Disponible en 16", 24", 32", 40" y 60".',
  'Nivel de burbuja tubular profesional marca Tolsen forjado en perfil de aluminio reforzado de alta resistencia con espesor de pared de 1.5 mm y base fresada de alta precisión (0.5 mm/m). Equipado con 3 gotas acrílicas transparentes anti-rotura para lectura de nivelación en tres ángulos clave: 0° (horizontal), 90° (vertical / plomada) y 45° (ingletes y caídas). Cuenta con potente banda magnética integrada en la superficie de apoyo para sujeción firme sobre vigas, columnas y estructuras de hierro, facilitando la medición con manos libres. Incorpora protectores terminales de caucho elastomérico antichoque en ambos extremos para absorber impactos en caso de caídas accidentales. Disponible en un amplio rango de longitudes para albañilería, herrería, carpintería y construcción general: 16" (40 cm), 24" (60 cm), 32" (80 cm), 40" (100 cm) y 60" (150 cm).',
  (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 17,
    'perfil', 'Perfil tubular de aluminio reforzado con espesor de 1.5 mm y base rectificada/fresada',
    'precision', '0.5 mm/m (alta precisión)',
    'gotas', '3 viales acrílicos antichoque de alta visibilidad: 0° (horizontal), 90° (vertical / plomada) y 45° (inglete)',
    'base', 'Banda magnética de alta potencia integrada para trabajo manos libres en acero',
    'proteccion', 'Topes terminales de caucho elastomérico antichoque en ambos extremos',
    'variantLabel', 'Medida',
    'variants', jsonb_build_array(
      jsonb_build_object('value', '16" (40 cm)'),
      jsonb_build_object('value', '24" (60 cm)'),
      jsonb_build_object('value', '32" (80 cm)'),
      jsonb_build_object('value', '40" (100 cm)'),
      jsonb_build_object('value', '60" (150 cm)')
    ),
    'tags', jsonb_build_array(
      'nivel de aluminio',
      'nivel tolsen',
      'nivel 3 gotas',
      'nivel de mano',
      'nivel de burbuja',
      'nivel 24 pulgadas',
      'nivel 16 pulgadas',
      'nivel 32 pulgadas',
      'nivel 40 pulgadas',
      'nivel 60 pulgadas',
      'spirit level',
      'tolsen',
      'herramientas manuales',
      'construccion',
      'albanileria'
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

-- 3. Extractor de Ventosa 25kg
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
  'Extractor de Ventosa 25kg',
  'extractor-de-ventosa-25kg',
  'HM-VENTOSA-25KG',
  'Ventosa simple de succión de 25 kg para manipulación y colocación segura de vidrios, porcelanatos, mármol y desabollado de láminas automotrices. Mecanismo de vacío rápido por palanca.',
  'Extractor de ventosa simple de alta adherencia con capacidad de succión y elevación de hasta 25 kg de carga vertical/horizontal. Diseñado para la manipulación ergonómica, transporte e instalación segura de piezas pesadas con superficies lisas, limpias y no porosas como láminas de vidrio, espejos, ventanas, baldosas de porcelanato, cerámicas de gran formato, mármol, granito pulido y planchas metálicas o acrílicas. También es ampliamente empleado en talleres de latonería automotriz como ventosa sacabollos para desabollar y nivelar golpes en carrocerías. Fabricado con un cuerpo resistente en polímero ABS de alto impacto de fácil agarre y disco de succión de caucho natural de 115 mm a 120 mm de diámetro que genera un sellado hermético instantáneo mediante su palanca de bloqueo abatible de un solo paso.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'herramientas-manuales' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 18,
    'capacidadCarga', '25 kg (carga de succión máxima en superficie lisa)',
    'diametroCopa', '115 mm a 120 mm (4.5" a 4.75")',
    'mecanismo', 'Accionamiento rápido por palanca / pestillo abatible de vacío',
    'materialCuerpo', 'Polímero ABS de alto impacto con asa ergonómica',
    'materialVentosa', 'Caucho natural flexible de alto sellado hermético',
    'aplicaciones', 'Instalación y traslado de vidrios, ventanas, porcelanatos, baldosas, mármol y desabollador / sacabollos en chapa automotriz',
    'tags', jsonb_build_array(
      'extractor de ventosa 25kg',
      'extractor de ventosa',
      'ventosa para vidrio',
      'chupa para vidrio',
      'suction cup',
      'ventosa porcelanato',
      'ventosa sacabollos',
      'desabollador',
      'ventosa simple',
      'herramientas manuales',
      'vidriería',
      'construccion'
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
