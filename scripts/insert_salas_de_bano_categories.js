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
  console.log('1. Insertando categoría principal "Salas de Baño"...');
  const { data: mainCat, error: mainErr } = await supabase
    .from('categories')
    .upsert({
      name: 'Salas de Baño',
      slug: 'salas-de-bano',
      description: 'Sanitarios, inodoros, lavamanos, pedestales y accesorios para salas de baño',
      depth: 0,
      sort_order: 70,
      is_active: true
    }, { onConflict: 'slug' })
    .select('id, name, slug')
    .single();

  if (mainErr) {
    console.error('Error insertando Salas de Baño:', mainErr);
    process.exit(1);
  }

  console.log('Categoría principal confirmada:', mainCat);

  console.log('2. Insertando sublíneas...');
  const sublines = [
    {
      name: 'Sanitarios',
      slug: 'sanitarios',
      description: 'Piezas y juegos sanitarios completos',
      parent_id: mainCat.id,
      depth: 1,
      sort_order: 10,
      is_active: true
    },
    {
      name: 'Inodoros',
      slug: 'inodoros',
      description: 'Inodoros, pocetas y tanques de descarga',
      parent_id: mainCat.id,
      depth: 1,
      sort_order: 20,
      is_active: true
    },
    {
      name: 'Lavamanos y Pedestales',
      slug: 'lavamanos-pedestales',
      description: 'Lavamanos de sobreponer, empotrar y pedestales',
      parent_id: mainCat.id,
      depth: 1,
      sort_order: 30,
      is_active: true
    }
  ];

  for (const sub of sublines) {
    const { data, error } = await supabase
      .from('categories')
      .upsert(sub, { onConflict: 'slug' })
      .select('id, name, slug')
      .single();

    if (error) {
      console.error(`Error insertando sublínea ${sub.name}:`, error);
    } else {
      console.log(`Sublínea agregada: ${data.name} (${data.slug}) [ID: ${data.id}]`);
    }
  }

  console.log('¡Categorías de Salas de Baño creadas con éxito!');
}

main().catch(err => {
  console.error('Error fatal:', err);
  process.exit(1);
});
