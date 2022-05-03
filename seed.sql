-- INSERT INTO VALUES

-- locations (name, plot)
-- players (email, password_hash, name)
-- specials (sp_name, sp_atk, mp_val)
-- classes (hero_class, hero_atk, hero_hp, hero_mp, sp_1, sp_2)
-- encounters (enc_type, enc_atk, enc_hp, enc_gift)
-- heroes (hero_id, hero_class, hero_atk, hero_hp, hero_mp, location_id)

INSERT INTO locations (name, plot) VALUES ('a darkly lit cavern', 'You awaken to find yourself in a darkly lit cavern and when your eyes adjust, you notice a door.');

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