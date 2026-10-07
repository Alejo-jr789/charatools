-- =============================================================================
-- Migración 028: Productos de Sublínea Inodoros (Salas de Baño)
-- =============================================================================
-- Archivo: docs/migrations/028_add_inodoros_products.sql
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
  -- 1. Inodoro Valencia con Botón
  (
    'Inodoro Valencia con Botón',
    'inodoro-valencia-boton',
    'VENC-INO-VALENCIA-BOTON',
    'Inodoro de 2 piezas modelo Valencia con sistema de descarga de botón superior.',
    'Inodoro de dos piezas modelo Valencia con sistema de descarga de botón pulsador superior. Fabricado en porcelana sanitaria vitrificada de alta densidad con acabado brillante de fácil limpieza. Taza ergonómica y tanque de descarga rápida para máxima higiene y economía de agua.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'venceramica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'inodoros' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'inodoros',
      'subitem', 'inodoros',
      'tags', jsonb_build_array('inodoro', 'valencia', 'inodoro con boton', 'poceta', 'wc', 'salas de bano', 'sanitario', 'venceramica'),
      'priority', 1
    )
  ),

  -- 2. Inodoro Rimini RF con Botón Lateral
  (
    'Inodoro Rimini RF con Botón Lateral',
    'inodoro-rimini-rf-boton-lateral',
    'VENC-INO-RIMINI-BOTON-LAT',
    'Inodoro modelo Rimini RF de alto rendimiento con sistema de descarga por botón lateral.',
    'Inodoro de dos piezas modelo Rimini RF con accionamiento por botón pulsador lateral en el tanque. Elaborado en porcelana vitrificada premium con sifón esmaltado para evacuación eficiente y silenciosa con óptimo ahorro de agua. Diseño contemporáneo y líneas limpias para cualquier estilo de baño.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'venceramica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'inodoros' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'inodoros',
      'subitem', 'inodoros',
      'tags', jsonb_build_array('inodoro', 'rimini', 'rimini rf', 'inodoro boton lateral', 'poceta', 'wc', 'salas de bano', 'sanitario', 'venceramica'),
      'priority', 2
    )
  ),

  -- 3. Inodoro Coronet con Manija
  (
    'Inodoro Coronet con Manija',
    'inodoro-coronet-manija',
    'VENC-INO-CORONET-MANIJA',
    'Inodoro clásico de 2 piezas modelo Coronet con accionamiento tradicional por manija.',
    'Inodoro tradicional de dos piezas modelo Coronet con sistema de descarga clásica por palanca o manija frontal cromada. Estructura robusta de loza sanitaria vitrificada de primera calidad, garantizando máxima durabilidad y resistencia al uso continuo en remodelaciones y obras residenciales.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'venceramica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'inodoros' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'inodoros',
      'subitem', 'inodoros',
      'tags', jsonb_build_array('inodoro', 'coronet', 'inodoro con manija', 'palanca', 'poceta', 'wc', 'salas de bano', 'sanitario', 'venceramica'),
      'priority', 3
    )
  ),

  -- 4. Inodoro Vinci / One Piece
  (
    'Inodoro Vinci / One Piece',
    'inodoro-vinci-one-piece',
    'VENC-INO-VINCI-ONEPIECE',
    'Inodoro monolítico One Piece modelo Vinci de diseño moderno y descarga de alta eficiencia.',
    'Inodoro contemporáneo de una sola pieza (One Piece) modelo Vinci con taza y tanque totalmente integrados en una sola estructura sin uniones visibles. Sistema de descarga potente y de bajo consumo con botón superior. Diseño elegante y fácil mantenimiento que evita la acumulación de suciedad.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'venceramica' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'inodoros' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'inodoros',
      'subitem', 'inodoros',
      'tags', jsonb_build_array('inodoro', 'vinci', 'one piece', 'inodoro una pieza', 'poceta', 'wc', 'salas de bano', 'sanitario', 'venceramica'),
      'priority', 4
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
