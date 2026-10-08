-- Migración 039: Reordenar productos de Salas de Baño
-- Orden lógico solicitado: Inodoros (1 a 4), Lavamanos (5), Accesorios (6 a 13)

-- 1. Inodoros
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '1'::jsonb, true)
WHERE slug = 'inodoro-vinci-one-piece';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '2'::jsonb, true)
WHERE slug = 'inodoro-valencia-boton';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '3'::jsonb, true)
WHERE slug = 'inodoro-rimini-rf-boton-lateral';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '4'::jsonb, true)
WHERE slug = 'inodoro-coronet-manija';

-- 2. Lavamanos y Pedestales
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '5'::jsonb, true)
WHERE slug = 'lavamanos-shelby-pedestal-o-para-colgar';

-- 3. Accesorios
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '6'::jsonb, true)
WHERE slug = 'kit-herraje-poceta';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '7'::jsonb, true)
WHERE slug = 'asiento-estandar-plus';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '8'::jsonb, true)
WHERE slug = 'asiento-montecristo-elongado';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '9'::jsonb, true)
WHERE slug = 'boton-superior-cromado';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '10'::jsonb, true)
WHERE slug = 'boton-lateral-cromado-largo';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '11'::jsonb, true)
WHERE slug = 'manija-plastica-cromada';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '12'::jsonb, true)
WHERE slug = 'flapper-3-pulgadas';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '13'::jsonb, true)
WHERE slug = 'flapper-2-pulgadas';
