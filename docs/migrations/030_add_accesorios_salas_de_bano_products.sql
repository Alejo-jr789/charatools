-- =============================================================================
-- Migración 030: Productos de Sublínea Accesorios (Salas de Baño)
-- =============================================================================
-- Archivo: docs/migrations/030_add_accesorios_salas_de_bano_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-07
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
  -- 1. Botón Lateral Cromado Largo
  (
    'Botón Lateral Cromado Largo',
    'boton-lateral-cromado-largo',
    'ACC-BOTON-LATERAL-LARGO',
    'Botón lateral cromado con varilla plástica larga para tanque de inodoro.',
    'Botón de accionamiento lateral con acabado cromado brillante y brazo de palanca largo reforzado. Compatible con la mayoría de tanques de inodoros con descarga lateral (incluyendo modelos Rimini RF y similares). Mecanismo de retorno suave y fácil instalación sin herramientas especiales.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'accesorios' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'accesorios',
      'subitem', 'accesorios',
      'tags', jsonb_build_array('boton', 'boton lateral', 'boton cromado', 'herraje', 'inodoro', 'poceta', 'tanque', 'salas de bano', 'accesorios'),
      'priority', 1
    )
  ),

  -- 2. Botón Superior Cromado
  (
    'Botón Superior Cromado',
    'boton-superior-cromado',
    'ACC-BOTON-SUPERIOR-CROMADO',
    'Botón pulsador superior cromado para tapa de tanque de inodoro.',
    'Botón pulsador de descarga superior con acabado cromado de alta durabilidad para tapa de inodoros (como Valencia, entre otros). Incluye varilla de empuje graduable y rosca de ajuste inferior para fijación firme en la tapa del tanque. Resistente al agua y al desgaste constante.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'accesorios' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'accesorios',
      'subitem', 'accesorios',
      'tags', jsonb_build_array('boton', 'boton superior', 'boton cromado', 'pulsador', 'herraje', 'inodoro', 'poceta', 'tanque', 'salas de bano', 'accesorios'),
      'priority', 2
    )
  ),

  -- 3. Manija Plástica Cromada
  (
    'Manija Plástica Cromada',
    'manija-plastica-cromada',
    'ACC-MANIJA-PLASTICA-CROMADA',
    'Palanca o manija para inodoro con acabado cromado o plástico y brazo regulable.',
    'Manija de descarga para tanque de inodoro con palanca exterior en acabado cromado o plástico blanco de alta resistencia y varilla de accionamiento perforada para ajuste de cadena del flapper. Diseño universal compatible con modelos tradicionales de inodoros tipo Coronet y convencionales.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'accesorios' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'accesorios',
      'subitem', 'accesorios',
      'variantLabel', 'Tipo',
      'variants', jsonb_build_array(
        jsonb_build_object('value', 'Cromada'),
        jsonb_build_object('value', 'Plástica Blanca')
      ),
      'tags', jsonb_build_array('manija', 'palanca', 'manija cromada', 'manija plastica', 'herraje', 'inodoro', 'poceta', 'tanque', 'salas de bano', 'accesorios'),
      'priority', 3
    )
  ),

  -- 4. Flapper 3 Pulgadas
  (
    'Flapper 3 Pulgadas',
    'flapper-3-pulgadas',
    'ACC-FLAPPER-3-PULG',
    'Sapo o flapper de 3 pulgadas de goma flexible para descarga de inodoro con cadena de acero.',
    'Válvula de descarga tipo flapper (sapo) de 3 pulgadas fabricada en elastómero/silicona de alta flexibilidad y resistencia a químicos y aguas duras. Diseñado para válvulas de descarga grandes de 3" en inodoros de alto rendimiento y bajo consumo. Incluye cadena y gancho de acero inoxidable para conexión a la palanca.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'accesorios' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'accesorios',
      'subitem', 'accesorios',
      'tags', jsonb_build_array('flapper', 'flapper 3', 'sapo', 'valvula de descarga', 'goma', 'herraje', 'inodoro', 'poceta', '3 pulgadas', 'salas de bano', 'accesorios'),
      'priority', 4
    )
  ),

  -- 5. Flapper 2 Pulgadas
  (
    'Flapper 2 Pulgadas',
    'flapper-2-pulgadas',
    'ACC-FLAPPER-2-PULG',
    'Sapo o flapper de 2 pulgadas de goma flexible estándar para descarga de inodoro con cadena.',
    'Válvula de descarga tipo flapper (sapo) de 2 pulgadas fabricada en caucho flexible de gran estanqueidad para prevenir fugas continuas de agua en el tanque. Medida estándar universal de 2" compatible con la gran mayoría de inodoros tradicionales. Incluye cadena y tirante de fijación.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'accesorios' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'accesorios',
      'subitem', 'accesorios',
      'tags', jsonb_build_array('flapper', 'flapper 2', 'sapo', 'valvula de descarga', 'goma', 'herraje', 'inodoro', 'poceta', '2 pulgadas', 'salas de bano', 'accesorios'),
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
  specs = EXCLUDED.specs;

COMMIT;
