SELECT "name", "evaluated", "exemplary" FROM "staff_evaluations"
JOIN "districts" ON "districts"."id" = "staff_evaluations"."district_id"
ORDER BY "evaluated" DESC;
