-- =============================================================================
-- Migración 026: Eliminar subcategoría Sanitarios de Salas de Baño
-- =============================================================================
-- Archivo: docs/migrations/026_remove_sanitarios_category.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-07
-- Descripción: Remueve la subcategoría 'sanitarios' bajo 'salas-de-bano',
--              dejando únicamente 'inodoros' y 'lavamanos-pedestales'.
-- =============================================================================

BEGIN;

DELETE FROM public.categories 
WHERE slug = 'sanitarios';

COMMIT;
