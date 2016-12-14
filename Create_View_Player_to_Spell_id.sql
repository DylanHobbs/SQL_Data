CREATE VIEW Player_to_Spell_id
	AS SELECT Player.Name, Knows_Spell.Spell_id
	FROM Player, Knows_Spell
	WHERE Player.Player_no = Knows_Spell.Player_no;


-----------------------------------------------------
-- This view allows a query to get spells with one
-- query instead of 2. Query is detailed below
-----------------------------------------------------
-- SELECT Player_to_Spell_id.Name, Spell.Name 
-- FROM Spell, Player_to_Spell_id 
-- WHERE Player_to_Spell_id.Spell_id = Spell.Spell_id;
-----------------------------------------------------