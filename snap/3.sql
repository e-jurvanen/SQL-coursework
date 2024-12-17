WITH "top_3_friends" AS (
SELECT "to_user_id", COUNT(*) as "messages_count" FROM "messages"
WHERE "from_user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'creativewisdom377'
)
GROUP BY "to_user_id"
ORDER BY "messages_count" DESC
LIMIT 3)

SELECT "to_user_id" FROM "top_3_friends";
