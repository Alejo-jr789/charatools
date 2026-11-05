-- =============================================================================
-- Migración 076: Protectores de Voltaje TRIC 220V Enchufe y TQ Digital 120V
-- =============================================================================
-- Archivo: docs/migrations/076_add_protectores_tric_220v_enchufe_y_tq_digital_120v.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-11-04
--
-- Productos agregados:
--   1. Protector de Voltaje 220V 20A con Enchufe TRIC
--   2. Protector Multipropósito Digital 120V 20A con Voltímetro TQ
-- =============================================================================

BEGIN;

-- 1. Protector de Voltaje 220V 20A con Enchufe TRIC
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
  'Protector de Voltaje 220V 20A con Enchufe TRIC',
  'protector-voltaje-220v-20a-enchufe-tric',
  'TRIC-PROT-220V-20A',
  'Protector de voltaje 220V de alta capacidad (20A) con enchufe y toma frontal horizontal NEMA 6-20R / 6-15R color turquesa TRIC. Diseñado para aires acondicionados de ventana y split de hasta 24.000 BTU, congeladores comerciales y equipos de refrigeración con interruptor ON/OFF y ciclo de espera de seguridad.',
  'Protector de voltaje para servicio pesado a 220V AC (50/60 Hz) marca TRIC, con capacidad de carga nominal de hasta 20 Amperios (20A / 4400W). Diseñado para la protección confiable de aires acondicionados split y de ventana de hasta 18.000 y 24.000 BTU, congeladores horizontales comerciales, enfriadores de botellas y maquinaria de refrigeración que utilicen conexión a 220V por tomacorriente estándar americano. Incorpora un receptáculo frontal NEMA 6-20R / 6-15R reforzado en llamativo color turquesa (ranuras horizontales en tándem con puesta a tierra), interruptor basculante lateral de encendido y apagado manual, y clavija posterior polarizada macho NEMA 6-20P con clavija a tierra. Su circuito de protección supervisa activamente el suministro eléctrico, interrumpiendo de forma instantánea la energía ante sobrevoltajes peligrosos o caídas de tensión severas. Cuenta con temporizador automático de ciclo de espera (retardo de seguridad para descompresión de gases del compresor antes de la reconexión) y 3 luces indicadoras LED en el panel frontal: Voltaje Normal (verde), Ciclo de Espera (amarillo) y Falla / Sobre-Bajo Voltaje (rojo). Carcasa ignífuga de alta resistencia.',
  (SELECT id FROM public.brands WHERE slug = 'tric' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 31,
    'marca', 'TRIC',
    'voltajeNominal', '208V - 220V - 240V AC',
    'corrienteMaxima', '20 Amperios (20A / 4400W)',
    'frecuencia', '50 / 60 Hz',
    'capacidadAires', 'Hasta 24.000 BTU',
    'tipoToma', '1 Toma frontal NEMA 6-20R / 6-15R reforzada color turquesa (clavijas horizontales con tierra)',
    'enchufe', 'Macho NEMA 6-20P posterior polarizado con polo a tierra',
    'interruptor', 'Basculante ON / OFF lateral',
    'indicadores', '3 LEDs: Voltaje Normal, Ciclo de Espera, Falla / Sobre-Bajo Voltaje',
    'aplicaciones', 'Aires acondicionados split y ventana 220V hasta 24.000 BTU, congeladores comerciales, cavas y equipos de refrigeración',
    'tags', jsonb_build_array(
      'protector de voltaje',
      'protector 220v',
      'protector 20a',
      'protector tric 220v',
      'toma turquesa',
      'protector para aire acondicionado',
      'refrigeracion',
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

-- 2. Protector Multipropósito Digital 120V 20A con Voltímetro TQ
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
  'Protector Multipropósito Digital 120V 20A con Voltímetro TQ',
  'protector-multiproposito-digital-120v-20a-voltimetro-tq',
  'TQ-PAM120-1',
  'Protector de voltaje digital multipropósito 120V 20A enchufable con voltímetro LED en tiempo real TQ (modelo TQ-PAM120-1). Pantalla digital de 3 dígitos, programación de límites de corte por alto/bajo voltaje, temporizador de retardo y toma frontal NEMA aterrizada para electrodomésticos, refrigeración y electrónica.',
  'Protector de voltaje digital inteligente multipropósito marca TQ (modelo TQ-PAM120-1) para redes a 120V AC (50/60 Hz) con capacidad de conducción de 20 Amperios (20A / 2400W). Diseñado como una solución versátil y precisa para proteger todo tipo de cargas domésticas y comerciales: neveras, congeladores, aires acondicionados pequeños (hasta 12.000 BTU), lavadoras, hornos microondas, televisores Smart TV, computadoras y sistemas de sonido. Su avanzada pantalla digital LED de 3 dígitos funciona como voltímetro continuo en tiempo real, permitiendo visualizar el voltaje exacto presente en la toma y mostrando la cuenta regresiva descendente durante el ciclo de espera de reconexión. Equipado con pulsadores frontales de fácil acceso que permiten programar y personalizar los umbrales de desconexión por alto voltaje, bajo voltaje y el tiempo del temporizador de espera. Incorpora toma frontal NEMA 5-15R polarizada con conexión a tierra y enchufe macho directo posterior para una fijación limpia al tomacorriente de pared. Carcasa de polímero termoplástico resistente a impactos con protección contra sobretensiones y picos transitorios.',
  (SELECT id FROM public.brands WHERE slug = 'tq' LIMIT 1),
  (SELECT id FROM public.categories WHERE slug = 'electricidad' LIMIT 1),
  true,
  jsonb_build_object(
    'imagen', '/placeholder-product.webp',
    'unidad', 'und',
    'stockStatus', 'available',
    'priority', 32,
    'marca', 'TQ',
    'modelo', 'TQ-PAM120-1',
    'voltajeNominal', '120V AC',
    'corrienteMaxima', '20 Amperios (20A / 2400W)',
    'frecuencia', '50 / 60 Hz',
    'pantalla', 'Display digital LED de 3 dígitos (Voltímetro digital y temporizador numérico)',
    'parametrosAjustables', 'Límites de corte por sobrevoltaje, bajo voltaje y tiempo de reconexión',
    'tipoToma', '1 Toma frontal NEMA 5-15R polarizada con tierra',
    'enchufe', 'Macho NEMA 5-15P polarizado posterior con polo a tierra',
    'aplicaciones', 'Neveras, congeladores, aires acondicionados hasta 12.000 BTU, microondas, lavadoras, computadoras y televisores',
    'tags', jsonb_build_array(
      'protector multiproposito',
      'protector digital 120v',
      'protector tq',
      'voltimetro digital',
      'tq-pam120-1',
      'protector para nevera',
      'protector para aire',
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
