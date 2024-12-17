
-- *** The Lost Letter ***

-- At first, I want to find the ID of the delivery address

SELECT "id" FROM "addresses"
WHERE "address" = '2 Finnegan Street';

-- We didn't get any results, so I'm going to see if I can find the address of the sender

SELECT "id" FROM "addresses"
WHERE "address" = '900 Somerville Avenue';

-- We found an id for the address so let's now check what was scanned at that address

SELECT "package_id", "action", "timestamp" FROM "scans"
WHERE "address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
);

-- We found multiple packages being picked from this address. Now we can check the contents and delivery address of these packages.

SELECT "id", "contents" FROM "packages"
WHERE "id" IN (
    SELECT "package_id" FROM "scans"
    WHERE "address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
    )
);

-- We found the ID for the Congratulatory letter. We can now check to see the latest scan for the package_id.

SELECT "package_id", "address_id", "action", "timestamp" FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "id" IN (
        SELECT "package_id" FROM "scans"
        WHERE "address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
    )
);

-- We can see that the package has been dropped off at address_id 854. Let's see what the address is and what type of an address it is.

SELECT * FROM "addresses"
WHERE "id" = 854;

-- We found the package at 2 Finnigan Street, Residential.

-- *** The Devious Delivery ***

-- First, let's see if we can find a package that doesn't have a from_address_id.

SELECT * FROM "packages"
WHERE "from_address_id" IS NULL;

-- We found a package for a duck debugger where there is no from address. Let's check the scans for that package.

SELECT * FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" IS NULL
);

-- We can see the address id it has been dropped off to. Let's see what that address is.

SELECT * FROM "addresses"
WHERE "id" IN (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    ) AND "action" = 'Drop'
);

-- We found the Duck debugger package at the Police Station.

-- *** The Forgotten Gift ***

-- Let's check packages that have the from address given to us

SELECT * FROM "packages"
WHERE "to_address_id" IN (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);

-- We found a package of flowers. I'll check to see if the from address also matches 109 Tileston Street.

SELECT * FROM "addresses"
WHERE "id" = 9873;

--It did, let's see where this package has been scanned

SELECT * FROM "scans"
WHERE "package_id" IN (
    SELECT "id" FROM "packages"
    WHERE "to_address_id" IN (
        SELECT "id" FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
);

-- We can see that the package of flowers has been last picked up by a certain driver with the ID 17. Let's see who that driver is.

SELECT * FROM "drivers"
WHERE "id" = 17;

-- The package of flowers has last been seen with driver Mikel.
