const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');

const envFile = fs.readFileSync('.env.local', 'utf8');
const env = {};
envFile.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=(.*)$/);
  if (match) env[match[1]] = match[2].trim();
});

const supabase = createClient(env['NEXT_PUBLIC_SUPABASE_URL'], env['SUPABASE_SERVICE_ROLE_KEY']);

async function main() {
  console.log('Obteniendo categoría "plomeria"...');
  const { data: catRow, error: catErr } = await supabase
    .from('categories')
    .select('id')
    .eq('slug', 'plomeria')
    .single();

  if (catErr || !catRow) {
    console.error('Error categoría:', catErr);
    process.exit(1);
  }

  console.log('Obteniendo marca "Genérico"...');
  let { data: brandRow } = await supabase
    .from('brands')
    .select('id')
    .eq('slug', 'gen-rico')
    .single();

  if (!brandRow) {
    const { data: fb } = await supabase.from('brands').select('id').limit(1).single();
    brandRow = fb;
  }

  const motobomba = {
    name: 'Motobomba de Agua a Gasolina',
    slug: 'motobomba-gasolina',
    sku: 'CHARATOOLS-MOTOBOMBA-GASOLINA',
    short_desc: 'Motobomba a gasolina de alto caudal para achique, drenaje y riego agrícola.',
    description: 'Motobomba autocebante a gasolina con motor OHV de 4 tiempos y jaula tubular de protección. Diseñada para trabajo pesado en drenaje, riego agrícola, obras de construcción y vaciado rápido.',
    is_casheable: true,
    brand_id: brandRow.id,
    category_id: catRow.id,
    specs: {
      imagen: '/motobomba-gasolina.webp',
      priority: 5,
      tags: ['bomba', 'motobomba', 'gasolina', 'agua', 'riego', 'drenaje', 'achique', 'alto caudal'],
      stockStatus: 'available',
      unidad: 'und',
      subcategory: 'bombas',
      subitem: 'motobombas',
      variantLabel: 'Diámetro',
      variants: [
        { value: '2"' },
        { value: '3"' },
        { value: '4"' }
      ]
    }
  };

  console.log('Insertando / actualizando motobomba en Supabase...');
  const { data, error } = await supabase
    .from('products')
    .upsert(motobomba, { onConflict: 'slug' })
    .select();

  if (error) {
    console.error('Error:', error);
  } else {
    console.log('✓ Motobomba insertada exitosamente:', data[0]?.name);
  }
}

main();
