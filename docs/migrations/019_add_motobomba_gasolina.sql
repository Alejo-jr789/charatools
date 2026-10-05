-- =============================================================================
-- Migración 019: Motobomba de Agua a Gasolina (Plomería / Bombas)
-- =============================================================================
-- Archivo: docs/migrations/019_add_motobomba_gasolina.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-05
-- =============================================================================

BEGIN;

INSERT INTO public.products
  (name, slug, sku, short_desc, description, specs, is_casheable, brand_id, category_id)
VALUES
  (
    'Motobomba de Agua a Gasolina',
    'motobomba-gasolina',
    'CHARATOOLS-MOTOBOMBA-GASOLINA',
    'Motobomba a gasolina de alto caudal para achique, drenaje y riego agrícola.',
    'Motobomba autocebante a gasolina con motor OHV de 4 tiempos y jaula tubular de protección. Diseñada para trabajo pesado en drenaje, riego agrícola, obras de construcción y vaciado rápido.',
    '{"imagen":"/motobomba-gasolina.webp","priority":5,"tags":["bomba","motobomba","gasolina","agua","riego","drenaje","achique","alto caudal"],"stockStatus":"available","unidad":"und","subcategory":"bombas","subitem":"motobombas","variantLabel":"Diámetro","variants":[{"value":"2\""},{"value":"3\""},{"value":"4\""}]}'::jsonb,
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'plomeria')
  )
ON CONFLICT (slug) DO NOTHING;

COMMIT;
