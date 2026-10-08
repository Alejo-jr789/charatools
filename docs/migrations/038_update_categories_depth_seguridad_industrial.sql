-- =============================================================================
-- Migración 038: Actualizar Depth = 1 en Subcategorías de Seguridad Industrial
-- =============================================================================
-- Archivo: docs/migrations/038_update_categories_depth_seguridad_industrial.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-08
-- =============================================================================

BEGIN;

UPDATE public.categories
SET depth = 1
WHERE slug IN ('proteccion-respiratoria', 'senalizacion-vial', 'proteccion-corporal')
  AND parent_id IS NOT NULL;

COMMIT;
