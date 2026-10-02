-- =============================================================================
-- Migración 018: Productos de Impermeabilización (Parte 3)
-- =============================================================================
-- Archivo: docs/migrations/018_add_impermeabilizacion_products_part3.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-02
-- =============================================================================

BEGIN;

INSERT INTO public.products
  (name, slug, sku, short_desc, description, specs, is_casheable, brand_id, category_id)
VALUES
  (
    'Silicona Neutra RTV Zasc',
    'silicona-neutra-zasc',
    'ZASC-SILICONA-NEUTRA',
    'Silicona neutra RTV para sellado profesional. Colores: Blanco y Negro.',
    'Silicona neutra RTV marca Zasc de alto rendimiento, resistente a la intemperie y humedad. Ideal para el sellado profesional de vidrio, aluminio, metales y superficies no porosas.',
    '{"imagen":"/categoria-impermeabilizacion.webp","priority":11,"tags":["silicona","neutra","zasc","rtv","sellador","adhesivo"],"stockStatus":"available","unidad":"und","variantLabel":"Color","variants":[{"value":"Blanco (300ml)"},{"value":"Negro (300ml)"}]}'::jsonb,
    false,
    (SELECT id FROM public.brands WHERE slug = 'zasc'),
    (SELECT id FROM public.categories WHERE slug = 'impermeabilizacion')
  )
ON CONFLICT (slug) DO NOTHING;

COMMIT;
