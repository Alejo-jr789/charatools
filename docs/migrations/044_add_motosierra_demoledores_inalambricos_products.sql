-- =============================================================================
-- Migración 044: Herramientas Eléctricas Lote 3 (Motosierra, Demoledores, Inalámbricos)
-- =============================================================================
-- Archivo: docs/migrations/044_add_motosierra_demoledores_inalambricos_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-12
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
  -- 1. Motosierra a Gasolina 18" Ronix
  (
    'Motosierra a Gasolina 18" Ronix',
    'motosierra-a-gasolina-18-ronix',
    'HER-MOTOSIERRA-RONIX-18',
    'Motosierra profesional a gasolina Ronix con espada de 18" (450 mm), motor 2 tiempos de alta cilindrada y sistema de encendido fácil para tala y poda pesada.',
    'Motosierra profesional a gasolina Ronix equipada con barra y cadena de corte de 18 pulgadas (450 mm). Impulsada por motor de combustión a 2 tiempos de alto rendimiento, cuenta con sistema de lubricación automática de cadena, freno de seguridad de parada instantánea ante rebote y sistema antivibración para trabajo continuo. Diseñada para corte de troncos, desmonte agrícola, aserrado de madera en campo y trabajos forestales exigentes.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ronix' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('motosierra', 'motosierra a gasolina', 'ronix', 'espada 18', 'tala', 'poda', 'madera', 'herramientas eléctricas', 'motorizada'),
      'priority', 11
    )
  ),

  -- 2. Martillo Demoledor Alámbrico 1100W Ronix
  (
    'Martillo Demoledor Alámbrico 1100W Ronix',
    'martillo-demoledor-alambrico-1100w-ronix',
    'HER-DEMOLEDOR-RONIX-1100W',
    'Martillo demoledor alámbrico de 1100W Ronix de alta energía de impacto para rotura de pisos, paredes, mampostería y concreto.',
    'Martillo demoledor eléctrico alámbrico Ronix de 1100W con cuerpo compacto y potente mecanismo electro-neumático de percusión. Diseñado para ofrecer máxima tasa de demolición en muros, vigas, lozas y zanjas. Incorpora empuñadura ergonómica antivibratoria tipo ''D'' orientable a 360°, carcasa de engranajes de aleación de magnesio para disipación térmica óptima y sistema de bloqueo continuo para operaciones prolongadas sin fatiga.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ronix' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'powerWatts', 1100,
      'tags', jsonb_build_array('martillo demoledor', 'demoledor 1100w', 'ronix', 'demolición', 'concreto', 'cincelado', 'herramientas eléctricas', 'alambrico'),
      'priority', 12
    )
  ),

  -- 3. Martillo Demoledor Cincelador Hexagonal INGCO
  (
    'Martillo Demoledor Cincelador Hexagonal INGCO',
    'martillo-demoledor-hexagonal-ingco',
    'HER-DEMOLEDOR-HEX-INGCO',
    'Martillo demoledor pesado INGCO con encastre hexagonal y maletín de transporte rígido para demolición estructural pesada en pavimentos y hormigón.',
    'Martillo demoledor cincelador industrial INGCO diseñado para trabajos pesados de demolición civil, rotura de concreto armado, zanjeo y asfalto. Cuenta con robusto sistema de encastre hexagonal de sujeción segura, empuñadura auxiliar articulada antifatiga, amortiguación interna para absorber impactos y caja de transporte rígida de alta durabilidad para fácil traslado y protección en faena.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'und',
      'stockStatus', 'available',
      'tags', jsonb_build_array('martillo demoledor', 'cincelador', 'hexagonal', 'ingco', 'demolición pesada', 'pavimento', 'concreto', 'herramientas eléctricas', 'alambrico'),
      'priority', 13
    )
  ),

  -- 4. Taladro Destornillador Inalámbrico 12V INGCO (Kit con Maletín y 2 Baterías)
  (
    'Taladro Destornillador Inalámbrico 12V INGCO (Kit con Maletín y 2 Baterías)',
    'taladro-destornillador-inalambrico-12v-ingco',
    'HER-DESTORNILLADOR-12V-INGCO',
    'Kit destornillador taladro inalámbrico 12V INGCO con mandril sin llave, 2 baterías de iones de litio, punta doble y maletín plástico.',
    'Taladro y destornillador inalámbrico compacto de 12V INGCO. Ideal para ensamblaje de muebles, instalaciones eléctricas, tabiquería y carpintería en espacios reducidos. Dispone de múltiples posiciones de torque regulable para evitar barrido de tornillos, luz LED frontal de trabajo integrada, velocidad variable reversible y mandril autoajustable. El kit incluye 2 baterías de litio de 12V, cargador rápido, punta de atornillar doble y maletín rígido para transporte ordenado.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'kit',
      'stockStatus', 'available',
      'voltageVolts', 12,
      'tags', jsonb_build_array('destornillador inalámbrico', 'taladro inalámbrico', '12v', 'ingco', 'atornillador', 'batería litio', 'maletín', 'herramientas eléctricas', 'inalambrico'),
      'priority', 14
    )
  ),

  -- 5. Taladro Percutor Inalámbrico 20V Brushless INGCO (Kit 2 Baterías 2.0Ah y Maletín)
  (
    'Taladro Percutor Inalámbrico 20V Brushless INGCO (Kit 2 Baterías 2.0Ah y Maletín)',
    'taladro-percutor-inalambrico-20v-brushless-ingco',
    'HER-TALADRO-20V-BRUSHLESS-INGCO',
    'Taladro percutor inalámbrico 20V motor Brushless (sin carbones) plataforma P20S INGCO con 2 baterías de 2.0Ah, cargador, accesorios y maletín.',
    'Taladro percutor inalámbrico de alto rendimiento INGCO plataforma P20S con motor Brushless sin escobillas, que ofrece mayor autonomía, potencia y vida útil libre de mantenimiento. Equipado con 3 modos de trabajo (atornillador con embrague regulable, taladro de rotación y rotopercutor para mampostería), mandril metálico de 13 mm sin llave, 2 velocidades mecánicas y luz LED integrada. Incluye 2 baterías de 20V 2.0Ah, cargador inteligente, juego de brocas y maletín rígido de transporte.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'herramientas-electricas' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'unidad', 'kit',
      'stockStatus', 'available',
      'voltageVolts', 20,
      'tags', jsonb_build_array('taladro inalámbrico', 'taladro percutor', 'brushless', '20v', 'p20s', 'ingco', 'sin carbones', 'concreto', 'maletín', 'herramientas eléctricas', 'inalambrico'),
      'priority', 15
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
  specs = EXCLUDED.specs,
  updated_at = now();

COMMIT;
