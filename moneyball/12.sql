SELECT "first_name", "last_name" FROM "players"
WHERE "players"."id" IN (
    SELECT "players"."id" FROM "players"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    JOIN "performances" ON "performances"."player_id" = "players"."id"
    WHERE "salaries"."year" = 2001
    AND "H" > 0
    AND "salaries"."year" = "performances"."year"
    ORDER BY ("salary"/"H") ASC, "first_name", "last_name"
    LIMIT 10
)
AND "players"."id" IN (
    SELECT "players"."id" FROM "players"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    JOIN "performances" ON "performances"."player_id" = "players"."id"
    WHERE "salaries"."year" = 2001
    AND "RBI" > 0
    AND "salaries"."year" = "performances"."year"
    ORDER BY ("salary"/"RBI") ASC, "first_name", "last_name"
    LIMIT 10
)
ORDER BY "players"."id";


