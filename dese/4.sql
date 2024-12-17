SELECT "city", COUNT(*) AS "number of public schools" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "number of public schools" DESC, "city" ASC
LIMIT 10;
