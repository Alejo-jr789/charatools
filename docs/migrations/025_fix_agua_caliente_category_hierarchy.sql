-- =============================================================================
-- Migración 025: Corrección de Jerarquía de Categorías Agua Caliente
-- =============================================================================
-- Archivo: docs/migrations/025_fix_agua_caliente_category_hierarchy.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-05
-- Descripción: Mueve 'tuberia-agua-caliente' y 'conexiones-agua-caliente' fuera
--              de las categorías principales (depth 0, parent_id null) y las 
--              asigna como sub-ítems hijos (depth 2) de 'linea-agua-caliente'.
-- =============================================================================

BEGIN;

-- 1. Asegurar que Línea Agua Caliente sea subcategoría de Plomería (depth = 1)
UPDATE public.categories 
SET parent_id = (SELECT id FROM public.categories WHERE slug = 'plomeria' LIMIT 1),
    depth = 1
WHERE slug = 'linea-agua-caliente';

-- 2. Asignar Tubería Agua Caliente y Conexiones Agua Caliente como hijos de Línea Agua Caliente (depth = 2)
UPDATE public.categories 
SET parent_id = (SELECT id FROM public.categories WHERE slug = 'linea-agua-caliente' LIMIT 1),
    depth = 2
WHERE slug IN ('tuberia-agua-caliente', 'conexiones-agua-caliente');

COMMIT;
