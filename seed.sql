-- INSERT INTO VALUES

-- NTS
-- SQL = NULL
-- PYTHON = NONE

-- items (name, gift)
-- locations (name, plot, c1, c2, c3, m1, m2, m3, cost, enc, item)
-- INSERT INTO locations (name, plot, c1, c2, c3, m1, m2, m3, cost, enc, item, img) VALUES ();
-- players (email, password_hash, name)
-- specials (sp_name, sp_atk, mp_val) - NOT CURRENT
-- classes (hero_class, hero_atk, hero_hp, hero_mp)
-- encounters (enc_type, enc_atk, enc_hp)
-- heroes (hero_id, hero_class, hero_atk, hero_hp, hero_mp, location_id)

INSERT INTO items (name, gift) VALUES ('FLASK potion', 50); -- heals 50 points of any
INSERT INTO items (name, gift) VALUES ('Java Script', 20); -- heals 20 points of any
INSERT INTO items (name, gift) VALUES ('Cascading Time Script', 0); -- allows you turn reverse time 
INSERT INTO items (name, gift) VALUES ('SQLiser', 25); -- buffs ATK by 25 points
INSERT INTO items (name, gift) VALUES ('Python', 30); -- buffs ATK by 35 points
INSERT INTO items (name, gift) VALUES ('Hyper Potion - Alien Language', 50); -- heals 50 points of aLL

INSERT INTO locations (name, plot, c1, c2, c3, m1, m2, m3, cost, enc, item, img) 
VALUES ('a darkly lit cavern', 'You awaken to find yourself in a darkly lit cavern and when your eyes adjust, you notice a door.',
'Head for the door', 'Examine your surroundings', NULL , 85, 28, NULL, 
NULL, NULL, NULL, 'image.png');

-- INSERT INTO specials (sp_name, sp_atk, mp_val) VALUES ('Phantasy Slash', 70, 20);
-- INSERT INTO specials (sp_name, sp_atk, mp_val) VALUES ('Slice n Dice', 45, 10);

-- INSERT INTO specials (sp_name, sp_atk, mp_val) VALUES ('Meteoric Break', 120, 50);
-- INSERT INTO specials (sp_name, sp_atk, mp_val) VALUES ('Pyro Flare', 20, 15);

-- INSERT INTO specials (sp_name, sp_atk, mp_val) VALUES ('Breaking n Entering', 60, 30);
-- INSERT INTO specials (sp_name, sp_atk, mp_val) VALUES ('Steal', 40, 10);

-- INSERT INTO specials (sp_name, sp_atk, mp_val) VALUES ('Coin Toss Explosion', 100, 0);
-- INSERT INTO specials (sp_name, sp_atk, mp_val) VALUES ('Rugpull', 10, 0);


INSERT INTO classes (hero_class, hero_atk, hero_hp, hero_mp) VALUES ('Knight', 35, 100, 30);
INSERT INTO classes (hero_class, hero_atk, hero_hp, hero_mp) VALUES ('Mage', 15, 70, 70);
INSERT INTO classes (hero_class, hero_atk, hero_hp, hero_mp) VALUES ('Thief', 25, 100, 40);
INSERT INTO classes (hero_class, hero_atk, hero_hp, hero_mp) VALUES ('Lucky Liero', 25, 200, 0);

-- INSERT INTO heroes (hero_id, hero_class, hero_atk, hero_hp, hero_mp, location_id) VALUES (1, 'King Knight', 100, 100, 100, 1)