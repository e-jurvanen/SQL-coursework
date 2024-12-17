.import --csv meteorites.csv meteorites_temp

CREATE TABLE meteorites (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = "";

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = "";

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = "";

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = "";

ALTER TABLE "meteorites_temp"
DROP COLUMN "id";

ALTER TABLE "meteorites_temp"
DROP COLUMN "nametype";

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", ROUND("mass", 2), "discovery", "year", ROUND("lat", 2), ROUND("long", 2) FROM "meteorites_temp"
ORDER BY "year" ASC, "name";
