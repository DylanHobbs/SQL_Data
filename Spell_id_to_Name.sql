SELECT Player_to_Spell_id.Name, Spell.Name 
FROM Spell, Player_to_Spell_id 
WHERE Player_to_Spell_id.Spell_id = Spell.Spell_id;