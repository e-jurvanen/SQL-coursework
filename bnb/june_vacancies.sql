CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name", COUNT(*) AS "days_vacant"
FROM "availabilities"
JOIN "listings" ON "listings"."id" = "availabilities"."listing_id"
WHERE "available" = 'TRUE'
AND "date" BETWEEN '2023-06-01' AND '2023-06-30'
GROUP BY "listing_id";

