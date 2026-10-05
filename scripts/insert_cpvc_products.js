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
  console.log('1. Obteniendo IDs de Brand (Tubrica) y Categorías...');
  
  // 1. Obtener brand Tubrica
  const { data: brand, error: brandErr } = await supabase
    .from('brands')
    .select('id, name, slug')
    .eq('slug', 'tubrica')
    .single();

  if (brandErr || !brand) {
    console.error('Error buscando marca Tubrica:', brandErr);
    process.exit(1);
  }
  console.log('Marca encontrada:', brand);

  // 2. Obtener categoría Línea Agua Caliente
  const { data: catAguaCaliente, error: catErr } = await supabase
    .from('categories')
    .select('id, name, slug')
    .eq('slug', 'linea-agua-caliente')
    .single();

  if (catErr || !catAguaCaliente) {
    console.error('Error buscando categoría Línea Agua Caliente:', catErr);
    process.exit(1);
  }
  console.log('Categoría encontrada:', catAguaCaliente);

  // 3. Vincular parent_id si no lo tiene
  const { data: catPlomeria } = await supabase
    .from('categories')
    .select('id')
    .eq('slug', 'plomeria')
    .single();

  if (catPlomeria) {
    await supabase
      .from('categories')
      .update({ parent_id: catPlomeria.id, depth: 1 })
      .eq('slug', 'linea-agua-caliente');
    console.log('Jerarquía de Línea Agua Caliente vinculada a Plomería.');
  }

  // 4. Lista de 6 productos
  const products = [
    {
      name: 'Tubo CPVC Agua Caliente 1/2"',
      slug: 'tubo-cpvc-agua-caliente-1-2',
      sku: 'TUBRICA-CPVC-TUBO-1-2',
      short_desc: 'Tubo de CPVC RDE 9 de 1/2" para conducción de agua caliente y alta presión.',
      description: 'Tubo de CPVC (Cloruro de Polivinilo Clorado) de 1/2 pulgada (RDE 9) diseñado para distribución de agua caliente y fría en edificaciones. Soporta temperaturas elevadas y presiones continuas de servicio. Resistente a la corrosión química y libre de incrustaciones calcáreas.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catAguaCaliente.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'tubo',
        subcategory: 'linea-agua-caliente',
        subitem: 'tuberia-agua-caliente',
        variantLabel: 'Medida',
        variants: [{ value: '1/2"' }],
        tags: ['cpvc', 'tubo', 'tuberia', 'agua caliente', 'plomeria', 'tubrica', '1/2', 'rde 9'],
        priority: 10
      }
    },
    {
      name: 'Unión Universal 1/2" CPVC',
      slug: 'union-universal-1-2-cpvc',
      sku: 'TUBRICA-CPVC-UNION-UNIV-1-2',
      short_desc: 'Unión universal de CPVC de 1/2" para acoples desmontables en redes de agua caliente.',
      description: 'Unión universal desmontable fabricada en CPVC de 1/2 pulgada. Facilita la instalación, mantenimiento preventivo y desmontaje de bombas, calentadores y tuberías de agua caliente sin necesidad de cortar la red.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catAguaCaliente.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'linea-agua-caliente',
        subitem: 'conexiones-agua-caliente',
        variantLabel: 'Medida',
        variants: [{ value: '1/2"' }],
        tags: ['cpvc', 'union', 'union universal', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'],
        priority: 11
      }
    },
    {
      name: 'Tee CPVC 1/2"',
      slug: 'tee-cpvc-1-2',
      sku: 'TUBRICA-CPVC-TEE-1-2',
      short_desc: 'Tee de CPVC de 1/2" para ramales y derivaciones a 90° en redes de agua caliente.',
      description: 'Accesorio Tee de 1/2 pulgada fabricado en CPVC para derivar ramales a 90 grados en sistemas hidrosanitarios de agua caliente y fría. Unión por cementado solvente CPVC que garantiza hermeticidad absoluta.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catAguaCaliente.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'linea-agua-caliente',
        subitem: 'conexiones-agua-caliente',
        variantLabel: 'Medida',
        variants: [{ value: '1/2"' }],
        tags: ['cpvc', 'tee', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'],
        priority: 12
      }
    },
    {
      name: 'Codo 90° x 1/2" CPVC',
      slug: 'codo-90-1-2-cpvc',
      sku: 'TUBRICA-CPVC-CODO-90-1-2',
      short_desc: 'Codo de 90 grados en CPVC de 1/2" para cambios de dirección en redes de agua caliente.',
      description: 'Codo de 90° fabricado en CPVC de 1/2 pulgada. Diseñado para cambios de dirección con flujo uniforme en instalaciones hidrosanitarias de agua caliente. Alta resistencia térmica y a la presión continua.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catAguaCaliente.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'linea-agua-caliente',
        subitem: 'conexiones-agua-caliente',
        variantLabel: 'Medida',
        variants: [{ value: '1/2"' }],
        tags: ['cpvc', 'codo', 'codo 90', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'],
        priority: 13
      }
    },
    {
      name: 'Adaptador Macho 1/2" CPVC',
      slug: 'adaptador-macho-1-2-cpvc',
      sku: 'TUBRICA-CPVC-ADAPT-MACHO-1-2',
      short_desc: 'Adaptador macho con rosca NPT de 1/2" en CPVC para transiciones y acoples roscados.',
      description: 'Adaptador macho de 1/2 pulgada en CPVC con un extremo liso para soldar y un extremo roscado NPT macho exterior. Permite conectar tuberías de CPVC con llaves de paso, griferías o accesorios metálicos de agua caliente.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catAguaCaliente.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'linea-agua-caliente',
        subitem: 'conexiones-agua-caliente',
        variantLabel: 'Medida',
        variants: [{ value: '1/2"' }],
        tags: ['cpvc', 'adaptador', 'adaptador macho', 'rosca', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'],
        priority: 14
      }
    },
    {
      name: 'Adaptador Hembra 1/2" CPVC',
      slug: 'adaptador-hembra-1-2-cpvc',
      sku: 'TUBRICA-CPVC-ADAPT-HEMBRA-1-2',
      short_desc: 'Adaptador hembra con rosca NPT interior de 1/2" en CPVC para acoples roscados.',
      description: 'Adaptador hembra de 1/2 pulgada en CPVC con un extremo liso para soldar y un extremo roscado NPT hembra interior. Diseñado para acoples a terminales roscados machos en instalaciones de agua caliente.',
      is_casheable: true,
      brand_id: brand.id,
      category_id: catAguaCaliente.id,
      specs: {
        imagen: '/placeholder-product.webp',
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'linea-agua-caliente',
        subitem: 'conexiones-agua-caliente',
        variantLabel: 'Medida',
        variants: [{ value: '1/2"' }],
        tags: ['cpvc', 'adaptador', 'adaptador hembra', 'rosca', 'agua caliente', 'conexion', 'plomeria', 'tubrica', '1/2'],
        priority: 15
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

  console.log('¡Todos los productos de CPVC Agua Caliente se insertaron con éxito!');
}

main().catch(err => {
  console.error('Error fatal:', err);
  process.exit(1);
});
