-- =============================================================================
-- Migración 056: Línea Principal Pintura y Accesorios
-- =============================================================================
-- Archivo: docs/migrations/056_add_pintura_y_accesorios_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-26
-- =============================================================================

BEGIN;

-- Crear o actualizar categoría principal 'Pintura y Accesorios'
INSERT INTO public.categories (name, slug, description, depth, parent_id, is_active)
VALUES
  ('Pintura y Accesorios', 'pintura-y-accesorios', 'Pinturas arquitectónicas, esmaltes, anticorrosivos, brochas, rodillos, bandejas, solventes y complementos para acabados profesionales', 0, NULL, true)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  depth = 0,
  parent_id = NULL,
  is_active = true;

COMMIT;
