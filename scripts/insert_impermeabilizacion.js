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
  console.log("Upserting brands...");
  const brandsToEnsure = [
    { name: 'Reinco', slug: 'reinco' },
    { name: 'Edil', slug: 'edil' },
    { name: 'Super A', slug: 'super-a' },
    { name: 'Bituplast', slug: 'bituplast' },
    { name: 'Covo', slug: 'covo' },
    { name: 'Zasc', slug: 'zasc' },
    { name: 'Run', slug: 'run' }
  ];

  for (const b of brandsToEnsure) {
    const { error } = await supabase.from('brands').upsert(b, { onConflict: 'slug' });
    if (error) console.error("Error upserting brand", b.slug, error);
  }

  // Fetch brand map
  const { data: bData } = await supabase.from('brands').select('slug, id');
  const brandMap = {};
  bData.forEach(b => { brandMap[b.slug] = b.id; });

  const categoryId = 'ca98fb36-b0ed-4db3-9338-51b809f177bf'; // impermeabilizacion

  const products = [
    {
      name: 'Pintura Elastomérica Impermeabilizante Reinco',
      slug: 'pintura-elastomerica-reinco',
      sku: 'REINCO-PINTURA-ELASTO',
      short_desc: 'Pintura impermeabilizante de alta calidad. Colores: Rojo, Verde, Negro y Blanco.',
      description: 'Pintura elastomérica impermeabilizante formulada para sellar y proteger techos, terrazas y cubiertas. Disponible en colores Rojo, Verde, Negro y Blanco.',
      is_casheable: false,
      brand_id: brandMap['reinco'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['pintura', 'elastomerica', 'impermeabilizante', 'reinco', 'techo'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'pinturas',
        subitem: 'pinturas',
        variantLabel: 'Presentación',
        priority: 1,
        variants: [{ value: 'Galón' }, { value: 'Cuñete' }]
      }
    },
    {
      name: 'Manto Asfáltico Edil',
      slug: 'manto-asfaltico-edil',
      sku: 'EDIL-MANTO',
      short_desc: 'Manto asfáltico certificado para impermeabilización de cubiertas.',
      description: 'Manto asfáltico certificado diseñado para la impermeabilización de áreas comerciales y residenciales. Resiste alto tráfico y exposición UV.',
      is_casheable: false,
      brand_id: brandMap['edil'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['manto', 'asfaltico', 'impermeabilizacion', 'techos', 'edil'],
        stockStatus: 'available',
        unidad: 'rollo',
        subcategory: 'mantos',
        subitem: 'mantos',
        variantLabel: 'Espesor',
        priority: 2,
        variants: [{ value: '2.7 mm' }, { value: '3.2 mm' }]
      }
    },
    {
      name: 'Cemento Plástico Flexi Plastic Super A',
      slug: 'cemento-plastico-super-a',
      sku: 'SUPERA-CEMENTO-PLASTICO',
      short_desc: 'Pasta elastomérica tapa goteras para fisuras y grietas.',
      description: 'Cemento plástico (Flexi Plastic), pasta elastomérica especialmente diseñada para tapar goteras, fisuras y reparar grietas en techos antes de impermeabilizar.',
      is_casheable: false,
      brand_id: brandMap['super-a'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['cemento', 'plastico', 'sellador', 'tapa goteras', 'pasta', 'elastomerica', 'super a'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'selladores',
        subitem: 'selladores',
        variantLabel: 'Presentación',
        priority: 3,
        variants: [{ value: '1/4 Galón' }, { value: 'Cuñete' }]
      }
    },
    {
      name: 'Primer / Imprimador EkoPrimer Edil',
      slug: 'ekoprimer-edil',
      sku: 'EDIL-EKOPRIMER',
      short_desc: 'Primer asfáltico para preparación de superficies antes de impermeabilizar.',
      description: 'EkoPrimer, imprimador asfáltico base para acondicionar placas y superficies asegurando máxima adherencia del manto o impermeabilizante.',
      is_casheable: false,
      brand_id: brandMap['edil'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['primer', 'imprimador', 'ekoprimer', 'asfaltico', 'edil'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'pinturas',
        subitem: 'pinturas',
        variantLabel: 'Presentación',
        priority: 4,
        variants: [{ value: 'Galón' }, { value: 'Cuñete' }]
      }
    },
    {
      name: 'Asfalto Plástico Bituplast',
      slug: 'asfalto-plastico-bituplast',
      sku: 'BITUPLAST-ASFALTO-PLAS',
      short_desc: 'Asfalto plástico cemento para reparaciones y sellado.',
      description: 'Asfalto plástico (Plastic Asphalt Cement) ideal para el sellado y reparación de superficies, juntas y grietas en techos de concreto o metal.',
      is_casheable: false,
      brand_id: brandMap['bituplast'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['asfalto', 'plastico', 'cemento', 'sellador', 'bituplast'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'selladores',
        subitem: 'selladores',
        variantLabel: 'Presentación',
        priority: 5,
        variants: [{ value: '1/4 Galón' }, { value: 'Galón' }]
      }
    },
    {
      name: 'Sellador Impermeabilizante Transparente Covo',
      slug: 'sellador-impermeable-covo',
      sku: 'COVO-SELLADOR-IMP',
      short_desc: 'Sellador impermeabilizante transparente para protección de superficies.',
      description: 'Sellador impermeabilizante transparente Covo (Waterproof Sealant), ideal para sellar filtraciones y proteger superficies conservando su apariencia original.',
      is_casheable: false,
      brand_id: brandMap['covo'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['sellador', 'impermeabilizante', 'transparente', 'covo'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'selladores',
        subitem: 'selladores',
        variantLabel: 'Presentación',
        priority: 6,
        variants: [{ value: '500 ml' }, { value: '1 Litro' }]
      }
    },
    {
      name: 'Cinta de Aluminio de Butilo Zasc',
      slug: 'cinta-aluminio-butilo-zasc',
      sku: 'ZASC-CINTA-BUTILO',
      short_desc: 'Cinta de aluminio de butilo multipropósito.',
      description: 'Cinta de aluminio de butilo multipropósito Zasc. Excelente resistencia térmica y poder de sellado garantizado para techos, tuberías y superficies expuestas.',
      is_casheable: false,
      brand_id: brandMap['zasc'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['cinta', 'aluminio', 'butilo', 'zasc', 'sellado', 'tapagoteras'],
        stockStatus: 'available',
        unidad: 'rollo',
        subcategory: 'mantos',
        subitem: 'mantos',
        variantLabel: 'Ancho',
        priority: 7,
        variants: [{ value: '3"' }, { value: '4"' }]
      }
    },
    {
      name: 'Espuma Expansiva Run',
      slug: 'espuma-expansiva-run',
      sku: 'RUN-ESPUMA-EXP',
      short_desc: 'Espuma expansiva para relleno y aislamiento.',
      description: 'Espuma expansiva de poliuretano (Expanding Sealant Foam) marca Run, para el relleno, aislamiento térmico/acústico y sellado de grietas y cavidades.',
      is_casheable: false,
      brand_id: brandMap['run'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['espuma', 'expansiva', 'poliuretano', 'run', 'aislamiento', 'relleno'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'selladores',
        subitem: 'selladores',
        variantLabel: 'Presentación',
        priority: 8,
        variants: [{ value: '300 ml' }]
      }
    },
    {
      name: 'Adhesivo de Montaje Reinco',
      slug: 'adhesivo-montaje-reinco',
      sku: 'REINCO-ADHESIVO-MONTAJE',
      short_desc: 'Adhesivo de montaje listo para usar.',
      description: 'Adhesivo de montaje Reinco, listo para usar y fácil de aplicar. Ideal para fijaciones fuertes en construcción y remodelación sin necesidad de perforar.',
      is_casheable: false,
      brand_id: brandMap['reinco'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['adhesivo', 'montaje', 'reinco', 'pegamento', 'fijacion'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'selladores',
        subitem: 'selladores',
        variantLabel: 'Presentación',
        priority: 9,
        variants: [{ value: '1/4 Galón' }]
      }
    },
    {
      name: 'Sellador No Más Clavos Zasc',
      slug: 'sellador-no-mas-clavos-zasc',
      sku: 'ZASC-NO-MAS-CLAVOS',
      short_desc: 'Adhesivo de montaje Unión Sin Clavo de secado rápido.',
      description: 'Adhesivo de montaje Unión Sin Clavo Zasc (Nail-free adhesive). Extra fuerte, de secado rápido, perfecto para adherir zócalos, molduras y paneles sin usar clavos.',
      is_casheable: false,
      brand_id: brandMap['zasc'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['sellador', 'no mas clavos', 'zasc', 'adhesivo', 'montaje'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'selladores',
        subitem: 'selladores',
        variantLabel: 'Presentación',
        priority: 10,
        variants: [{ value: '300 ml' }]
      }
    },
    {
      name: 'Silicona Neutra RTV Zasc',
      slug: 'silicona-neutra-zasc',
      sku: 'ZASC-SILICONA-NEUTRA',
      short_desc: 'Silicona neutra RTV para sellado profesional. Colores: Blanco y Negro.',
      description: 'Silicona neutra RTV marca Zasc de alto rendimiento, resistente a la intemperie y humedad. Ideal para el sellado profesional de vidrio, aluminio, metales y superficies no porosas.',
      is_casheable: false,
      brand_id: brandMap['zasc'],
      category_id: categoryId,
      specs: {
        imagen: '/categoria-impermeabilizacion.webp',
        tags: ['silicona', 'neutra', 'zasc', 'rtv', 'sellador', 'adhesivo'],
        stockStatus: 'available',
        unidad: 'und',
        subcategory: 'selladores',
        subitem: 'selladores',
        variantLabel: 'Color',
        priority: 11,
        variants: [{ value: 'Blanco (300ml)' }, { value: 'Negro (300ml)' }]
      }
    }
  ];

  console.log("Upserting impermeabilización products...");
  const { data, error } = await supabase.from('products').upsert(products, { onConflict: 'slug' }).select();
  if (error) {
    console.error("Error upserting products:", error);
  } else {
    console.log("Successfully upserted", data.length, "impermeabilización products!");
  }
}

run();
