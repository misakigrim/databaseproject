DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS specials CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS encounters CASCADE;
DROP TABLE IF EXISTS heroes CASCADE;

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    name TEXT,
    plot TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_hash TEXT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE specials (
    sp_name TEXT NOT NULL PRIMARY KEY,
    sp_atk INTEGER,
    mp_val INTEGER
);

CREATE TABLE classes (
    hero_class VARCHAR(20) NOT NULL PRIMARY KEY,
    hero_atk INTEGER,
    hero_hp INTEGER,
    hero_mp INTEGER
    -- sp_1 TEXT REFERENCES specials(sp_name),
    -- sp_2 TEXT REFERENCES specials(sp_name)
);

CREATE TABLE encounters (
    id SERIAL PRIMARY KEY,
    enc_type TEXT NOT NULL,
    enc_atk INTEGER,
    enc_hp INTEGER,
    enc_gift INTEGER
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
    location_id INTEGER REFERENCES locations(id)
);

