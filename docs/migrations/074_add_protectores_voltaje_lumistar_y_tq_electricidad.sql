-- =============================================================================
-- Migración 074: Protectores de Voltaje Lumistar y TQ para Línea Electricidad
-- =============================================================================
-- Archivo: docs/migrations/074_add_protectores_voltaje_lumistar_y_tq_electricidad.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-04
--
-- Productos agregados:
--   1. Protector de Voltaje 110V para Equipos Electrónicos 3 Tomas Lumistar
--   2. Protector de Voltaje 220V Bornera Cable-Cable Lumistar
--   3. Protector de Voltaje 110V Bornera Cable-Cable Lumistar
--   4. Protector de Voltaje Digital 120V Bornera 30A TQ
--   5. Protector de Voltaje Digital 220V Bornera 30A TQ
-- =============================================================================

BEGIN;

-- Registrar marca 'TQ' si no existe
INSERT INTO public.brands (name, slug, is_active)
VALUES ('TQ', 'tq', true)
ON CONFLICT (slug) DO NOTHING;

-- 1. Protector de Voltaje 110V para Equipos Electrónicos 3 Tomas Lumistar
INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  brand_id,
  category_id,
  is_casheable,
  specs
)
VALUES (
  'Protector de Voltaje 110V para Equipos Electrónicos 3 Tomas Lumistar',
  'protector-voltaje-110v-equipos-electronicos-3-tomas-lumistar',
  'LUM-PROT-110V-3T',
  'Protector de voltaje y supresor de picos 120V con 3 tomas NEMA aterrizadas frontales para equipos electrónicos, computación, audio y video. Protege contra sobrevoltaje, bajo voltaje y transitorios eléctricos con ciclo de espera automático e indicadores LED.',
  'Protector electrónico de voltaje y supresor de transitorios de sobretensión marca Lumistar (120V~, 50/60 Hz), diseñado especialmente para salvaguardar equipos electrónicos delicados y de computación frente a perturbaciones de la red eléctrica, cortes repentinos, picos de voltaje y fluctuaciones severas. Cuenta con 3 tomas de corriente frontales NEMA 5-15R con conexión a tierra que permiten conectar simultáneamente múltiples dispositivos: televisores, computadoras de escritorio, laptops, monitores, impresoras, consolas de videojuegos, sistemas de audio, teatros en casa, decodificadores y routers/módems. Incorpora un circuito electrónico microcontrolado de desconexión rápida por alto voltaje y bajo voltaje, así como un temporizador inteligente de ciclo de espera (reconexión retardada de seguridad) para disipar corrientes residuales antes de restablecer el suministro. Panel frontal con luces indicadoras LED de estado: Sobre Voltaje (rojo), Bajo Voltaje (rojo) y Ciclo de Espera / Voltaje Normal (verde). Enchufe posterior polarizado NEMA 5-15P con clavija de tierra para conexión directa y firme a la pared sin cables colgantes.',
  (SELECT id FROM public.brands WHERE slug = 'lumistar' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 21,
    'voltajeNominal', '110V - 120V AC',
    'frecuencia', '50 / 60 Hz',
    'capacidad', '15 Amp / 1800 W',
    'tomas', '3 Tomas NEMA 5-15R frontales aterrizadas',
    'enchufe', 'Macho NEMA 5-15P polarizado con puesta a tierra',
    'tiempoRetardo', 'Aprox. 15 a 30 segundos (ciclo de espera para electrónica)',
    'indicadores', '3 LEDs: Sobre Voltaje, Bajo Voltaje, Ciclo de Espera / Voltaje Normal',
    'aplicaciones', 'Televisores, computadoras, laptops, consolas de video, routers, modems, equipos de audio y sonido',
    'tags', jsonb_build_array(
      'protector de voltaje',
      'protector lumistar',
      'protector 110v',
      'protector 3 tomas',
      'protector equipos electronicos',
      'supresor de picos',
      'protector para computadoras',
      'protector para tv',
      'lumistar',
      'electricidad'
    )
  )
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  is_casheable = EXCLUDED.is_casheable,
  specs = EXCLUDED.specs,
  updated_at = now();

-- 2. Protector de Voltaje 220V Bornera Cable-Cable Lumistar
INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  brand_id,
  category_id,
  is_casheable,
  specs
)
VALUES (
  'Protector de Voltaje 220V Bornera Cable-Cable Lumistar',
  'protector-voltaje-220v-bornera-cable-cable-lumistar',
  'LUM-PROT-220V-BORNERA',
  'Protector de voltaje monofásico/bifásico 220V superficial con bornera de conexión interna (cable a cable) para aires acondicionados y refrigeración comercial. Incluye potenciómetros analógicos para ajuste fino de voltaje y temporizador de retardo, interruptor ON/OFF y 4 LEDs de diagnóstico.',
  'Protector de voltaje industrial y comercial de conexión fija por bornera borna-a-borna marca Lumistar (208V / 220V / 240V AC), diseñado para la protección integral de compresores de refrigeración, sistemas de climatización, cavas cuarto, congeladores y aires acondicionados tipo split o de ventana de hasta 36,000 - 48,000 BTU (compresores de hasta 3 HP - 5 HP o contactores asociados). Su robusto bloque de terminales de tornillo tipo bornera (conexión directa Cable-Cable: Entrada Línea-Línea/Neutro-Tierra y Salida Línea-Línea/Neutro-Tierra) garantiza una instalación limpia y segura sin recalentamientos ni falsos contactos en cargas pesadas. Incorpora tapa frontal abatible protectora con dos controles analógicos ajustables por perilla: perilla de ajuste de rango de voltaje mínimo y perilla de ajuste de tiempo de retardo (temporizador para descompresión segura de gases en el ciclo de refrigeración). Dispone de interruptor basculante lateral de encendido y apagado manual, y 4 indicadores LED de estado: Sobre Voltaje, Bajo Voltaje, Ciclo de Espera y Voltaje Normal. Carcasa ignífuga con orejetas de fijación para anclaje a pared.',
  (SELECT id FROM public.brands WHERE slug = 'lumistar' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 22,
    'voltajeNominal', '208V - 220V - 240V AC',
    'frecuencia', '50 / 60 Hz',
    'tipoConexion', 'Bornera de tornillos para cable directo (Entrada y Salida Cable-Cable con Tierra)',
    'ajustes', 'Perilla de ajuste de voltaje y perilla de temporizador de retardo (Ajuste de Tiempo)',
    'indicadores', '4 LEDs: Sobre Voltaje, Bajo Voltaje, Ciclo de Espera, Voltaje Normal',
    'interruptor', 'Basculante ON / OFF integrado',
    'aplicaciones', 'Aires acondicionados split y ventana 220V, refrigeradores comerciales, cavas, congeladores y compresores',
    'tags', jsonb_build_array(
      'protector de voltaje',
      'protector 220v',
      'protector bornera',
      'protector lumistar 220v',
      'protector cable a cable',
      'aire acondicionado',
      'refrigeracion',
      'lumistar',
      'electricidad'
    )
  )
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  is_casheable = EXCLUDED.is_casheable,
  specs = EXCLUDED.specs,
  updated_at = now();

-- 3. Protector de Voltaje 110V Bornera Cable-Cable Lumistar
INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  brand_id,
  category_id,
  is_casheable,
  specs
)
VALUES (
  'Protector de Voltaje 110V Bornera Cable-Cable Lumistar',
  'protector-voltaje-110v-bornera-cable-cable-lumistar',
  'LUM-PROT-110V-BORNERA',
  'Protector de voltaje 110V - 120V superficial con bornera para cableado directo (cable a cable) para refrigeradores, congeladores, enfriadores de agua y aires acondicionados 110V. Cuenta con perillas de calibración de voltaje y retardo, switch ON/OFF, bornera interna y 4 LEDs de estado.',
  'Protector de voltaje superficial con conexión directa por bornera borna-a-borna marca Lumistar para circuitos de 110V - 120V AC, diseñado para instalaciones de alta exigencia donde los equipos de refrigeración o climatización se alimentan directamente por cableado sin tomacorrientes convencionales. Idóneo para proteger refrigeradores domésticos de gran capacidad, congeladores horizontales y verticales, enfriadores de botellas, vitrinas comerciales, cavas pequeñas y aires acondicionados de 110V. Su bornera de conexión interna de tornillo para cable-cable (Entrada L, N, GND y Salida L, N, GND) evita desconexiones accidentales y soporta corrientes de arranque intensas. Cuenta con visor protector abatible que resguarda dos perillas de ajuste analógico: calibración de voltaje mínimo/máximo y temporizador de retardo regulable para garantizar el alivio de presiones en el compresor antes del reencendido. Incluye interruptor basculante lateral de marcha/paro y 4 luces LED de diagnóstico (Sobre Voltaje, Bajo Voltaje, Ciclo de Espera y Voltaje Normal). Respaldado por 3 años de garantía comercial.',
  (SELECT id FROM public.brands WHERE slug = 'lumistar' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 23,
    'voltajeNominal', '110V - 120V AC',
    'frecuencia', '50 / 60 Hz',
    'tipoConexion', 'Bornera de tornillos para cable directo (Entrada y Salida Cable-Cable con Tierra)',
    'ajustes', 'Perilla de ajuste de voltaje y perilla de ajuste de tiempo de retardo',
    'indicadores', '4 LEDs: Sobre Voltaje, Bajo Voltaje, Ciclo de Espera, Voltaje Normal',
    'interruptor', 'Basculante ON / OFF integrado',
    'garantia', '3 Años de garantía de fábrica',
    'aplicaciones', 'Neveras, congeladores, vitrinas refrigeradas, enfriadores, aires acondicionados 110V y compresores',
    'tags', jsonb_build_array(
      'protector de voltaje',
      'protector 110v',
      'protector bornera',
      'protector lumistar 110v',
      'protector cable a cable',
      'refrigeracion',
      'neveras',
      'congeladores',
      'lumistar',
      'electricidad'
    )
  )
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  is_casheable = EXCLUDED.is_casheable,
  specs = EXCLUDED.specs,
  updated_at = now();

-- 4. Protector de Voltaje Digital 120V Bornera 30A TQ
INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  brand_id,
  category_id,
  is_casheable,
  specs
)
VALUES (
  'Protector de Voltaje Digital 120V Bornera 30A TQ',
  'protector-voltaje-digital-120v-bornera-30a-tq',
  'TQ-PBS120-1',
  'Protector de voltaje digital 120V 30A con voltímetro LED en tiempo real y bornera para cableado directo TQ (modelo TQ-PBS120-1). Protege contra alto y bajo voltaje en refrigeración, aire acondicionado, lavadoras y microondas con botones de ajuste digital y display numérico.',
  'Protector de voltaje digital inteligente de alto amperaje marca TQ (modelo TQ-PBS120-1 / TQ-PBS120-I) para servicio a 120V AC con capacidad nominal de 30 Amperios (3600W). Equipado con pantalla digital LED de 3 dígitos con voltímetro incorporado que monitorea continuamente y en tiempo real el valor exacto de tensión de la línea eléctrica, además de mostrar la cuenta regresiva numérica durante el ciclo de espera. Cuenta con botones frontales para programación y ajuste de parámetros (límites de corte por sobretensión, bajo voltaje y tiempo de reconexión). Diseñado especialmente para equipos de alta demanda como aires acondicionados, compresores de refrigeración, lavadoras automáticas, secadoras, hornos microondas y bombas de agua monofásicas. Su conexión por bornera reforzada de tornillo con tapa protectora asegura un amarre firme para conductores de grueso calibre. Dispone de interruptor basculante lateral para corte manual y sistema inteligente de desconexión instantánea ante anomalías críticas de la red.',
  (SELECT id FROM public.brands WHERE slug = 'tq' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 24,
    'modelo', 'TQ-PBS120-1',
    'voltajeNominal', '120V AC',
    'corrienteMaxima', '30 Amperios (30A / 3600W)',
    'frecuencia', '50 / 60 Hz',
    'pantalla', 'Display digital LED de 3 dígitos (Voltímetro digital y temporizador)',
    'botonesAjuste', 'Pulsadores frontales de configuración (subir, bajar, programar tiempo/voltaje)',
    'tipoConexion', 'Bornera de tornillos para cable directo',
    'interruptor', 'Basculante lateral ON / OFF',
    'aplicaciones', 'Aires acondicionados, refrigeración, cavas, lavadoras, microondas y motores 120V',
    'tags', jsonb_build_array(
      'protector de voltaje digital',
      'protector 120v digital',
      'protector tq',
      'protector bornera 30a',
      'tq-pbs120-1',
      'medidor de voltaje',
      'refrigeracion',
      'aire acondicionado',
      'tq',
      'electricidad'
    )
  )
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  is_casheable = EXCLUDED.is_casheable,
  specs = EXCLUDED.specs,
  updated_at = now();

-- 5. Protector de Voltaje Digital 220V Bornera 30A TQ
INSERT INTO public.products (
  name,
  slug,
  sku,
  short_desc,
  description,
  brand_id,
  category_id,
  is_casheable,
  specs
)
VALUES (
  'Protector de Voltaje Digital 220V Bornera 30A TQ',
  'protector-voltaje-digital-220v-bornera-30a-tq',
  'TQ-PBS220-1',
  'Protector de voltaje digital 220V 30A con voltímetro LED en tiempo real y bornera de conexión directa TQ (modelo TQ-PBS220-1). Pantalla digital de 3 dígitos, programación de límites de corte y temporizador para aires acondicionados split y cavas de refrigeración.',
  'Protector de voltaje digital de alta capacidad marca TQ (modelo TQ-PBS220-1 / TQ-PBS220-I) para redes bifásicas y monofásicas a 220V AC, con capacidad nominal de trabajo de hasta 30 Amperios continuos. Incorpora pantalla digital LED de 3 dígitos de alta visibilidad que funciona como voltímetro en tiempo real para visualizar el voltaje presente entre fases o fase-neutro, y muestra el conteo descendente del temporizador de protección. Permite programar con precisión digital mediante pulsadores frontales los umbrales de desconexión por alto y bajo voltaje, así como el tiempo de retardo antes de la reconexión. Especialmente diseñado para la protección de aires acondicionados split de gran tonelaje (12,000 a 48,000 BTU), compresores herméticos y semiherméticos de cavas cuarto, motores eléctricos de 220V, congeladores comerciales y equipos industriales livianos. Dispone de bornera de alta resistencia para acometidas de cable directo, interruptor basculante lateral de encendido/apagado y carcasa plástica retardante a la llama con fijación a pared.',
  (SELECT id FROM public.brands WHERE slug = 'tq' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 25,
    'modelo', 'TQ-PBS220-1',
    'voltajeNominal', '220V AC',
    'corrienteMaxima', '30 Amperios (30A)',
    'frecuencia', '50 / 60 Hz',
    'pantalla', 'Display digital LED de 3 dígitos (Voltímetro digital y temporizador)',
    'botonesAjuste', 'Pulsadores frontales de configuración (subir, bajar, programar tiempo/voltaje)',
    'tipoConexion', 'Bornera de tornillos para cable directo',
    'interruptor', 'Basculante lateral ON / OFF',
    'aplicaciones', 'Aires acondicionados split y ventana 220V, cavas frigoríficas, congeladores comerciales y compresores',
    'tags', jsonb_build_array(
      'protector de voltaje digital',
      'protector 220v digital',
      'protector tq 220v',
      'protector bornera 30a',
      'tq-pbs220-1',
      'medidor de voltaje digital',
      'aire acondicionado split',
      'refrigeracion',
      'tq',
      'electricidad'
    )
  )
)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_desc = EXCLUDED.short_desc,
  description = EXCLUDED.description,
  brand_id = EXCLUDED.brand_id,
  category_id = EXCLUDED.category_id,
  is_casheable = EXCLUDED.is_casheable,
  specs = EXCLUDED.specs,
  updated_at = now();

COMMIT;
