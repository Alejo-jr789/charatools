-- =============================================================================
-- Migración 078: Generadores Eléctricos Portátiles INGCO y WADFOW (Línea Electricidad)
-- =============================================================================
-- Archivo: docs/migrations/078_add_generadores_electricos_ingco_y_wadfow_electricidad.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-06
--
-- Productos agregados:
--   1. Generador Eléctrico 800W 2 Tiempos a Gasolina INGCO (GE8002 / UGE8002)
--   2. Generador Eléctrico 1400W (1.4 kW) 4 Tiempos a Gasolina INGCO (GE15005 / UGE15005)
--   3. Generador Eléctrico 3000W (3.0 kW) 4 Tiempos a Gasolina WADFOW (WGEAA05 / UWGEAA05)
-- =============================================================================

BEGIN;

-- 1. Generador Eléctrico 800W 2 Tiempos a Gasolina INGCO
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
  'Generador Eléctrico 800W 2 Tiempos a Gasolina INGCO',
  'generador-electrico-800w-2t-gasolina-ingco',
  'ING-GE8002-800W',
  'Generador eléctrico portátil a gasolina de 800W INGCO con motor de 2 tiempos (63cc). Compacto, ligero y fácil de transportar con manija integrada, ideal para iluminación de emergencia, camping y herramientas ligeras.',
  'Generador eléctrico portátil a gasolina INGCO con potencia máxima de 800W (0.8 kW) y potencia nominal continua de 650W (0.65 kW). Equipado con un confiable motor de 2 tiempos de 63 cc refrigerado por aire, arranque manual retráctil suave y tanque de combustible de 4.0 litros que brinda una excelente autonomía de trabajo continuo. Diseñado con una estructura compacta y ultraligera (~16 kg) provista de una manija superior ergonómica para facilitar su traslado inmediato a cualquier lugar. Cuenta con toma de salida monofásica de corriente alterna (110V-120V / 220V según configuración), interruptor térmico protector contra sobrecargas (circuit breaker) y patas de goma antivibratorias para una operación estable y silenciosa. Funciona con mezcla de gasolina sin plomo y aceite para motores de dos tiempos (2T). Solución ideal para respaldo eléctrico en hogares ante cortes de luz, iluminación de puestos comerciales, salidas de camping, fincas y alimentación de herramientas eléctricas portátiles ligeras.',
  (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 33,
    'marca', 'INGCO',
    'modelo', 'GE8002 / UGE8002',
    'potenciaMaxima', '800W (0.8 kW)',
    'potenciaNominal', '650W (0.65 kW)',
    'tipoMotor', '2 Tiempos (2T) monocilíndrico refrigerado por aire',
    'cilindrada', '63 cc',
    'sistemaArranque', 'Manual retráctil (Recoil / tirador)',
    'capacidadTanque', '4.0 Litros',
    'combustible', 'Gasolina sin plomo con mezcla de aceite 2T (relación 50:1)',
    'velocidadNominal', '3.000 / 3.600 RPM',
    'voltajeFrecuencia', '110V - 120V / 220V ~ 50/60 Hz',
    'panelControl', '1 Tomacorriente AC monofásico con disyuntor térmico protector de sobrecarga (circuit breaker)',
    'pesoAproximado', '16 kg',
    'aplicaciones', 'Iluminación doméstica y comercial de emergencia, acampada, ventiladores, televisores pequeños y herramientas ligeras',
    'tags', jsonb_build_array(
      'generador eléctrico',
      'planta eléctrica',
      'generador a gasolina',
      'generador 800w',
      'generador 2 tiempos',
      'ingco',
      'generador portátil',
      'iluminación de emergencia',
      'camping',
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

-- 2. Generador Eléctrico 1400W (1.4 kW) 4 Tiempos a Gasolina INGCO
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
  'Generador Eléctrico 1400W (1.4 kW) 4 Tiempos a Gasolina INGCO',
  'generador-electrico-1400w-4t-gasolina-ingco',
  'ING-GE15005-1400W',
  'Generador eléctrico a gasolina INGCO de 1400W (1.4 kW) potencia pico / 1200W nominal con motor de 4 tiempos OHV (98cc). Chasis tubular de protección, tanque de 5.5L y voltímetro analógico para respaldo residencial y comercio.',
  'Generador eléctrico a gasolina INGCO de alto rendimiento con potencia máxima de 1400W (1.4 kW) y potencia nominal constante de 1200W (1.2 kW). Incorpora un eficiente y duradero motor de 4 tiempos OHV de 98 cc refrigerado por aire, con cárter de aceite independiente (no requiere mezclar aceite con gasolina) que reduce las emisiones y optimiza el consumo de combustible. Posee un robusto bastidor perimetral de tubo de acero reforzado que protege los componentes internos contra golpes y vibraciones, además de servir como asa de agarre y transporte. Su tanque de combustible de 5.5 litros de capacidad proporciona una prolongada autonomía operativa. El panel de mandos frontal está equipado con tomacorriente AC, voltímetro analógico para monitoreo en tiempo real de la tensión generada, interruptor de encendido hermético y disyuntor térmico protector (circuit breaker) contra sobrecargas o cortocircuitos. Ideal para respaldo eléctrico doméstico en fallas de servicio (nevera pequeña, televisores, luces, ventiladores, enrutadores Wi-Fi), talleres móviles y pequeños comercios.',
  (SELECT id FROM public.brands WHERE slug = 'ingco' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 34,
    'marca', 'INGCO',
    'modelo', 'GE15005 / UGE15005',
    'potenciaMaxima', '1400W (1.4 kW)',
    'potenciaNominal', '1200W (1.2 kW)',
    'tipoMotor', '4 Tiempos (4T) OHV monocilíndrico refrigerado por aire',
    'cilindrada', '98 cc',
    'sistemaArranque', 'Manual retráctil (Recoil / tirador)',
    'sistemaEncendido', 'T.C.I.',
    'capacidadTanque', '5.5 Litros',
    'combustible', 'Gasolina sin plomo (cárter independiente para aceite 4T SAE 10W-30)',
    'panelControl', 'Voltímetro analógico, interruptor general, 1 tomacorriente AC y disyuntor térmico protector (circuit breaker)',
    'chasis', 'Estructura tubular de acero reforzado con apoyos de goma antivibratoria',
    'pesoAproximado', '24 kg',
    'aplicaciones', 'Respaldo eléctrico doméstico (luces, ventiladores, neveras de bajo consumo, TV, router) y puestos comerciales',
    'tags', jsonb_build_array(
      'generador eléctrico',
      'planta eléctrica',
      'generador a gasolina',
      'generador 1400w',
      'generador 1.4kw',
      'generador 4 tiempos',
      'ingco',
      'motor ohv',
      'respaldo eléctrico',
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

-- 3. Generador Eléctrico 3000W (3.0 kW) 4 Tiempos a Gasolina WADFOW
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
  'Generador Eléctrico 3000W (3.0 kW) 4 Tiempos a Gasolina WADFOW',
  'generador-electrico-3000w-4t-gasolina-wadfow',
  'WAD-WGEAA05-3000W',
  'Generador eléctrico industrial a gasolina WADFOW de 3000W (3.0 kW) potencia máxima / 2800W nominal con motor de 4 tiempos OHV (210cc). Tanque de 15L de gran autonomía, regulador AVR y salidas duales AC para servicio pesado.',
  'Generador eléctrico industrial a gasolina WADFOW diseñado para servicio pesado, respaldo residencial completo y suministro continuo en obras o comercios. Ofrece una potencia máxima de arranque de 3000W (3.0 kW) y una potencia nominal continua de 2800W (2.8 kW), impulsado por un potente motor a gasolina de 4 tiempos OHV de 210 cc refrigerado por aire con sistema de encendido electrónico T.C.I. y arranque manual retráctil de alta compresión. Equipado con un tanque de combustible de gran capacidad de 15 Litros con indicador de nivel superior, que garantiza largas jornadas de trabajo continuo sin repostajes frecuentes. Incorpora tecnología de regulación automática de voltaje (AVR) para una onda de tensión limpia y estable, protegiendo equipos electrodomésticos, neveras, congeladores, herramientas y dispositivos electrónicos. Su panel de control frontal incluye dos tomacorrientes de salida AC, voltímetro analógico, borne de conexión a tierra, interruptor térmico protector de circuito y sensor de bajo nivel de aceite con apagado automático de seguridad para proteger el motor. Construido sobre un bastidor de acero tubular perimetral reforzado con soportes antivibración de alta absorción.',
  (SELECT id FROM public.brands WHERE slug = 'wadfow' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 35,
    'marca', 'Wadfow',
    'modelo', 'WGEAA05 / UWGEAA05',
    'potenciaMaxima', '3000W (3.0 kW)',
    'potenciaNominal', '2800W (2.8 kW)',
    'tipoMotor', '4 Tiempos (4T) OHV monocilíndrico refrigerado por aire',
    'cilindrada', '210 cc',
    'sistemaArranque', 'Manual retráctil (Recoil / tirador de alta compresión)',
    'sistemaEncendido', 'T.C.I.',
    'regulacionVoltaje', 'Sistema AVR (Regulador Automático de Voltaje)',
    'capacidadTanque', '15 Litros con indicador visual de nivel',
    'combustible', 'Gasolina sin plomo (cárter de aceite independiente 4T con sensor de bajo nivel)',
    'seguridad', 'Sensor y protección por bajo nivel de aceite con apagado automático del motor',
    'panelControl', '2 Tomacorrientes AC, voltímetro analógico, disyuntor térmico de circuito (breaker) y terminal de puesta a tierra',
    'chasis', 'Jaula perimetral en tubo de acero de alta resistencia con tacos antivibración de absorción reforzada',
    'pesoAproximado', '42 kg',
    'aplicaciones', 'Respaldo eléctrico para hogares completos, negocios, refrigeración pesada, taladros, esmeriles y trabajo en sitio sin red eléctrica',
    'tags', jsonb_build_array(
      'generador eléctrico',
      'planta eléctrica',
      'generador a gasolina',
      'generador 3000w',
      'generador 3kw',
      'generador 4 tiempos',
      'wadfow',
      'motor 210cc',
      'tanque 15l',
      'avr',
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
