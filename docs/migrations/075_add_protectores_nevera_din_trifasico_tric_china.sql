-- =============================================================================
-- Migración 075: Protectores de Voltaje Adicionales para Línea Electricidad
-- =============================================================================
-- Archivo: docs/migrations/075_add_protectores_nevera_din_trifasico_tric_china.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-04
--
-- Productos agregados:
--   1. Protector de Voltaje 110V para Refrigeración, Neveras y Aires hasta 12000 BTU
--   2. Protector Integral de Voltaje y Corriente Riel DIN 120V - 220V 80A TQ
--   3. Protector de Voltaje Trifásico 208V - 220V 3.5A TRIC
--   4. Protector de Voltaje 110V - 120V 20A con Enchufe TRIC
--   5. Protector de Voltaje 220V Toma China Exceline
-- =============================================================================

BEGIN;

-- Registrar marca 'TRIC' si no existe
INSERT INTO public.brands (name, slug, is_active)
VALUES ('TRIC', 'tric', true)
ON CONFLICT (slug) DO NOTHING;

-- 1. Protector de Voltaje 110V para Refrigeración, Neveras y Aires hasta 12000 BTU
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
  'Protector de Voltaje 110V para Refrigeración, Neveras y Aires hasta 12000 BTU',
  'protector-voltaje-110v-refrigeracion-neveras-aires-12000-btu',
  'ELEC-PROT-110V-NEV-12K',
  'Protector de voltaje 110V - 120V con toma frontal polarizada para refrigeradores, neveras, congeladores y aires acondicionados de hasta 12.000 BTU. Protege contra fluctuaciones extremas de voltaje, apagones y sobretensiones con ciclo de espera inteligente de 3 a 5 minutos e indicadores LED.',
  'Protector electrónico de voltaje de alta confiabilidad para servicio monofásico a 110V - 120V AC (50/60 Hz), diseñado especialmente para la protección integral de compresores de refrigeración y climatización doméstica. Idóneo para neveras convencionales y no-frost, congeladores horizontales y verticales (freezers), enfriadores de agua, vitrinas comerciales y aires acondicionados de ventana o split de hasta 12.000 BTU. Su circuito electrónico microprocesado desconecta de manera instantánea el equipo cuando la tensión desciende por debajo del límite seguro (bajo voltaje) o supera el rango máximo permitido (sobrevoltaje), evitando el sobrecalentamiento y la quema del devanado del motor. Incorpora un temporizador automático de reconexión retardada (ciclo de espera de 3 a 5 minutos) que permite la ecualización y descompresión de los gases refrigerantes antes del rearranque. Dispone de toma frontal NEMA 5-15R reforzada, clavija de conexión posterior a tierra NEMA 5-15P y 4 luces indicadoras LED de supervisión continua: Sobre Voltaje, Bajo Voltaje, Ciclo de Espera y Voltaje Normal.',
  (SELECT id FROM public.brands WHERE slug = 'gen-rico' OR slug = 'generico' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 26,
    'voltajeNominal', '110V - 120V AC',
    'frecuencia', '50 / 60 Hz',
    'capacidadAires', 'Hasta 12.000 BTU',
    'tiempoEspera', '3 a 5 minutos (ciclo de retardo para descompresión del compresor)',
    'tipoToma', '1 Toma frontal NEMA 5-15R polarizada aterrizada',
    'enchufe', 'Macho NEMA 5-15P posterior con polo a tierra',
    'indicadores', '4 LEDs: Sobre Voltaje, Bajo Voltaje, Ciclo de Espera, Voltaje Normal',
    'aplicaciones', 'Neveras, congeladores, freezers, enfriadores de agua y aires acondicionados hasta 12.000 BTU',
    'tags', jsonb_build_array(
      'protector de voltaje',
      'protector 110v',
      'protector para nevera',
      'protector congelador',
      'protector 12000 btu',
      'refrigeracion',
      'gibelec',
      'linea blanca',
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

-- 2. Protector Integral de Voltaje y Corriente Riel DIN 120V - 220V 80A TQ
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
  'Protector Integral de Voltaje y Corriente Riel DIN 120V - 220V 80A TQ',
  'protector-integral-voltaje-corriente-riel-din-120v-220v-80a-tq',
  'TQ-DIN-PROT-80A',
  'Protector de voltaje y sobrecorriente digital para montaje en riel DIN (120V - 220V, hasta 80A) marca TQ. Doble pantalla LED para lectura simultánea de voltaje (V) y amperaje (A) en tiempo real, desconexión automática programable y reconexión automática inteligente para tableros eléctricos residenciales y comerciales.',
  'Dispositivo de protección eléctrica integral inteligente multifunción marca TQ para montaje estándar en riel DIN de 35 mm (formato modular de 2 polos para tableros eléctricos residenciales, comerciales e industriales). Operativo en un amplio rango multivoltaje (120V a 240V AC, 50/60 Hz) con capacidad de carga directa de hasta 80 Amperios (80A), protegiendo la acometida completa de la vivienda, apartamento o circuito derivado de alta potencia sin necesidad de contactores adicionales. Incorpora doble pantalla digital LED de alta visibilidad: display superior para medición continua de voltaje (Voltímetro digital) y display inferior para monitoreo de corriente consumida (Amperímetro digital en tiempo real). Dispone de 3 botones de control frontal (SET, ▲, ▼) para parametrizar de forma personalizada los límites de corte por sobrevoltaje, bajo voltaje, sobrecorriente (límite de amperios por sobrecarga) y tiempo de retardo para la reconexión automática una vez normalizada la red eléctrica. Fabricado en material termoplástico autoextinguible retardante de llama con bornes de sujeción de alta presión.',
  (SELECT id FROM public.brands WHERE slug = 'tq' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 27,
    'marca', 'TQ',
    'montaje', 'Riel DIN estándar de 35 mm (2 módulos)',
    'voltajeOperacion', '120V - 220V - 240V AC (rango amplio de medición)',
    'corrienteMaxima', '80 Amperios (80A)',
    'frecuencia', '50 / 60 Hz',
    'pantallas', 'Doble display LED: Voltímetro (V) y Amperímetro (A) en tiempo real',
    'parametrosAjustables', 'Sobrevoltaje, bajo voltaje, sobrecorriente (amperaje) y tiempo de reconexión',
    'aplicaciones', 'Tableros eléctricos residenciales y comerciales, protección integral para toda la casa o circuitos de alta carga',
    'tags', jsonb_build_array(
      'protector integral',
      'protector riel din',
      'protector 80 amp',
      'protector de voltaje y corriente',
      'tq',
      'voltimetro y amperimetro',
      'tablero electrico',
      'protector para casa',
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

-- 3. Protector de Voltaje Trifásico 208V - 220V 3.5A TRIC
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
  'Protector de Voltaje Trifásico 208V - 220V 3.5A TRIC',
  'protector-voltaje-trifasico-208v-220v-3-5a-tric',
  'TRIC-PROT-TRIF-35A',
  'Supervisor y protector de voltaje trifásico 208V / 220V TRIC para control de contactores (3.5A). Protege motores eléctricos, bombas de agua y aires acondicionados centrales contra pérdida de fase, desbalance de fases, secuencia invertida, alto y bajo voltaje con perillas de calibración analógica.',
  'Relé supervisor y protector electrónico trifásico marca TRIC para sistemas eléctricos trifásicos en 208V / 220V AC (50/60 Hz), diseñado como dispositivo de mando y supervisión para la protección integral de motores eléctricos trifásicos, bombas de agua de pozo y de presión constante, compresores de climatización comercial, chillers y aires acondicionados centrales de gran tonelaje. Opera en el circuito de control de la bobina del contactor (capacidad de relé de 3.5 Amperios a 250V AC), desconectando la carga en milisegundos ante fallas críticas de la red: inversión de secuencia de fases, pérdida o caída de una fase, desbalance angular o asimetría entre líneas, así como fluctuaciones peligrosas de alto voltaje y bajo voltaje. Su panel frontal cuenta con 3 potenciómetros de calibración fina para regular el rango de voltaje mínimo, voltaje máximo y tiempo de retardo / desconexión. Carcasa en policarbonato industrial de alta resistencia al calor y bornes de conexión por tornillo numerados para instalación en tableros de fuerza y control.',
  (SELECT id FROM public.brands WHERE slug = 'tric' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 28,
    'marca', 'TRIC',
    'sistema', 'Trifásico 208V / 220V AC (L1, L2, L3)',
    'frecuencia', '50 / 60 Hz',
    'capacidadContacto', '3.5 Amperios (relé de control para bobina de contactor)',
    'protecciones', 'Pérdida de fase, secuencia invertida, desbalance de fases, sobrevoltaje y bajo voltaje',
    'ajustes', '3 Perillas de ajuste: Voltaje Mínimo, Voltaje Máximo y Tiempo de Retardo',
    'aplicaciones', 'Motores trifásicos, bombas de agua, aires acondicionados centrales, chillers, tableros de control industrial',
    'tags', jsonb_build_array(
      'protector trifasico',
      'supervisor trifasico',
      'protector tric',
      'protector 220v trifasico',
      'protector para motores',
      'protector bombas trifasicas',
      'aire acondicionado central',
      'tric',
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

-- 4. Protector de Voltaje 110V - 120V 20A con Enchufe TRIC
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
  'Protector de Voltaje 110V - 120V 20A con Enchufe TRIC',
  'protector-voltaje-110v-120v-20a-enchufe-tric',
  'TRIC-PROT-120V-20A',
  'Protector de voltaje 120V de alta resistencia con capacidad de 20 Amperios y temporizador de retardo de 3 minutos TRIC. Dispone de toma frontal naranja reforzada para aires acondicionados hasta 12.000 BTU, congeladores, refrigeradores y lavadoras con enchufe polarizado posterior.',
  'Protector de voltaje de servicio pesado (Heavy Duty) marca TRIC para circuitos monofásicos a 120V AC (50/60 Hz), con alta capacidad de conducción de hasta 20 Amperios (20A / 2400W). Fabricado en carcasa de polímero de alto impacto y retardante a la llama, especialmente concebido para electrodomésticos con alto consumo de arranque. Incorpora un tomacorriente frontal reforzado color naranja NEMA 5-20R / 5-15R que acepta clavijas estándar de 15A y clavijas en T de 20A. Equipado con circuito de desconexión ultrarrápida ante sobrevoltajes y caídas de tensión bruscas, y un temporizador inteligente de retardo de 3 minutos (3 MIN Delay) que garantiza la descompresión total del gas refrigerante antes de restablecer la corriente eléctrica al motor del compresor. Ideal para aires acondicionados de ventana o split de 110V de hasta 12.000 BTU, congeladores comerciales y residenciales, cavas de cerveza, neveras familiares de doble puerta, lavadoras automáticas y secadoras a gas. Enchufe posterior polarizado con clavija de conexión a tierra.',
  (SELECT id FROM public.brands WHERE slug = 'tric' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 29,
    'marca', 'TRIC',
    'voltajeNominal', '120V AC',
    'corrienteMaxima', '20 Amperios (20A / 2400W)',
    'frecuencia', '50 / 60 Hz',
    'tiempoRetardo', '3 Minutos (temporizador de espera para refrigeración)',
    'tipoToma', '1 Toma frontal reforzada de 20A (color naranja) NEMA 5-20R / 5-15R',
    'enchufe', 'Macho NEMA 5-15P/20P polarizado posterior con polo a tierra',
    'aplicaciones', 'Aires acondicionados hasta 12.000 BTU, congeladores, refrigeradores, cavas y lavadoras',
    'tags', jsonb_build_array(
      'protector de voltaje',
      'protector 110v',
      'protector 20a',
      'protector tric',
      'toma naranja',
      'protector para aire 12000 btu',
      'refrigeracion',
      'congelador',
      'tric',
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

-- 5. Protector de Voltaje 220V Toma China Exceline
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
  'Protector de Voltaje 220V Toma China Exceline',
  'protector-voltaje-220v-toma-china-exceline',
  'EXC-PROT-220V-CHINA',
  'Protector de voltaje 220V Exceline con receptáculo y clavija tipo china (clavijas planas anguladas en Y) para aires acondicionados split y de ventana de hasta 48.000 BTU y refrigeración comercial. Protege contra picos, alto y bajo voltaje con ciclo de espera de reconexión segura y 4 LEDs de diagnóstico.',
  'Protector de voltaje especializado marca Exceline para equipos que operan a 220V AC (50/60 Hz) con estándar de conexión tipo australiano / chino (Toma China con 3 clavijas planas inclinadas en disposición diagonal o forma de Y con toma a tierra). Diseñado específicamente para aires acondicionados de ventana y consolas split de 12.000, 18.000, 24.000, 36.000 y hasta 48.000 BTU, así como cavas y vitrinas refrigeradas importadas que traen este tipo de enchufe de fábrica, eliminando la necesidad de usar adaptadores peligrosos que provocan recalentamiento o incendios. Ofrece una protección confiable mediante desconexión automática por alto voltaje y bajo voltaje, acompañada de un ciclo de espera con retardo de seguridad (temporizador de arranque) para proteger el motocompresor contra golpes de presión y arranques en falso. Dispone de receptáculo frontal tipo china reforzado, enchufe posterior directo macho tipo china y 4 luces LED indicadoras de estado: Voltaje Normal (verde), Sobre Voltaje (rojo), Bajo Voltaje (rojo) y Ciclo de Espera (amarillo).',
  (SELECT id FROM public.brands WHERE slug = 'exceline' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 30,
    'marca', 'Exceline',
    'voltajeNominal', '220V AC',
    'frecuencia', '50 / 60 Hz',
    'capacidadAires', 'Hasta 48.000 BTU',
    'tipoToma', 'Receptáculo frontal Tipo China (clavijas planas inclinadas en Y con tierra)',
    'enchufe', 'Macho posterior Tipo China directo a tomacorriente',
    'indicadores', '4 LEDs: Voltaje Normal, Sobre Voltaje, Bajo Voltaje, Ciclo de Espera',
    'aplicaciones', 'Aires acondicionados split y de ventana 220V con toma china (Haier, Frigilux, Midea, etc.), refrigeración comercial',
    'tags', jsonb_build_array(
      'protector de voltaje',
      'protector 220v',
      'protector toma china',
      'protector exceline 220v',
      'exceline',
      'aire acondicionado split',
      'toma china',
      'hasta 48000 btu',
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
