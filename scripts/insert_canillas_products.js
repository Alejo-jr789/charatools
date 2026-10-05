const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');

// Parse .env.local
const envFile = fs.readFileSync('.env.local', 'utf8');
const env = {};
envFile.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=(.*)$/);
  if (match) env[match[1].trim()] = match[2].trim();
});

const supabaseUrl = env['NEXT_PUBLIC_SUPABASE_URL'];
const serviceKey = env['SUPABASE_SERVICE_ROLE_KEY'];

if (!supabaseUrl || !serviceKey) {
  console.error('Faltan credenciales de Supabase en .env.local');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, serviceKey, {
  auth: { persistSession: false }
});

async function main() {
  console.log('1. Obteniendo IDs de Brand (Genérico) y Categorías...');
  
  // 1. Obtener brand Genérico
  const { data: brand, error: brandErr } = await supabase
    .from('brands')
    .select('id, name, slug')
    .or('slug.eq.gen-rico,slug.eq.generico')
    .limit(1)
    .single();

  if (brandErr || !brand) {
    console.error('Error buscando marca Genérico:', brandErr);
    process.exit(1);
  }
  console.log('Marca encontrada:', brand);

  // 2. Obtener categoría Canillas
  const { data: catCanillas, error: catErr } = await supabase
    .from('categories')
    .select('id, name, slug')
    .eq('slug', 'canillas')
    .single();

  if (catErr || !catCanillas) {
    console.error('Error buscando categoría Canillas:', catErr);
    process.exit(1);
  }
  console.log('Categoría encontrada:', catCanillas);

  // 3. Vincular parent_id si no lo tiene a Plomería
  const { data: catPlomeria } = await supabase
    .from('categories')
    .select('id')
    .eq('slug', 'plomeria')
    .single();

  if (catPlomeria) {
    await supabase
      .from('categories')
      .update({ parent_id: catPlomeria.id, depth: 1 })
      .eq('slug', 'canillas');
    console.log('Jerarquía de Canillas vinculada a Plomería.');
  }

  // 4. Lista de 3 productos
  const products = [
    {
      name: 'Canilla Plástica Flexible',
      slug: 'canilla-plastica-flexible',
      sku: 'GEN-CANILLA-PLASTICA-FLEX',
      short_desc: 'Canilla plástica flexible para lavamanos y sanitarios en medidas 1/2" x 1/2" y 1/2" x 5/8" (40cm y 60cm).',
      description: 'Canilla plástica flexible de alta resistencia para conexión de agua en lavamanos, fregaderos y sanitarios. Fabricada con materiales termoplásticos de gran durabilidad y tuercas ergonómicas de fácil ajuste manual sin necesidad de herramientas pesadas. Disponible en conexiones 1/2" x 1/2" y 1/2" x 5/8", en largos de 40 cm y 60 cm.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catCanillas.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'canillas',
        subitem: 'canillas',
        variantLabel: 'Medida y Largo',
        variants: [
          { value: '1/2" x 1/2" (40 cm)' },
          { value: '1/2" x 1/2" (60 cm)' },
          { value: '1/2" x 5/8" (40 cm)' },
          { value: '1/2" x 5/8" (60 cm)' }
        ],
        tags: ['canilla', 'plastica', 'canilla flexible', 'lavamano', 'sanitario', 'plomeria', '1/2', '5/8', '40cm', '60cm'],
        priority: 1
      }
    },
    {
      name: 'Canilla Flexible Malla de Acero',
      slug: 'canilla-flexible-malla-acero',
      sku: 'GEN-CANILLA-MALLA-ACERO',
      short_desc: 'Canilla flexible trenzada con malla de acero inoxidable para alta presión en 1/2" x 1/2" y 1/2" x 5/8" (40cm y 60cm).',
      description: 'Canilla flexible con recubrimiento trenzado en malla de acero inoxidable para conexiones hidrosanitarias de alta presión y temperatura. Tubo interior de caucho sintético EPDM y conectores metálicos reforzados que garantizan máxima estanqueidad y resistencia a la corrosión. Disponible en conexiones 1/2" x 1/2" y 1/2" x 5/8", en longitudes de 40 cm y 60 cm.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catCanillas.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'canillas',
        subitem: 'canillas',
        variantLabel: 'Medida y Largo',
        variants: [
          { value: '1/2" x 1/2" (40 cm)' },
          { value: '1/2" x 1/2" (60 cm)' },
          { value: '1/2" x 5/8" (40 cm)' },
          { value: '1/2" x 5/8" (60 cm)' }
        ],
        tags: ['canilla', 'acero', 'malla de acero', 'inox', 'canilla flexible', 'lavamano', 'fregadero', 'sanitario', 'plomeria', '1/2', '5/8', '40cm', '60cm'],
        priority: 2
      }
    },
    {
      name: 'Canilla Flexible para Monomando',
      slug: 'canilla-flexible-monomando',
      sku: 'GEN-CANILLA-MONOMANDO',
      short_desc: 'Canilla flexible trenzada de acero inoxidable especial para griferías monomando en largos de 40cm y 60cm.',
      description: 'Canilla flexible trenzada en acero inoxidable especialmente diseñada para la conexión de griferías tipo monomando en lavamanos y fregaderos. Incluye terminal con espiga y sellos de doble junta tórica para inserción hermética en la base del monomando y tuerca de 1/2" para llave de arresto. Disponible en 40 cm y 60 cm.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catCanillas.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'canillas',
        subitem: 'canillas',
        variantLabel: 'Largo',
        variants: [
          { value: '40 cm' },
          { value: '60 cm' }
        ],
        tags: ['canilla', 'monomando', 'griferia', 'canilla flexible', 'acero inoxidable', 'lavamano', 'fregadero', 'plomeria', '40cm', '60cm'],
        priority: 3
      }
    }
  ];

  console.log(`2. Insertando ${products.length} productos en public.products...`);
  for (const prod of products) {
    const { data, error } = await supabase
      .from('products')
      .upsert(prod, { onConflict: 'slug' })
      .select('id, name, slug, sku')
      .single();

    if (error) {
      console.error(`Error guardando ${prod.name}:`, error);
    } else {
      console.log(`✓ Guardado: ${data.name} [SKU: ${data.sku}] (ID: ${data.id})`);
    }
  }

  console.log('¡Todos los productos de Canillas se insertaron con éxito!');
}

main().catch(err => {
  console.error('Error fatal:', err);
  process.exit(1);
});
