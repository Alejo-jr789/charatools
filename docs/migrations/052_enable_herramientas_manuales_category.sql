-- =============================================================================
-- Migración 052: Línea Principal Herramientas Manuales
-- =============================================================================
-- Archivo: docs/migrations/052_enable_herramientas_manuales_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-22
-- =============================================================================

BEGIN;

-- Asegurar categoría principal 'Herramientas Manuales'
INSERT INTO public.categories (name, slug, description, depth, parent_id, is_active)
VALUES
  ('Herramientas Manuales', 'herramientas-manuales', 'Alicates, destornilladores, llaves de apriete, dados, martillos y herramientas de mano para taller y construcción', 0, NULL, true)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  depth = 0,
  parent_id = NULL,
  is_active = true;

COMMIT;
