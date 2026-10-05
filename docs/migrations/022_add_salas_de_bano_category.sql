-- =============================================================================
-- Migración 022: Categoría Principal Salas de Baño y Sublíneas
-- =============================================================================
-- Archivo: docs/migrations/022_add_salas_de_bano_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-05
-- =============================================================================

BEGIN;

-- 1. Insertar categoría principal (Línea principal)
INSERT INTO public.categories (name, slug, description)
VALUES
  ('Salas de Baño', 'salas-de-bano', 'Sanitarios, inodoros, lavamanos, pedestales y accesorios para salas de baño')
ON CONFLICT (slug) DO NOTHING;

-- 2. Insertar sublíneas
INSERT INTO public.categories (name, slug, description, parent_id)
VALUES
  ('Sanitarios', 'sanitarios', 'Piezas y juegos sanitarios completos', (SELECT id FROM public.categories WHERE slug = 'salas-de-bano')),
  ('Inodoros', 'inodoros', 'Inodoros, pocetas y tanques de descarga', (SELECT id FROM public.categories WHERE slug = 'salas-de-bano')),
  ('Lavamanos y Pedestales', 'lavamanos-pedestales', 'Lavamanos de sobreponer, empotrar y pedestales', (SELECT id FROM public.categories WHERE slug = 'salas-de-bano'))
ON CONFLICT (slug) DO UPDATE SET 
  parent_id = EXCLUDED.parent_id,
  name = EXCLUDED.name,
  description = EXCLUDED.description;

COMMIT;
