-- Adding a new game when a new one launches
INSERT INTO "games" ("title", "release-year", "console")
VALUES ('Animal Crossing New Horizons', 2020, 'Nintendo Switch');

-- Adding new special characters (or new character instances, same characters can be in multiple games) due to a new game/update
INSERT INTO "special-characters" ("name", "species", "game-id", "event-id", "birthday-DD-MM", "type")
VALUES ('Tom Nook', 'Tanooki', 1, NULL, '30-05', 'Goverment');

-- Adding new villagers (or new villager instances, same characters can be in multiple games) due to a new game/update
INSERT INTO "villagers" ("name", "species", "personality", "game-id", "birthday-DD-MM")
VALUES ('Bob', 'Cat', 'Lazy', 1, '01-01');

-- Finding all the villagers (or special characters, just need to change the table you're searching from) in New Horizons (can be used for different games by replacing the game title)
SELECT * FROM "villagers"
WHERE "game-id" = (
    SELECT "id" FROM "games"
    WHERE "title" = 'Animal Crossing New Horizons'
);

-- Finding which events different special characters are a part of (in this example Tom Nook)
SELECT "name", "game-id" FROM "events"
WHERE "special-character-id" IN (
    SELECT "id" FROM "special-characters"
    WHERE "name" = 'Tom Nook'
);

-- Finding all villagers with a certain personality type
SELECT "name" FROM "villagers"
WHERE "personality" = 'Jock';

-- Finding which amiibo series a character is a part of
SELECT "series" FROM "amiibos"
WHERE "villager-id" = (
    SELECT "id" FROM "villagers"
    WHERE "name" = 'Bob'
);

