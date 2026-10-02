const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');
const envFile = fs.readFileSync('.env.local', 'utf8');
const env = {};
envFile.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=(.*)$/);
  if (match) env[match[1]] = match[2].trim();
});
const supabaseUrl = env['NEXT_PUBLIC_SUPABASE_URL'];
const supabaseKey = env['SUPABASE_SERVICE_ROLE_KEY'];
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  const { data: bData } = await supabase.from('brands').select('slug, id');
  console.log("Brands:", bData);
  const { data: cData } = await supabase.from('categories').select('slug, id');
  console.log("Categories:", cData);
}
run();
