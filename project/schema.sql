-- Represents the different games in the series
CREATE TABLE "games" (
    "id" INTEGER,
    "title" TEXT NOT NULL UNIQUE,
    "release-year" INTEGER NOT NULL,
    "console" TEXT NOT NULL,
    PRIMARY KEY("id")
);

--Represents different characters in the series
CREATE TABLE "special-characters" (
    "id" INTEGER,
    "name" TEXT UNIQUE NOT NULL,
    "species" TEXT NOT NULL,
    "birthday-DD-MM" TEXT,
    PRIMARY KEY("id")
);

-- Shows which games different special characters have been in and what types of events and character types they were connected to (might differ between games)
CREATE TABLE "special-character-connections" (
    "id" INTEGER,
    "special-character-id" INTEGER NOT NULL,
    "game-id" INTEGER NOT NULL,
    "event-id" INTEGER,
    "type" TEXT CHECK("type" IN ('Goverment', 'Proprietor', 'Islander', 'Holiday Visitor', 'Regular Visitor')),
    PRIMARY KEY("id"),
    FOREIGN KEY("special-character-id") REFERENCES "special-characters"("id"),
    FOREIGN KEY("game-id") REFERENCES "games"("id"),
    FOREIGN KEY("event-id") REFERENCES "events"("id")
); 

--Represents different villagers met in the series
CREATE TABLE "villagers" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "species" TEXT NOT NULL,
    "personality" TEXT NOT NULL CHECK("personality" IN ('Jock', 'Lazy', 'Smug', 'Cranky', 'Sisterly', 'Snooty', 'Normal', 'Peppy')),
    "birthday-DD-MM" TEXT,
    PRIMARY KEY("id"),
);

-- Shows which games different villagers have been a part of
CREATE TABLE "villager-connections" (
    "id" INTEGER,
    "villager-id" INTEGER NOT NULL,
    "game-id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("game-id") REFERENCES "games"("id")
);

-- Represents different events held in the games
CREATE TABLE "events" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL CHECK("type" IN ('Competition', 'Holiday', 'Mini-Holiday')),
    "game-id" INTEGER NOT NULL,
    "special-character-id" INTEGER,
    "event-month" TEXT NOT NULL, -- Decided to save up space on database by not adding actual dates. Multiple events have different event dates for each year
    PRIMARY KEY("id"),
    FOREIGN KEY("game-id") REFERENCES "games"("id")
    FOREIGN KEY("special-character-id") REFERENCES "special-characters"("id")
);

--Represents collectible amiibo cards for different characters
CREATE TABLE "amiibos" (
    "id" INTEGER,
    "card-number" TEXT, --Has to be in text format since a few cards are numberd as S1, S2 etc
    "special-character-id" INTEGER,
    "villager-id" INTEGER,
    "series" TEXT NOT NULL CHECK("series" IN ('Series 1', 'Series 2', 'Series 3', 'Series 4', 'Series 5', 'Welcome Amiibo', 'Sanrio', 'Promo')),
    PRIMARY KEY("id"),
    FOREIGN KEY("special-character-id") REFERENCES "special-characters"("id"),
    FOREIGN KEY("villager-id") REFERENCES "villagers"("id"),
);

-- Indexes to speed up searches
CREATE INDEX "villager-names" ON "villagers"("name")
CREATE INDEX "sc-names" ON "special-characters"("name")
