-- =============================================================================
-- Migración 004: Nuevos productos de iluminación (Paneles LED)
-- =============================================================================
-- Archivo: docs/migrations/004_add_panel_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-02
-- =============================================================================

BEGIN;

INSERT INTO public.products
  (name, slug, sku, short_desc, description, specs, is_casheable, brand_id, category_id)
VALUES
  (
    'Panel Superficial Redondo',
    'panel-superficial-redondo',
    'CHARATOOLS-PANEL-SUPERFICIAL-REDONDO',
    'Panel LED superficial redondo para techos sin cielo raso. Luz blanca y diseño ultradelgado.',
    'Panel LED superficial redondo para techos sin cielo raso. Luz blanca y diseño ultradelgado.',
    '{"imagen":"/iluminacion.webp","tags":["LED","panel","superficial","redondo","techo"],"stockStatus":"available","unidad":"und","subcategory":"paneles","subitem":"paneles","variantLabel":"Potencia","priority":1,"variants":[{"value":"6W"},{"value":"12W"},{"value":"18W"},{"value":"24W"},{"value":"36W"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico'),
    (SELECT id FROM public.categories WHERE slug = 'iluminacion')
  ),
  (
    'Panel Superficial Cuadrado',
    'panel-superficial-cuadrado',
    'CHARATOOLS-PANEL-SUPERFICIAL-CUADRADO',
    'Panel LED superficial cuadrado ideal para oficinas y áreas amplias.',
    'Panel LED superficial cuadrado ideal para oficinas y áreas amplias.',
    '{"imagen":"/iluminacion.webp","tags":["LED","panel","superficial","cuadrado","oficina"],"stockStatus":"available","unidad":"und","subcategory":"paneles","subitem":"paneles","variantLabel":"Potencia","priority":2,"variants":[{"value":"6W"},{"value":"12W"},{"value":"18W"},{"value":"24W"},{"value":"36W"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico'),
    (SELECT id FROM public.categories WHERE slug = 'iluminacion')
  ),
  (
    'Panel Empotrable Cuadrado',
    'panel-empotrable-cuadrado',
    'CHARATOOLS-PANEL-EMPOTRABLE-CUADRADO',
    'Panel LED empotrable cuadrado para cielo raso y Drywall.',
    'Panel LED empotrable cuadrado para cielo raso y Drywall.',
    '{"imagen":"/iluminacion.webp","tags":["LED","panel","empotrable","cuadrado","drywall"],"stockStatus":"available","unidad":"und","subcategory":"paneles","subitem":"paneles","variantLabel":"Potencia","priority":3,"variants":[{"value":"3W"},{"value":"6W"},{"value":"9W"},{"value":"12W"},{"value":"18W"},{"value":"24W"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico'),
    (SELECT id FROM public.categories WHERE slug = 'iluminacion')
  ),
  (
    'Panel Empotrable Redondo',
    'panel-empotrable-redondo',
    'CHARATOOLS-PANEL-EMPOTRABLE-REDONDO',
    'Panel LED empotrable redondo de diseño minimalista para interiores.',
    'Panel LED empotrable redondo de diseño minimalista para interiores.',
    '{"imagen":"/iluminacion.webp","tags":["LED","panel","empotrable","redondo","interior"],"stockStatus":"available","unidad":"und","subcategory":"paneles","subitem":"paneles","variantLabel":"Potencia","priority":4,"variants":[{"value":"3W"},{"value":"6W"},{"value":"9W"},{"value":"12W"},{"value":"18W"},{"value":"24W"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico'),
    (SELECT id FROM public.categories WHERE slug = 'iluminacion')
  )
ON CONFLICT (slug) DO NOTHING;

COMMIT;
