SELECT "first_name", "last_name", ("salary"/"H") AS "dollars per hit" FROM "players"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
JOIN "performances" ON "performances"."player_id" = "players"."id"
WHERE "H" > 0
AND "salaries"."year" = "performances"."year"
AND "salaries"."year" = 2001
GROUP BY "players"."id"
ORDER BY "dollars per hit" ASC, "first_name", "last_name"
LIMIT 10;
