const fs = require('fs');

function convertToSpecificXml(jsonData) {
  let xml = '';
  let idCounter = 3; // Starting ID as seen in your example

  // Process each monster
  jsonData.monsters.forEach((monster, monsterIndex) => {
    // Start monster element with __EHEX_31
    xml += `<__EHEX_31 name="${escapeXml(monster.name)}" slug="${escapeXml(monster.slug)}" size="${escapeXml(monster.size)}" type="${escapeXml(monster.type)}" alignment="${escapeXml(monster.alignment)}">\n`;

    // Process simple string properties
    const simpleProps = ['desc', 'subtype', 'group', 'armor_desc', 'hit_dice', 'senses', 'languages', 'challenge_rating'];
    simpleProps.forEach(prop => {
      if (monster[prop]) {
        xml += `    <${prop} __EHEX_31="${escapeXml(monster[prop])}">\n`;
        xml += `        <__ndb__ id="${idCounter++}" t___EHEX_31="S" />\n`;
        xml += `    </${prop}>\n`;
      }
    });

    // Process numeric properties
    const numericProps = ['armor_class', 'hit_points', 'strength', 'dexterity', 'constitution',
      'intelligence', 'wisdom', 'charisma', 'cr'];
    numericProps.forEach(prop => {
      if (monster[prop] !== undefined) {
        xml += `    <${prop} __EHEX_31="${monster[prop]}">\n`;
        xml += `        <__ndb__ id="${idCounter++}" t___EHEX_31="N" />\n`;
        xml += `    </${prop}>\n`;
      }
    });

    // Process speed object
    if (monster.speed) {
      xml += `    <speed ${Object.entries(monster.speed).map(([key, val], i) => `__EHEX_${i + 31}="${val}"`).join(' ')}>\n`;
      xml += `        <__ndb__ id="${idCounter++}" ${Object.keys(monster.speed).map((_, i) => `t___EHEX_${i + 31}="N"`).join(' ')} />\n`;
      xml += `    </speed>\n`;
    }

    // Process damage properties (resistances, immunities, vulnerabilities)
    const damageProps = ['damage_resistances', 'damage_immunities', 'damage_vulnerabilities'];
    damageProps.forEach(prop => {
      if (monster[prop]) {
        const values = monster[prop].split(';').map(v => v.trim()).filter(v => v);
        if (values.length > 0) {
          xml += `    <${prop} ${values.map((val, i) => `__EHEX_${i + 31}="${escapeXml(val)}"`).join(' ')}>\n`;
          xml += `        <__ndb__ id="${idCounter++}" ${values.map((_, i) => `t___EHEX_${i + 31}="S"`).join(' ')} />\n`;
          xml += `    </${prop}>\n`;
        }
      }
    });

    // Process condition immunities
    if (monster.condition_immunities) {
      const conditions = monster.condition_immunities.split(',').map(c => c.trim()).filter(c => c);
      if (conditions.length > 0) {
        xml += `    <condition_immunities ${conditions.map((c, i) => `__EHEX_${i + 31}="${escapeXml(c)}"`).join(' ')}>\n`;
        xml += `        <__ndb__ id="${idCounter++}" ${conditions.map((_, i) => `t___EHEX_${i + 31}="S"`).join(' ')} />\n`;
        xml += `    </condition_immunities>\n`;
      }
    }

    // Process skills
    if (monster.skills && Object.keys(monster.skills).length > 0) {
      xml += `    <skills ${Object.entries(monster.skills).map(([skill, val], i) => `__EHEX_${i + 31}="${skill}:${val}"`).join(' ')}>\n`;
      xml += `        <__ndb__ id="${idCounter++}" ${Object.keys(monster.skills).map((_, i) => `t___EHEX_${i + 31}="S"`).join(' ')} />\n`;
      xml += `    </skills>\n`;
    }

    // Process actions
    if (monster.actions && monster.actions.length > 0) {
      xml += `    <actions __EHEX_31="${monster.actions.length}">\n`;
      xml += `        <__ndb__ id="${idCounter++}" t___EHEX_31="N" />\n`;
      monster.actions.forEach((action, actionIndex) => {
        xml += `        <action_${actionIndex} name="${escapeXml(action.name)}" ${action.desc ? `desc="${escapeXml(action.desc)}"` : ''} ${action.attack_bonus ? `attack_bonus="${action.attack_bonus}"` : ''} ${action.damage_dice ? `damage_dice="${escapeXml(action.damage_dice)}"` : ''}>\n`;
        xml += `            <__ndb__ id="${idCounter++}" t_name="S" ${action.desc ? 't_desc="S"' : ''} ${action.attack_bonus ? 't_attack_bonus="N"' : ''} ${action.damage_dice ? 't_damage_dice="S"' : ''} />\n`;
        xml += `        </action_${actionIndex}>\n`;
      });
      xml += `    </actions>\n`;
    }

    // Process special abilities
    if (monster.special_abilities && monster.special_abilities.length > 0) {
      xml += `    <special_abilities __EHEX_31="${monster.special_abilities.length}">\n`;
      xml += `        <__ndb__ id="${idCounter++}" t___EHEX_31="N" />\n`;
      monster.special_abilities.forEach((ability, abilityIndex) => {
        xml += `        <ability_${abilityIndex} name="${escapeXml(ability.name)}" desc="${escapeXml(ability.desc)}">\n`;
        xml += `            <__ndb__ id="${idCounter++}" t_name="S" t_desc="S" />\n`;
        xml += `        </ability_${abilityIndex}>\n`;
      });
      xml += `    </special_abilities>\n`;
    }

    // Add the root __ndb__ element
    xml += `    <__ndb__ id="3" t_name="S" t_slug="S" t_size="S" t_type="S" t_alignment="S" />\n`;

    // Close monster element
    xml += `</__EHEX_31>\n\n`;
  });

  return xml;
}

// Helper function to escape XML special characters
function escapeXml(unsafe) {
  if (!unsafe) return '';
  return unsafe.toString()
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

// Read and process the JSON file
try {
  const jsonData = JSON.parse(fs.readFileSync('monsters.json', 'utf8'));
  const xmlOutput = `<?xml version="1.0" encoding="UTF-8"?>\n<monsterList>\n${convertToSpecificXml(jsonData)}</monsterList>`;

  // Write the output to file
  fs.writeFileSync('monsterListData.xml', xmlOutput);
  console.log('Conversion complete! Output written to monsterListData.xml');
} catch (error) {
  console.error('Error processing file:', error.message);
}