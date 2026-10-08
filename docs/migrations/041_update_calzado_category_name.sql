-- Migración 041: Actualizar nombre de subcategoría a "Calzado"
UPDATE public.categories
SET name = 'Calzado'
WHERE slug = 'calzado';
