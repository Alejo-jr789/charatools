-- =============================================================================
-- Migración 046: Categoría Principal Soldadura
-- =============================================================================
-- Archivo: docs/migrations/046_add_soldadura_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-20
-- =============================================================================

BEGIN;

INSERT INTO public.categories (name, slug, description, depth, parent_id, is_active)
VALUES
  ('Soldadura', 'soldadura', 'Máquinas de soldar, inversores, electrodos, caretas y consumibles para soldadura profesional', 0, NULL, true)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  depth = 0,
  parent_id = NULL,
  is_active = true;

COMMIT;
