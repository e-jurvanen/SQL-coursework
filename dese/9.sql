SELECT "name" FROM "expenditures"
JOIN "districts" ON "districts"."id" = "expenditures"."district_id"
WHERE "pupils" IN (
    SELECT MIN("pupils") FROM "expenditures"
);
