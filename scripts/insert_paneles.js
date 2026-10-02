const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');

const envFile = fs.readFileSync('.env.local', 'utf8');
const env = {};
envFile.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=(.*)$/);
  if (match) env[match[1]] = match[2].trim();
});

const supabase = createClient(env['NEXT_PUBLIC_SUPABASE_URL'], env['SUPABASE_SERVICE_ROLE_KEY']);

async function run() {
  const brandId = '7e97595a-8b6e-4361-a98f-0c17385922c2'; // gen-rico
  const categoryId = '96b6bc46-41d9-4936-9944-ea63862a3c25'; // iluminacion

  const panels = [
    {
      name: 'Panel Superficial Redondo',
      slug: 'panel-superficial-redondo',
      sku: 'CHARATOOLS-PANEL-SUPERFICIAL-REDONDO',
      short_desc: 'Panel LED superficial redondo para techos sin cielo raso. Luz blanca y diseño ultradelgado.',
      description: 'Panel LED superficial redondo para techos sin cielo raso. Luz blanca y diseño ultradelgado.',
      is_casheable: false,
      brand_id: brandId,
      category_id: categoryId,
      specs: {
        imagen: '/iluminacion.webp',
        tags: ['LED', 'panel', 'superficial', 'redondo', 'techo'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'paneles',
        subitem: 'paneles',
        variantLabel: 'Potencia',
        priority: 1,
        variants: [
          { value: '6W' }, { value: '12W' }, { value: '18W' }, { value: '24W' }, { value: '36W' }
        ]
      }
    },
    {
      name: 'Panel Superficial Cuadrado',
      slug: 'panel-superficial-cuadrado',
      sku: 'CHARATOOLS-PANEL-SUPERFICIAL-CUADRADO',
      short_desc: 'Panel LED superficial cuadrado ideal para oficinas y áreas amplias.',
      description: 'Panel LED superficial cuadrado ideal para oficinas y áreas amplias.',
      is_casheable: false,
      brand_id: brandId,
      category_id: categoryId,
      specs: {
        imagen: '/iluminacion.webp',
        tags: ['LED', 'panel', 'superficial', 'cuadrado', 'oficina'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'paneles',
        subitem: 'paneles',
        variantLabel: 'Potencia',
        priority: 2,
        variants: [
          { value: '6W' }, { value: '12W' }, { value: '18W' }, { value: '24W' }, { value: '36W' }
        ]
      }
    },
    {
      name: 'Panel Empotrable Cuadrado',
      slug: 'panel-empotrable-cuadrado',
      sku: 'CHARATOOLS-PANEL-EMPOTRABLE-CUADRADO',
      short_desc: 'Panel LED empotrable cuadrado para cielo raso y Drywall.',
      description: 'Panel LED empotrable cuadrado para cielo raso y Drywall.',
      is_casheable: false,
      brand_id: brandId,
      category_id: categoryId,
      specs: {
        imagen: '/iluminacion.webp',
        tags: ['LED', 'panel', 'empotrable', 'cuadrado', 'drywall'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'paneles',
        subitem: 'paneles',
        variantLabel: 'Potencia',
        priority: 3,
        variants: [
          { value: '3W' }, { value: '6W' }, { value: '9W' }, { value: '12W' }, { value: '18W' }, { value: '24W' }
        ]
      }
    },
    {
      name: 'Panel Empotrable Redondo',
      slug: 'panel-empotrable-redondo',
      sku: 'CHARATOOLS-PANEL-EMPOTRABLE-REDONDO',
      short_desc: 'Panel LED empotrable redondo de diseño minimalista para interiores.',
      description: 'Panel LED empotrable redondo de diseño minimalista para interiores.',
      is_casheable: false,
      brand_id: brandId,
      category_id: categoryId,
      specs: {
        imagen: '/iluminacion.webp',
        tags: ['LED', 'panel', 'empotrable', 'redondo', 'interior'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'paneles',
        subitem: 'paneles',
        variantLabel: 'Potencia',
        priority: 4,
        variants: [
          { value: '3W' }, { value: '6W' }, { value: '9W' }, { value: '12W' }, { value: '18W' }, { value: '24W' }
        ]
      }
    }
  ];

  console.log("Inserting panels...");
  const { data, error } = await supabase.from('products').upsert(panels, { onConflict: 'slug' }).select();
  if (error) {
    console.error("Error inserting panels:", error);
  } else {
    console.log("Successfully inserted", data.length, "panels!");
  }
}

run().catch(console.error);
