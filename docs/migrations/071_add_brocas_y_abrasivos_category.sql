-- =============================================================================
-- Migración 071: Línea Principal Brocas y Abrasivos
-- =============================================================================
-- Archivo: docs/migrations/071_add_brocas_y_abrasivos_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-02
-- =============================================================================

BEGIN;

-- Crear o actualizar categoría principal 'Brocas y Abrasivos' (depth: 0, parent_id: NULL)
INSERT INTO public.categories (name, slug, description, depth, parent_id, is_active)
VALUES
  (
    'Brocas y Abrasivos',
    'brocas-y-abrasivos',
    'Brocas para concreto, metal, madera y porcelanato, discos de corte fino, desbaste, lijas, copas diamantadas y abrasivos industriales',
    0,
    NULL,
    true
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  depth = 0,
  parent_id = NULL,
  is_active = true;

COMMIT;
