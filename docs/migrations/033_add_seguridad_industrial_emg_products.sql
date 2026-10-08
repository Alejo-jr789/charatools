-- =============================================================================
-- Migración 033: Productos de Seguridad Industrial EMG (Casco, Protector Facial, Lentes, Monogafas)
-- =============================================================================
-- Archivo: docs/migrations/033_add_seguridad_industrial_emg_products.sql
-- Proyecto: CharaTools E-Commerce
-- Fecha: 2026-10-08
-- =============================================================================

BEGIN;

-- 1. Insertar marca EMG si no existe
INSERT INTO public.brands (name, slug, is_active)
VALUES ('EMG', 'emg', true)
ON CONFLICT (slug) DO NOTHING;

-- 2. Insertar productos
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
  -- 1. Casco de Seguridad Certificado EMG
  (
    'Casco de Seguridad Certificado EMG',
    'casco-seguridad-certificado-emg',
    'SEG-CASCO-EMG-CERT',
    'Casco de seguridad industrial certificado con suspensión tipo ratchet o estándar en polietileno de alta resistencia.',
    'Casco de protección industrial certificado marca EMG, diseñado para cumplir normativas de seguridad laboral ante riesgos de impacto, penetración y descargas eléctricas leves. Fabricado en polietileno de alta densidad (HDPE) con canal para desvío de líquidos y ranuras laterales para acople de protectores auditivos o faciales.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'cascos' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'cascos',
      'subitem', 'cascos',
      'variantLabel', 'Color',
      'variants', jsonb_build_array(
        jsonb_build_object('value', 'Amarillo'),
        jsonb_build_object('value', 'Blanco'),
        jsonb_build_object('value', 'Azul'),
        jsonb_build_object('value', 'Rojo')
      ),
      'tags', jsonb_build_array('casco', 'seguridad', 'casco certificado', 'emg', 'proteccion', 'obra', 'epp', 'seguridad industrial'),
      'priority', 2
    )
  ),

  -- 2. Protector Facial con Ratchet y Ajuste de Pantalla
  (
    'Protector Facial con Ratchet y Ajuste de Pantalla',
    'protector-facial-ratchet-ajuste-pantalla',
    'SEG-PROT-FACIAL-RATCHET',
    'Careta protectora facial con visor de policarbonato transparente y arnés de cabezal tipo ratchet regulable.',
    'Protector facial completo para resguardo ocular y de rostro contra salpicaduras químicas, esquirlas y partículas volátiles en procesos de esmerilado, desbaste o corte. Incluye cabezal de alta resistencia con ajuste tipo ratchet para fijación ergonómica y visor de policarbonato transparente de amplia visión con perillas de tensión multiposición.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'lentes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'lentes',
      'subitem', 'lentes',
      'tags', jsonb_build_array('protector facial', 'careta', 'pantalla facial', 'ratchet', 'visor', 'policarbonato', 'seguridad', 'epp', 'seguridad industrial'),
      'priority', 3
    )
  ),

  -- 3. Lentes de Seguridad Tipo Avispa Espejado
  (
    'Lentes de Seguridad Tipo Avispa Espejado',
    'lentes-seguridad-tipo-avispa-espejado',
    'SEG-LENTES-AVISPA-ESP',
    'Lentes de seguridad envolventes diseño tipo avispa con lunas espejadas y protección UV contra impacto.',
    'Lentes de protección visual envolvente modelo Avispa con acabado espejado para reducción de reflejos y deslumbramiento en exteriores o áreas de alta luminosidad. Fabricados en policarbonato de alta resistencia contra impactos de partículas a gran velocidad, con patillas anatómicas y puente nasal ergonómico para uso prolongado.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'lentes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'lentes',
      'subitem', 'lentes',
      'tags', jsonb_build_array('lentes', 'lentes de seguridad', 'tipo avispa', 'espejado', 'proteccion visual', 'uv', 'epp', 'seguridad industrial'),
      'priority', 4
    )
  ),

  -- 4. Lentes de Seguridad Cuadrado Tipo Élite
  (
    'Lentes de Seguridad Cuadrado Tipo Élite',
    'lentes-seguridad-cuadrado-tipo-elite',
    'SEG-LENTES-CUADRADO-ELITE',
    'Lentes de seguridad de montura cuadrada con protecciones laterales y patillas ajustables.',
    'Lentes de seguridad industrial modelo Cuadrado Tipo Élite con diseño clásico y amplia área de visión. Incorporan protectores laterales integrados para resguardo contra partículas oblicuas y salpicaduras. Lunas de policarbonato antirrayaduras con patillas telescópicas ajustables en longitud para adaptarse a cualquier usuario.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'lentes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'lentes',
      'subitem', 'lentes',
      'variantLabel', 'Tipo de Lente',
      'variants', jsonb_build_array(
        jsonb_build_object('value', 'Transparente'),
        jsonb_build_object('value', 'Oscuro')
      ),
      'tags', jsonb_build_array('lentes', 'lentes de seguridad', 'cuadrado', 'tipo elite', 'proteccion lateral', 'proteccion visual', 'epp', 'seguridad industrial'),
      'priority', 5
    )
  ),

  -- 5. Monogafas Directa
  (
    'Monogafas Directa',
    'monogafas-directa',
    'SEG-MONOGAFAS-DIRECTA',
    'Monogafas de seguridad panorámicas con ventilación directa y banda elástica ajustable.',
    'Gafas panorámicas de seguridad (monogafas) con cuerpo de vinilo flexible y transparente que se adapta herméticamente al contorno facial. Cuentan con sistema de perforaciones de ventilación directa para evitar condensación y empañamiento. Lente de policarbonato resistente a impactos con banda elástica textil graduable.',
    true,
    (SELECT id FROM public.brands WHERE slug = 'emg' LIMIT 1),
    (SELECT id FROM public.categories WHERE slug = 'lentes' LIMIT 1),
    jsonb_build_object(
      'imagen', '/placeholder-product.webp',
      'stockStatus', 'available',
      'unidad', 'und',
      'subcategory', 'lentes',
      'subitem', 'lentes',
      'tags', jsonb_build_array('monogafas', 'monogafas directa', 'gafas de seguridad', 'panoramicas', 'ventilacion directa', 'proteccion visual', 'epp', 'seguridad industrial'),
      'priority', 6
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
