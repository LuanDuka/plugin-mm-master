const fs = require('fs');
const xml2js = require('xml2js');

// Function to sanitize keys
function sanitizeKey(key) {
  return key.replace(/[^a-zA-Z0-9_]/g, '_'); // Replace invalid characters with underscores
}

// Function to sanitize the entire object
function sanitizeObject(obj) {
  if (typeof obj !== 'object' || obj === null) {
    return obj; // Return non-objects as is
  }

  if (Array.isArray(obj)) {
    return obj.map(sanitizeObject); // Recursively sanitize array elements
  }

  return Object.keys(obj).reduce((acc, key) => {
    const sanitizedKey = sanitizeKey(key);
    acc[sanitizedKey] = sanitizeObject(obj[key]); // Recursively sanitize object properties
    return acc;
  }, {});
}

// Function to extract spell name from URL
function extractSpellName(url) {
  const parts = url.split('/');
  return parts[parts.length - 1]; // Get the last part of the URL
}

// Read the monsters.json file
fs.readFile('monsters.json', 'utf8', (err, data) => {
  if (err) {
    console.error('Error reading monsters.json:', err);
    return;
  }

  // Parse the JSON data
  const monsters = JSON.parse(data);

  // Sanitize the monsters data
  const sanitizedMonsters = sanitizeObject(monsters);

  // Create an XML builder
  const builder = new xml2js.Builder();

  // Prepare the XML structure
  const xmlData = {
    monsters: {
      monster: sanitizedMonsters.map(monster => ({
        slug: monster.slug,
        name: monster.name,
        desc: monster.desc,
        size: monster.size,
        type: monster.type,
        subtype: monster.subtype,
        alignment: monster.alignment,
        armor_class: monster.armor_class,
        armor_desc: monster.armor_desc,
        hit_points: monster.hit_points,
        hit_dice: monster.hit_dice,
        speed: Object.keys(monster.speed).reduce((acc, key) => {
          acc[sanitizeKey(key)] = monster.speed[key]; // Include all speed types
          return acc;
        }, {}),
        strength: monster.strength,
        dexterity: monster.dexterity,
        constitution: monster.constitution,
        intelligence: monster.intelligence,
        wisdom: monster.wisdom,
        charisma: monster.charisma,
        perception: monster.perception,
        damage_vulnerabilities: monster.damage_vulnerabilities,
        damage_resistances: monster.damage_resistances,
        damage_immunities: monster.damage_immunities,
        condition_immunities: monster.condition_immunities,
        senses: monster.senses,
        languages: monster.languages,
        challenge_rating: monster.challenge_rating,
        actions: monster.actions.map(action => ({
          name: action.name,
          desc: action.desc,
          attack_bonus: action.attack_bonus,
          damage_dice: action.damage_dice
        })),
        legendary_actions: monster.legendary_actions ? monster.legendary_actions.map(action => ({
          name: action.name,
          desc: action.desc
        })) : [],
        special_abilities: monster.special_abilities ? monster.special_abilities.map(ability => ({
          name: ability.name,
          desc: ability.desc
        })) : [],
        spell_list: monster.spell_list.map(spell => ({
          name: extractSpellName(spell) // Extract the spell name from the URL
        })),
        page_no: monster.page_no,
        document_slug: monster.document__slug,
        document_title: monster.document__title,
        document_license_url: monster.document__license_url,
        document_url: monster.document__url,
        v2_converted_path: monster.v2_converted_path,
        skills: Object.keys(monster.skills).map(skill => ({
          name: sanitizeKey(skill),
          value: typeof monster.skills[skill] === 'number' ? monster.skills[skill] : null // Include value if it exists
        }))
      }))
    }
  };

  // Convert the XML data to XML format
  const xml = builder.buildObject(xmlData);

  // Write the XML to monsterListData.xml
  fs.writeFile('monsterListData.xml', xml, (err) => {
    if (err) {
      console.error('Error writing monsterListData.xml:', err);
      return;
    }
    console.log('Database transferred successfully from monsters.json to monsterListData.xml');
  });
});
