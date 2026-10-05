-- =============================================================================
-- Migración 020: Categorías Línea Agua Caliente (Plomería / Tuberías)
-- =============================================================================
-- Archivo: docs/migrations/020_add_linea_agua_caliente_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-05
-- =============================================================================

BEGIN;

INSERT INTO public.categories (name, slug, description)
VALUES
  ('Línea Agua Caliente', 'linea-agua-caliente', 'Tuberías y conexiones para agua caliente (CPVC)'),
  ('Tubería Agua Caliente', 'tuberia-agua-caliente', 'Tuberías de agua caliente CPVC'),
  ('Conexiones Agua Caliente', 'conexiones-agua-caliente', 'Conexiones y accesorios de agua caliente CPVC')
ON CONFLICT (slug) DO NOTHING;

COMMIT;
