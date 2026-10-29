-- =============================================================================
-- Migración 067: Productos para Línea Electricidad (Teipe, Detector, Multímetro, Pinza Amperimétrica y Pelacable)
-- =============================================================================
-- Archivo: docs/migrations/067_add_electricidad_teipe_detector_multimetro_pinza_pelacable.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-29
--
-- Productos agregados:
--   1. Teipe Eléctrico de PVC en Colores (Cobra)
--   2. Detector de Voltaje Alterno Sin Contacto Tolsen
--   3. Multímetro Digital DT9205A con Puntas de Prueba
--   4. Pinza Amperimétrica Digital con Estuche
--   5. Pinza Pelacable Automática Frontal
-- =============================================================================

BEGIN;

-- 1. Teipe Eléctrico de PVC en Colores
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
  'Teipe Eléctrico de PVC en Colores',
  'teipe-electrico-pvc-colores',
  'ELEC-TEIPE-PVC-COL',
  'Cinta aislante de PVC retardante a la llama para aislamiento eléctrico hasta 600V. Disponible en colores negro, blanco, rojo, azul, amarillo y verde para codificación de fases y circuitos.',
  'Teipe eléctrico / cinta aislante de policloruro de vinilo (PVC) con adhesivo de caucho de alta adherencia y elasticidad. Diseñado para aislamiento primario en empalmes de cables de hasta 600V, sujeción de arneses y codificación cromática de fases, neutro y tierra en tableros residenciales e industriales. Gran resistencia a la abrasión, humedad, álcalis, ácidos y rayos UV. Propiedad autoextinguible y retardante a la llama, soporta rangos de temperatura de operación de hasta 80 °C. Medida estándar de 19 mm de ancho (3/4") x 18 metros de longitud (20 yd).',
  (SELECT id FROM public.brands WHERE slug = 'cobra' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 14,
    'material', 'Policloruro de vinilo (PVC) con adhesivo de caucho sensible a la presión',
    'voltajeMaximo', '600 V',
    'temperaturaOperacion', '-10 °C a 80 °C',
    'dimensiones', '19 mm (3/4") x 18 m (20 yd) x 0.15 mm',
    'propiedades', 'Retardante de llama, autoextinguible, resistente a la intemperie y rayos UV',
    'variantLabel', 'Color',
    'variants', jsonb_build_array(
      jsonb_build_object('value', 'Negro'),
      jsonb_build_object('value', 'Blanco'),
      jsonb_build_object('value', 'Rojo'),
      jsonb_build_object('value', 'Azul'),
      jsonb_build_object('value', 'Amarillo'),
      jsonb_build_object('value', 'Verde')
    ),
    'tags', jsonb_build_array(
      'teipe electrico',
      'cinta aislante',
      'teipe cobra',
      'cinta pvc',
      'aislamiento electrico',
      'teipe de colores',
      'teipe negro',
      'teipe blanco',
      'teipe rojo',
      'teipe azul',
      'teipe amarillo',
      'teipe verde',
      'electricidad',
      'cables'
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

-- 2. Detector de Voltaje Alterno Sin Contacto Tolsen
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
  'Detector de Voltaje Alterno Sin Contacto Tolsen',
  'detector-de-voltaje-alterno-tolsen',
  'TOL-38012',
  'Detector de voltaje CA tipo bolígrafo sin contacto (NCV) Tolsen para rangos de 90V a 1000V AC. Alarma acústica y visual por luz LED roja, linterna integrada y clip de bolsillo.',
  'Detector de voltaje alterno sin contacto (Non-Contact AC Voltage Detector / Lápiz Buscapolo Inductivo) marca Tolsen certificado CE bajo norma de seguridad CAT III 1000V / CAT IV 600V. Permite verificar de manera rápida, segura y sin contacto directo la presencia de tensión en conductores, tomacorrientes, interruptores, breakers y cables rotos o interrumpidos. Dispone de indicador luminoso LED rojo ultra brillante en la punta y alarma sonora (zumbador acústico) con cadencia proporcional a la proximidad del campo eléctrico. Cuenta con linterna LED incorporada para iluminar tableros oscuros, clip de bolsillo ergonómico y sistema de autoapagado para maximizar la vida útil de las baterías. Funciona con 2 pilas AAA de 1.5V.',
  (SELECT id FROM public.brands WHERE slug = 'tolsen' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 15,
    'tipoDeteccion', 'Sin contacto (NCV - Non-Contact Voltage)',
    'rangoVoltaje', '90 V - 1000 V AC',
    'frecuencia', '50 / 60 Hz',
    'indicadores', 'Alarma acústica (buzzer) y óptica LED roja en punta',
    'linterna', 'Linterna LED de trabajo integrada',
    'clasificacionSeguridad', 'CAT III 1000V / CAT IV 600V, Certificación CE',
    'alimentacion', '2 pilas AAA 1.5V',
    'tags', jsonb_build_array(
      'detector de voltaje',
      'detector de voltaje alterno',
      'detector sin contacto',
      'lapiz buscapolo',
      'tolsen',
      'detector ncv',
      'buscapolo inductivo',
      'tester de voltaje',
      'electricidad',
      'herramientas de medicion'
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

-- 3. Multímetro Digital DT9205A con Puntas de Prueba
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
  'Multímetro Digital DT9205A con Puntas de Prueba',
  'multimetro-digital-dt9205a',
  'ELEC-MULT-DT9205A',
  'Multímetro digital profesional DT9205A con pantalla LCD grande, funda protectora antichoque naranja y soporte abatible. Mide voltaje AC/DC, corriente hasta 20A, resistencia, capacitancia, diodos, continuidad y transistores hFE.',
  'Multímetro digital de alta precisión modelo DT9205A, indispensable para técnicos de servicio, instaladores eléctricos, talleres electrónicos y mantenimiento automotriz. Equipado con una pantalla de cristal líquido (LCD) de gran tamaño (3 1/2 dígitos con lectura máxima de 1999) y dígitos de alta visibilidad. Incorpora selector rotativo de 32 posiciones para medición integral de voltaje continuo (hasta 1000V DC) y alterno (hasta 750V AC), corriente continua y alterna hasta 20A, resistencia de hasta 200MΩ, capacitancia hasta 200μF, prueba de continuidad audible por buzzer, prueba de unión de diodos y zócalo de prueba para ganancia de transistores bipolares (hFE NPN/PNP). Incluye funda protectora de goma antichoque color naranja con soporte trasero tipo atril (kickstand) y juego de cables con puntas de prueba aisladas.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 16,
    'pantalla', 'LCD de gran formato con lectura máxima 1999 y dígitos de alto contraste',
    'voltajeDC', '200mV / 2V / 20V / 200V / 1000V (±0.5%)',
    'voltajeAC', '200mV / 2V / 20V / 200V / 750V (±0.8%)',
    'corrienteDC_AC', '2mA / 20mA / 200mA / 20A (rango continuo y alterno)',
    'resistencia', '200Ω / 2kΩ / 20kΩ / 200kΩ / 2MΩ / 20MΩ / 200MΩ',
    'capacitancia', '20nF / 200nF / 2μF / 20μF / 200μF',
    'funcionesEspeciales', 'Continuidad audible con buzzer, diodo, ganancia de transistores hFE, autoapagado',
    'incluye', 'Juego de cables y puntas de prueba (rojo y negro), funda de silicona/goma antichoque naranja con atril',
    'tags', jsonb_build_array(
      'multimetro digital',
      'tester digital',
      'dt9205a',
      'multimetro dt9205a',
      'medidor de voltaje',
      'capacimetro',
      'amperimetro',
      'electricidad',
      'electronica',
      'instrumentos de medicion'
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

-- 4. Pinza Amperimétrica Digital con Estuche
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
  'Pinza Amperimétrica Digital con Estuche',
  'pinza-amperimetrica-digital',
  'ELEC-PINZA-AMP-DIG',
  'Pinza amperimétrica digital portátil para medición de corriente alterna sin corte de circuito. Incluye función de voltímetro AC/DC, resistencia, continuidad audible, botón Data Hold, estuche de transporte y cables de prueba.',
  'Pinza amperimétrica digital (multímetro de gancho / Clamp Meter) de diseño compacto y ergonómico, diseñada para instaladores eléctricos, técnicos en refrigeración, aire acondicionado y mantenimiento electromecánico. Permite medir corriente alterna (AC) de forma segura y no invasiva introduciendo el conductor a través de su mordaza inductiva de apertura amplia (hasta 25-30 mm), sin necesidad de interrumpir ni desconectar el circuito. Ofrece mediciones precisas de voltaje AC/DC hasta 600V, resistencia, diodos y continuidad acústica por zumbador buzzer. Incorpora botón Data Hold para retener lecturas en pantalla en áreas de difícil visibilidad, indicador de batería baja y protección contra sobrecargas. Incluye estuche textil acolchado con cremallera, par de cables de prueba con aislamiento y baterías.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 17,
    'corrienteAC', '20A / 200A / 400A - 600A (mordaza inductiva)',
    'voltajeAC_DC', 'Hasta 600 V',
    'resistencia', 'Hasta 200 kΩ / 2 MΩ',
    'aperturaMordaza', '25 mm a 30 mm',
    'pantalla', 'LCD digital con función Data Hold (retención de lectura)',
    'funciones', 'Continuidad con alarma sonora (buzzer), chequeo de diodos, indicador de sobrecarga y batería baja',
    'incluye', 'Estuche de lona protector con cierre y correa, juego de puntas de prueba aisladas y baterías',
    'tags', jsonb_build_array(
      'pinza amperimetrica',
      'multimetro de gancho',
      'clamp meter',
      'amperimetro de gancho',
      'medidor de corriente',
      'refrigeracion',
      'electricidad',
      'tester digital',
      'instrumentos de medicion'
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

-- 5. Pinza Pelacable Automática Frontal
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
  'Pinza Pelacable Automática Frontal',
  'pinza-pelacable-automatica',
  'ELEC-PELACABLE-AUTO',
  'Pinza pelacables automática con mecanismo de acción rápida tipo pistola para calibres de 0.5 mm² a 6.0 mm² (10-24 AWG). Pela y retira el aislamiento sin dañar los filamentos conductores, con cortacables integrado y tope de longitud regulable.',
  'Pinza pelacable automática frontal de acción simple tipo pistola, diseñada para agilizar el trabajo de cableado en tableros eléctricos, instalaciones residenciales, car audio, paneles de control y electrónica. Su mecanismo sincronizado de dos etapas sujeta firmemente el cable con una mordaza mientras la cuchilla deslaminadora corta y desliza la chaqueta de aislamiento limpiamente en una sola pulsación, sin morder ni degollar los filamentos de cobre. Cuenta con tope guía de longitud regulable para garantizar desaislados exactos y repetitivos en trabajos en serie, además de cuchilla de corte inferior integrada en el mango para seccionar conductores con facilidad. Construida con estructura de aleación reforzada y mangos ergonómicos en polímero de alto impacto que permiten una operación suave y descansada con una sola mano.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 18,
    'rangoPelado', '0.5 mm² a 6.0 mm² (10 a 24 AWG)',
    'mecanismo', 'Acción frontal automática tipo pistola de un solo paso con retorno por resorte',
    'regulacion', 'Tope regulable de profundidad/longitud de desaislado para trabajo en serie',
    'cortacables', 'Cuchilla de corte inferior integrada en el mango',
    'cuerpo', 'Aleación de acero templado con polímero termoplástico resistente a impactos',
    'tags', jsonb_build_array(
      'pinza pela cable',
      'pelacable automatico',
      'alicate pelacable',
      'wire stripper',
      'desaislador de cables',
      'pelacables tipo pistola',
      'electricidad',
      'cables',
      'herramientas de electricista'
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
