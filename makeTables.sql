------------------------------------------------------------
-- TABLE CREATION COMMANDS
------------------------------------------------------------
CREATE TABLE Player
(
    Player_no INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Gold INT NOT NULL,
    Silver INT NOT NULL,
    Copper INT NOT NULL,
    Lvl INT NOT NULL,
    Str INT NOT NULL,
    Dex INT NOT NULL,
    Wis INT NOT NULL,
    Con INT NOT NULL,
    Intel INT NOT NULL,
    Charisma INT NOT NULL,
    PRIMARY KEY(Player_no)
    CONSTRAINT check_Str CHECK (Str <= 20)
    CONSTRAINT check_Dex CHECK (Dex <= 20)
    CONSTRAINT check_Wis CHECK (Wis <= 20)
    CONSTRAINT check_Con CHECK (Con <= 20)
    CONSTRAINT check_Intel CHECK (Intel <= 20)
    CONSTRAINT check_Charisma CHECK (Charisma <= 20)
);

CREATE TABLE Class
(
    Player_no INT NOT NULL,
    Class VARCHAR(255) NOT NULL,
    PRIMARY KEY(Player_no, Class),
    FOREIGN KEY (Player_no) REFERENCES Player(Player_no)
);

CREATE TABLE Weapon
(
    Weapon_id INT NOT NULL,
    Owner INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Damage_value INT NOT NULL,
    Gold INT NOT NULL,
    Silver INT NOT NULL,
    Copper INT NOT NULL,
    Description VARCHAR(255),
    PRIMARY KEY(Weapon_id),
    FOREIGN KEY (Owner) REFERENCES Player(Player_no)
);


CREATE TABLE Weapon_Damage
(
    Weapon_id INT NOT NULL,
    Damge_type VARCHAR(255) NOT NULL,
    PRIMARY KEY(Weapon_id, Damge_type),
    FOREIGN KEY (Weapon_id) REFERENCES Player(Player_no)
);

CREATE TABLE Armour
(
    Armour_id INT NOT NULL,
    Owner INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Armour_bonus INT NOT NULL,
    Gold INT NOT NULL,
    Silver INT NOT NULL,
    Copper INT NOT NULL,
    Description VARCHAR(255),
    PRIMARY KEY(Armour_id),
    FOREIGN KEY (Owner) REFERENCES Player(Player_no)
);


CREATE TABLE Spell
(
    Spell_id INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Damage_value INT NOT NULL,
    Duration INT NOT NULL,
    Range INT NOT NULL,
    Cast_time INT NOT NULL,
    PRIMARY KEY(Spell_id)
);

CREATE TABLE Knows_spell
(
    Player_no INT NOT NULL,
    Spell_id INT NOT NULL,
    PRIMARY KEY(Player_no, Spell_id),
    FOREIGN KEY (Player_no) REFERENCES Player(Player_no),
    FOREIGN KEY (Spell_id) REFERENCES Spell(Spell_id)
);

CREATE TABLE Spell_damage
(
    Spell_id INT NOT NULL,
    Damage_type VARCHAR(255) NOT NULL,
    PRIMARY KEY(Spell_id, Damage_type),
    FOREIGN KEY (Spell_id) REFERENCES Spell(Spell_id)
);

CREATE TABLE Component
(
    Spell_id INT NOT NULL,
    Component VARCHAR(255) NOT NULL,
    PRIMARY KEY(Spell_id, Component),
    FOREIGN KEY (Spell_id) REFERENCES Spell(Spell_id)
);

CREATE TABLE Dungeon
(
    Dungeon_no INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Challenge_rating INT NOT NULL,
    Area VARCHAR(255) NOT NULL,
    PRIMARY KEY(Dungeon_no)
);

CREATE TABLE Monster
(
    Monster_id INT NOT NULL,
    Home_dungeon INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    HP INT NOT NULL,
    Challenge_rating INT NOT NULL,
    AC INT NOT NULL,
    Experiance INT NOT NULL,
    Str INT NOT NULL,
    Dex INT NOT NULL,
    Wis INT NOT NULL,
    Con INT NOT NULL,
    Intel INT NOT NULL,
    Charisma INT NOT NULL,
    PRIMARY KEY(Monster_id),
    FOREIGN KEY (Home_dungeon) REFERENCES Dungeon(Dungeon_no)
);

CREATE TABLE Loot
(
    Loot_id INT NOT NULL,
    Location INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
   	Gold INT NOT NULL,
    Silver INT NOT NULL,
    Copper INT NOT NULL,
    Description VARCHAR(255),
    PRIMARY KEY(Loot_id),
    FOREIGN KEY (Location) REFERENCES Dungeon(Dungeon_no)
);

------------------------------------------------------------
-- TABLE CREATION COMMANDS END
------------------------------------------------------------














