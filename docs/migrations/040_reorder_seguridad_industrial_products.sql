-- Migración 040: Reordenar productos de Seguridad Industrial por grupos EPP
-- Cascos (1-2), Lentes y Visores (3-7), Respiratoria (8), Corporal (9), Guantes (10-18), Calzado (19), Vialidad (20-22)

-- 1. Cascos de Seguridad
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '1'::jsonb, true)
WHERE slug = 'casco-de-seguridad-estandar';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '2'::jsonb, true)
WHERE slug = 'casco-seguridad-certificado-emg';

-- 2. Lentes y Visores
UPDATE public.products
SET specs = jsonb_set(
  jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '3'::jsonb, true),
  '{subcategory}', '"lentes"'::jsonb, true
)
WHERE slug = 'protector-facial-ratchet-ajuste-pantalla';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '4'::jsonb, true)
WHERE slug = 'lentes-seguridad-tipo-avispa-espejado';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '5'::jsonb, true)
WHERE slug = 'lentes-seguridad-cuadrado-tipo-elite';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '6'::jsonb, true)
WHERE slug = 'monogafas-directa';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '7'::jsonb, true)
WHERE slug = 'monolente-especial-serie-pro';

-- 3. Protección Respiratoria
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '8'::jsonb, true)
WHERE slug = 'mascarilla-proteccion-respiratoria-kn95';

-- 4. Protección Corporal
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '9'::jsonb, true)
WHERE slug = 'delantal-de-pvc-impermeable-emg';

-- 5. Guantes de Protección
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '10'::jsonb, true)
WHERE slug = 'guantes-nitrilo-negro-progloves-caja-100';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '11'::jsonb, true)
WHERE slug = 'guantes-nitrilo-verde-calibre-18';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '12'::jsonb, true)
WHERE slug = 'guantes-latex-negro-industrial';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '13'::jsonb, true)
WHERE slug = 'guantes-neopreno-negro-16';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '14'::jsonb, true)
WHERE slug = 'guantes-mecanico-premium-nitrilo';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '15'::jsonb, true)
WHERE slug = 'guantes-kleenguard-recubrimiento-latex';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '16'::jsonb, true)
WHERE slug = 'guantes-tejido-puntos-pvc';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '17'::jsonb, true)
WHERE slug = 'guantes-carnaza-tela-reforzado-palma-101r';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '18'::jsonb, true)
WHERE slug = 'guantes-carnaza-largo-soldador-16';

-- 6. Calzado de Seguridad
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '19'::jsonb, true)
WHERE slug = 'botas-de-pvc-sin-puntera';

-- 7. Señalización y Vialidad
UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '20'::jsonb, true)
WHERE slug = 'chaleco-vial-cinta-reflectiva';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '21'::jsonb, true)
WHERE slug = 'cono-vial-flexible-base-pesada';

UPDATE public.products
SET specs = jsonb_set(COALESCE(specs, '{}'::jsonb), '{priority}', '22'::jsonb, true)
WHERE slug = 'cinta-seguridad-peligro-no-pase';
