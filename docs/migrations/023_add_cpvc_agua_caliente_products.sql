-- =============================================================================
-- Migración 023: Productos de Línea Agua Caliente (CPVC Tubrica 1/2")
-- =============================================================================
-- Archivo: docs/migrations/023_add_cpvc_agua_caliente_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-05
-- =============================================================================

BEGIN;

-- 1. Asegurar vinculación jerárquica de Línea Agua Caliente con Plomería
UPDATE public.categories 
SET parent_id = (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
    depth = 1
WHERE slug = 'linea-agua-caliente';

UPDATE public.categories 
SET parent_id = (SELECT id FROM public.categories WHERE slug = 'linea-agua-caliente' LIMIT 1),
    depth = 2
WHERE slug IN ('tuberia-agua-caliente', 'conexiones-agua-caliente');

-- 2. Insertar productos de CPVC Agua Caliente 1/2"
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
  -- 1. Tubo CPVC Agua Caliente 1/2"
  (
    'Tubo CPVC Agua Caliente 1/2"',
    'tubo-cpvc-agua-caliente-1-2',
    'TUBRICA-CPVC-TUBO-1-2',
    'Tubo de CPVC RDE 9 de 1/2" para conducción de agua caliente y alta presión.',
    'Tubo de CPVC (Cloruro de Polivinilo Clorado) de 1/2 pulgada (RDE 9) diseñado para distribución de agua caliente y fría en edificaciones. Soporta temperaturas elevadas y presiones continuas de servicio. Resistente a la corrosión química y libre de incrustaciones calcáreas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tubrica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'linea-agua-caliente' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'tubo',
      'subcategory', 'linea-agua-caliente',
      'subitem', 'tuberia-agua-caliente',
      'variantLabel', 'Medida',
      'variants', jsonb_build_array(jsonb_build_object('value', '1/2"')),
      'tags', jsonb_build_array('cpvc', 'tubo', 'tuberia', 'agua caliente', 'plomeria', 'tubrica', '1/2', 'rde 9'),
      'priority', 10
    )
  ),

  -- 2. Unión Universal 1/2" CPVC
  (
    'Unión Universal 1/2" CPVC',
    'union-universal-1-2-cpvc',
    'TUBRICA-CPVC-UNION-UNIV-1-2',
    'Unión universal de CPVC de 1/2" para acoples desmontables en redes de agua caliente.',
    'Unión universal desmontable fabricada en CPVC de 1/2 pulgada. Facilita la instalación, mantenimiento preventivo y desmontaje de bombas, calentadores y tuberías de agua caliente sin necesidad de cortar la red.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tubrica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'linea-agua-caliente' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'linea-agua-caliente',
      'subitem', 'conexiones-agua-caliente',
      'variantLabel', 'Medida',
      'variants', jsonb_build_array(jsonb_build_object('value', '1/2"')),
      'tags', jsonb_build_array('cpvc', 'union', 'union universal', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'),
      'priority', 11
    )
  ),

  -- 3. Tee CPVC 1/2"
  (
    'Tee CPVC 1/2"',
    'tee-cpvc-1-2',
    'TUBRICA-CPVC-TEE-1-2',
    'Tee de CPVC de 1/2" para ramales y derivaciones a 90° en redes de agua caliente.',
    'Accesorio Tee de 1/2 pulgada fabricado en CPVC para derivar ramales a 90 grados en sistemas hidrosanitarios de agua caliente y fría. Unión por cementado solvente CPVC que garantiza hermeticidad absoluta.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tubrica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'linea-agua-caliente' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'linea-agua-caliente',
      'subitem', 'conexiones-agua-caliente',
      'variantLabel', 'Medida',
      'variants', jsonb_build_array(jsonb_build_object('value', '1/2"')),
      'tags', jsonb_build_array('cpvc', 'tee', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'),
      'priority', 12
    )
  ),

  -- 4. Codo 90° x 1/2" CPVC
  (
    'Codo 90° x 1/2" CPVC',
    'codo-90-1-2-cpvc',
    'TUBRICA-CPVC-CODO-90-1-2',
    'Codo de 90 grados en CPVC de 1/2" para cambios de dirección en redes de agua caliente.',
    'Codo de 90° fabricado en CPVC de 1/2 pulgada. Diseñado para cambios de dirección con flujo uniforme en instalaciones hidrosanitarias de agua caliente. Alta resistencia térmica y a la presión continua.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tubrica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'linea-agua-caliente' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'linea-agua-caliente',
      'subitem', 'conexiones-agua-caliente',
      'variantLabel', 'Medida',
      'variants', jsonb_build_array(jsonb_build_object('value', '1/2"')),
      'tags', jsonb_build_array('cpvc', 'codo', 'codo 90', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'),
      'priority', 13
    )
  ),

  -- 5. Adaptador Macho 1/2" CPVC
  (
    'Adaptador Macho 1/2" CPVC',
    'adaptador-macho-1-2-cpvc',
    'TUBRICA-CPVC-ADAPT-MACHO-1-2',
    'Adaptador macho con rosca NPT de 1/2" en CPVC para transiciones y acoples roscados.',
    'Adaptador macho de 1/2 pulgada en CPVC con un extremo liso para soldar y un extremo roscado NPT macho exterior. Permite conectar tuberías de CPVC con llaves de paso, griferías o accesorios metálicos de agua caliente.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tubrica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'linea-agua-caliente' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'linea-agua-caliente',
      'subitem', 'conexiones-agua-caliente',
      'variantLabel', 'Medida',
      'variants', jsonb_build_array(jsonb_build_object('value', '1/2"')),
      'tags', jsonb_build_array('cpvc', 'adaptador', 'adaptador macho', 'rosca', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'),
      'priority', 14
    )
  ),

  -- 6. Adaptador Hembra 1/2" CPVC
  (
    'Adaptador Hembra 1/2" CPVC',
    'adaptador-hembra-1-2-cpvc',
    'TUBRICA-CPVC-ADAPT-HEMBRA-1-2',
    'Adaptador hembra con rosca NPT interior de 1/2" en CPVC para acoples roscados.',
    'Adaptador hembra de 1/2 pulgada en CPVC con un extremo liso para soldar y un extremo roscado NPT hembra interior. Diseñado para acoples a terminales roscados machos en instalaciones de agua caliente.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'tubrica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'linea-agua-caliente' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'linea-agua-caliente',
      'subitem', 'conexiones-agua-caliente',
      'variantLabel', 'Medida',
      'variants', jsonb_build_array(jsonb_build_object('value', '1/2"')),
      'tags', jsonb_build_array('cpvc', 'adaptador', 'adaptador hembra', 'rosca', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'),
      'priority', 15
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
