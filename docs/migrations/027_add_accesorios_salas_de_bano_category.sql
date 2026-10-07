-- =============================================================================
-- Migración 027: Sublínea Accesorios para Salas de Baño
-- =============================================================================
-- Archivo: docs/migrations/027_add_accesorios_salas_de_bano_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-07
-- =============================================================================

BEGIN;

INSERT INTO public.categories (name, slug, description, parent_id, depth, sort_order, is_active)
VALUES (
  'Accesorios',
  'accesorios',
  'Accesorios, repuestos y herrajes para salas de baño',
  (SELECT id FROM public.categories WHERE slug = 'salas-de-bano'),
  1,
  40,
  true
)
ON CONFLICT (slug) DO UPDATE SET
  parent_id = EXCLUDED.parent_id,
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  depth = EXCLUDED.depth,
  sort_order = EXCLUDED.sort_order,
  is_active = EXCLUDED.is_active;

COMMIT;
