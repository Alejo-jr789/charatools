-- =============================================================================
-- Migración 021: Categoría Canillas (Plomería)
-- =============================================================================
-- Archivo: docs/migrations/021_add_canillas_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-05
-- =============================================================================

BEGIN;

INSERT INTO public.categories (name, slug, description)
VALUES
  ('Canillas', 'canillas', 'Canillas y mangueras flexibles para lavamanos, fregaderos y sanitarios')
ON CONFLICT (slug) DO NOTHING;

COMMIT;
