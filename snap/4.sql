WITH "most_popular_user" AS (
SELECT "to_user_id", COUNT(*) AS "no_of_messages" FROM "messages"
GROUP BY "to_user_id"
ORDER BY "no_of_messages" DESC
LIMIT 1)

SELECT "username" FROM "users"
WHERE "id" = (
    SELECT "to_user_id" FROM "most_popular_user"
);
