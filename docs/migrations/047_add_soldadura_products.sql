-- =============================================================================
-- Migración 047: Productos de Línea Soldadura
-- =============================================================================
-- Archivo: docs/migrations/047_add_soldadura_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-20
-- =============================================================================

BEGIN;

INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  is_casheable,
  brand_id,
  category_id,
  specs
)
VALUES
  -- 1. Máquina Soldar Inverter 200 Amp Ronix
  (
    'Máquina Soldar Inverter 200 Amp Ronix',
    'maquina-soldar-inverter-200-amp-ronix',
    'SOL-MAQ-INVERTER-200A-RONIX',
    'Máquina para soldar inverter de 200 Amp Ronix con tecnología IGBT, pantalla digital, encendido rápido y protección térmica para herrería y taller.',
    'Máquina de soldar inverter compacta y de alto rendimiento de 200 Amperios marca Ronix. Equipada con tecnología de transistores IGBT para un arco eléctrico estable y uniforme, menor consumo de energía y excelente penetración de soldadura en aceros al carbono, inoxidables y aleaciones. Cuenta con display digital para regulación exacta de corriente, funciones avanzadas de Hot Start (arranque en caliente rápido), Anti-Stick (evita que el electrodo se pegue a la pieza) y Arc Force (estabilizador dinámico de arco). Su carcasa metálica con ranuras de ventilación forzada y protección térmica garantiza jornadas de trabajo continuo con máxima seguridad.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ronix' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'amperaje', '200A',
      'amperajeMax', 200,
      'tipo', 'Inverter MMA / IGBT',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('máquina de soldar', 'maquina soldar inverter 200 amp', 'inverter 200a', 'ronix', 'soldadora', 'soldadura', 'igbt', 'herrería', 'mma'),
      'priority', 1
    )
  ),

  -- 2. Pinza Porta Electrodo 300 Amp
  (
    'Pinza Porta Electrodo 300 Amp',
    'pinza-porta-electrodo-300-amp',
    'SOL-PINZA-ELECTRODO-300A',
    'Pinza porta electrodo de 300 Amperios para herrería y talleres mecánicos con mordazas de bronce de alta conductividad y mango aislante antichoque.',
    'Pinza porta electrodo de 300 Amperios diseñada para brindar un agarre firme y estable de electrodos en ángulos de 45°, 90° y 180°. Construida con mandíbulas de aleación de bronce de excelente conductividad eléctrica para evitar sobrecalentamientos durante el pase de soldadura. Incorpora resorte de compresión de alta tensión para una sujeción sólida y mango estriado de resina aislante de alta resistencia al calor y al impacto, protegiendo al operador en todo momento.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'amperaje', '300A',
      'amperajeMax', 300,
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('pinza porta electrodo 300 amp', 'porta electrodo', '300 amp', '300a', 'pinza soldar', 'soldadura', 'electrodo', 'accesorios soldadura'),
      'priority', 2
    )
  ),

  -- 3. Pinza Porta Electrodo 800 Amp
  (
    'Pinza Porta Electrodo 800 Amp',
    'pinza-porta-electrodo-800-amp',
    'SOL-PINZA-ELECTRODO-800A',
    'Pinza porta electrodo pesada de 800 Amperios con cabezal aislante reforzado para uso industrial continuo y electrodos de grueso calibre.',
    'Pinza porta electrodo de uso extra pesado de 800 Amperios diseñada para aplicaciones industriales severas, calderería pesada y montaje estructural. Cuenta con mandíbulas de cobre forjado de gran espesor para soportar altos ciclos de trabajo sin recalentamiento, cabezal reforzado con aislamiento de alta rigidez dieléctrica contra salpicaduras y radiación, y mango ergonómico aislado para máxima seguridad y confort en soldadura pesada.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'amperaje', '800A',
      'amperajeMax', 800,
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('pinza porta electrodo 800 amp', 'porta electrodo 800a', '800 amp', '800a', 'pesada', 'industrial', 'soldadura', 'electrodo', 'accesorios soldadura'),
      'priority', 3
    )
  ),

  -- 4. Pinza para Tierra 500 Amp
  (
    'Pinza para Tierra 500 Amp',
    'pinza-para-tierra-500-amp',
    'SOL-PINZA-TIERRA-500A',
    'Pinza para masa y tierra de 500 Amperios fabricada en acero zincado de alta resistencia con cinta trenzada de cobre y mordazas de contacto firme.',
    'Pinza de conexión a tierra (masa) para soldadura por arco de 500 Amperios. Elaborada en lámina de acero galvanizado para resistencia a la deformación y corrosión, con resorte de alta presión que garantiza una fijación sólida sobre tuberías, vigas y láminas. Equipada con puente trenzado de cobre entre mordazas para garantizar la conducción óptima de corriente con mínima resistencia, evitando pérdidas de potencia y calentamiento durante la soldadura.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'amperaje', '500A',
      'amperajeMax', 500,
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('pinza para tierra 500 amp', 'pinza de masa', '500 amp', '500a', 'tierra', 'masa', 'acero', 'cobre', 'soldadura', 'accesorios soldadura'),
      'priority', 4
    )
  ),

  -- 5. Electrodos para Soldar 6013 - 7018 - 6010
  (
    'Electrodos para Soldar 6013 - 7018 - 6010',
    'electrodos-para-soldar-6013-7018-6010',
    'SOL-ELECTRODOS-6013-7018-6010',
    'Electrodos revestidos para soldadura por arco en especificaciones E6013 (rutílico), E7018 (bajo hidrógeno) y E6010 (celulósico de alta penetración).',
    'Electrodos revestidos de alta calidad para soldadura eléctrica por arco manual (SMAW / MMA). Disponibles en las especificaciones más demandadas del sector metalúrgico y de construcción: E6013 para herrería ligera, carpintería metálica y uniones limpias con fácil remoción de escoria; E7018 de bajo hidrógeno para uniones estructurales de alta resistencia y recipientes a presión; y E6010 celulósico de penetración profunda ideal para pases de raíz en tuberías y estructuras rígidas.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'gen-rico' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'soldadura' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'tipo', 'SMAW / MMA',
      'unidad', 'kg',
      'stockStatus', 'available',
      'tags', jsonb_build_array('electrodos 6013 - 7018 - 6010', 'electrodos', 'electrodo 6013', 'electrodo 7018', 'electrodo 6010', '6013', '7018', '6010', 'soldadura', 'varillas para soldar'),
      'priority', 5
    )
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  is_casheable = EXCLUDED.is_casheable,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  specs = EXCLUDED.specs;

COMMIT;
