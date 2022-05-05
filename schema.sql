DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS encounters CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS players CASCADE;
-- DROP TABLE IF EXISTS specials CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS heroes CASCADE;
DROP TABLE IF EXISTS bag CASCADE;


CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    item_name TEXT NOT NULL,
    gift INTEGER NOT NULL
);

CREATE TABLE bag (
    bag_id SERIAL PRIMARY KEY,
    item_id INTEGER REFERENCES items(id),
    item_quantity INTEGER,
    item_effect INTEGER 
);

CREATE TABLE encounters (
    id SERIAL PRIMARY KEY,
    enc_type TEXT NOT NULL,
    enc_atk INTEGER,
    enc_hp INTEGER
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    name TEXT,
    plot TEXT,
    c1 TEXT,
    c2 TEXT,
    c3 TEXT,
    m1 INTEGER,
    m2 INTEGER,
    m3 INTEGER,
    cost INTEGER,
    enc INTEGER REFERENCES encounters(id),
    item_id INTEGER REFERENCES items(id),
    img TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_hash TEXT,
    name VARCHAR(20) NOT NULL
);

-- CREATE TABLE specials (
--     sp_name TEXT NOT NULL PRIMARY KEY,
--     sp_atk INTEGER,
--     mp_val INTEGER
-- );

CREATE TABLE classes (
    hero_class VARCHAR(20) NOT NULL PRIMARY KEY,
    hero_atk INTEGER,
    hero_hp INTEGER,
    hero_mp INTEGER,
    item INTEGER REFERENCES items(id)
    -- sp_1 TEXT REFERENCES specials(sp_name),
    -- sp_2 TEXT REFERENCES specials(sp_name)
);

CREATE TABLE heroes (
    id SERIAL PRIMARY KEY,
    p_id INTEGER REFERENCES players(id),
    hero_name TEXT,
    hero_class TEXT REFERENCES classes(hero_class),
    hero_atk INTEGER, 
    hero_hp INTEGER, 
    hero_mp INTEGER, 
    -- hero_item TEXT REFERENCES encounters(enc_type),
    location_id INTEGER REFERENCES locations(id),
    items INTEGER REFERENCES bag(bag_id)
);

