SELECT DISTINCT "name" FROM "teams"
JOIN "performances" ON "performances"."team_id" = "teams"."id"
WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE "first_name" = 'Satchel'
    AND "last_name" = 'Paige'
);
