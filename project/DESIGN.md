# Design Document

By Emilia Jurvanen

Video overview: <https://youtu.be/7vkDuaXnwu8>

## Scope

The purpose of this database is to help people look up information regarding the Animal Crossing video game series. The series has introduced over 580 characters and many events over multiple games. The characters and events differ between the games so the database helps players keep track of what they are capable of doing in each of the series' games.

The scope of this database includes:

* All of the 6 main games, their release years and the consoles they were released on
* All of the villagers and special characters included in the main games, including the main identifying information about them (i.e. names, species, personalities, birthdays)
* All of the events in the main games, the types of the events and the months the events are being held in
* All of the collectible amiibo cards of the characters

Actual event dates were left outside of this database's scope for simplicities sake, since many of the event dates differ yearly and the games have around a 50 year set event schedule for each of the games. That would require mapping out the events yearly for each event for 50 years per each game. The database could eventually be updated to also hold the actual event dates but for now, even the month of the event is being held in, will help players plan out their play sessions.

## Functional Requirements

Users of this database should be able to:

* Keep track of all the events and characters present in each game of the series
* Help track which amiibo packs (which have random cards tied a specific series) to buy when they want to get a specific character

In this iteration of the database, the users are not cabable of searching for proper event dates, just the months the events are being held in.

## Representation

### Entities

The entitites in this database include:

#### Games

The `games` table includes:

* `id`, it specifies the unique ID as an `INTEGER` for the different games in the series. It also acts as the `PRIMARY KEY` for this table.
* `title`, specifies the name of the game as `TEXT`, since text is an appropriate type for names. The titles have a `UNQUE` constraint to them, there are no repeating titles in the history of the series.
* `release-year`, specifies the release year for the game as an `INTEGER`, years can be appropriately represented as an integer so that is why this type is used.
* `console`, specifies the console which the game was released on as `TEXT`. Again console names are easily represented as text.

All columns are required so `NOT NULL` constraint has been given to all columns.

#### Special Characters

The `special-characters` table includes:

* `id`, it gives the unique ID for the special characters. Type `INTEGER` was used here and the constraint `PRIMARY KEY` was also applied.
* `name`, specifies the name of the character as `TEXT` since it is an appropriate type. This column also has the `UNIQUE` constraint to make sure there are no doubles of the same character.
* `species`, specifies the species of the character as `TEXT`. Again text is an approriate type for this type of information.
* `birthday-DD-MM`, speficies the birth date and month for the characters. This data type was decided to show as `TEXT` since we don't need to display the years for the birthdays as well.

The `NOT NULL` constraint has been given to all columns except for the `birthday-DD-MM` column because some of the characters in the earliest games were not given a birthday.

#### Villagers

The `villagers` table includes:

* `id`, it gives the unique ID for the villagers. Type `INTEGER` was used here and the constraint `PRIMARY KEY` was also applied.
* `name`, , specifies the name of the villager as `TEXT` since it is an appropriate type. Unlike the special characters column, this column does NOT use the `UNIQUE` constraint, since there have been repeated villager names for certain characters (and potential name changes if they have been brought back in later games).
* `species`, specifies the species of the character as `TEXT`. Again text is an approriate type for this type of information.
* `personality`, specifies the personality of the villager. This is shown as `TEXT` since it is the appropriate data type. This column also uses a `CHECK` constraint to limit the text you can type in the columns. The input should be one of the 8 existing personality types.
* `birthday-DD-MM`, speficies the birth date and month for the characters. This data type was decided to show as `TEXT` since we don't need to display the years for the birthdays as well.

Similarly to the `special-characters` table, the `NOT NULL` constraint has been given to all columns except for the `birthday-DD-MM` column because some of the villagers in the earliest games were not given a birthday.

#### Events

The `events` table includes:

* `id`, it gives the unique ID for the events. Type `INTEGER` was used here and the constraint `PRIMARY KEY` was also applied.
* `name`, specifies the name of the event as `TEXT` since it is an appropriate type.
* `type`, specifies the type of the event. This is shown as `TEXT` since it is the appropriate data type. This column also uses a `CHECK` constraint to limit the type of the event to 3 possible inputs.
* `game-id`, specifies the game the event is being held in as an `INTEGER`. This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `games` table.
* `special-character-id`, specifies if a special character is a part of this event. This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `special-characters` table. There is no `NOT NULL` constraint for this column, since not all events have a character tied to them.
* `event-month`, specifies the month the event is being organized as type `TEXT`. A more detailed reasoning why only event month was chosen for the database can be found in the section `SCOPE`.

All of the columns have a restriction `NOT NULL` unless specified otherwise in the column description.

#### Amiibos

The `amiibos` table includes:

* `id`, it gives the unique ID for the amiibo cards. Type `INTEGER` was used here and the constraint `PRIMARY KEY` was also applied.
* `card-number`, shows the actual numbering on the collecible cards as `TEXT`. The type text was chosen, since the Sanrio series card numbers are represented as S1, S2... and so forth. This column also doesn't have a `UNIQUE` constraint because the card numbers repeat in a few of series. Also, `NOT NULL` was not used, since there are 3 promotional cards that didn't have numbers associated with them.
* `special-character-id`, specifies if a special character is tied to the card. This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `special-characters` table. There is no `NOT NULL` constraint for this column, since a card is either tied to a special character or a villager.
* `villager-id`, specifies if a villager is tied to the card. This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `villagers` table. There is no `NOT NULL` constraint for this column, since a card is either tied to a special character or a villager.
* `series`, specifies the name of the series this card is a part of as `TEXT`. The `CHECK`
constraint is used for this column to limit the possible inputs the the 8 possible series' names.

All of the columns have a restriction `NOT NULL` unless specified otherwise in the column description.

#### Special Character Connections

The `special-character-connections` table includes:

* `id`, it gives the unique ID for the connections the special characters have with different games and events. Type `INTEGER` was used here and the constraint `PRIMARY KEY` was also applied.
* `special-character-id`, specifies which special character this connection is tied to. This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `special-characters` table.
* `game-id`, specifies which game the special character is tied to. This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `games` table.
* `event-id`, specifies which event the special character is tied to (if any). This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `events` table. There is no `NOT NULL` constraint applied since the character might not be apart of an event in certain games but the character might still be included in that game.
* `type`, specifies the role of the special character in a specific game as `TEXT`. The `CHECK` constraint was applied to limit the possible inputs to the 5 different role types the characters can have in the games.

All of the columns have a restriction `NOT NULL` unless specified otherwise in the column description.

#### Villager Connections

The `villager-connections` table includes:
* `id`, it gives the unique ID for the connections the villagers have with different games. Type `INTEGER` was used here and the constraint `PRIMARY KEY` was also applied.
* `villager-id`, specifies which villager this connection is tied to. This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `villagers` table.
* `game-id`, specifies which game the villager is tied to. This column was given the `FOREIGN KEY` constraint to reference the `id` column from the `games` table.

All of the columns have a restriction `NOT NULL` because all of them are needed.

### Relationships

![ER Diagram](Animal_Crossing_Entity_Diagram.png)

As shown in the diagram:

* A single game can include a one to multiple of special character- and villager-connections. However, a single connections is only tied to a single game.
* A game can organize multiple different events in it and one event instance will only apear in a single game.
* Events also might have a special character assocciated with them. However, not all events are tied to special characters so there might be zero to multiple ties to special character connections. A single connection might also have zero or one connection to an event.
* The relationships between the special characters/the villagers and their "connections" tables are very similar so I will explain them both here and refer to both of the as "characters" from now on. One character can have multiple connections but one connection is only connected to a specific character.
* The relationships between the amiibos, special characters and villagers are again really similar so I will explain them both here and I will refer to both special characters and villagers as "characters". A character might be included in multiple amiibo cards (mainly special characters have duplicate cards, but a few promotional cards also have duplicates for the villagers). However, a specific amiibo only includes one character.

## Optimizations

Villager and special character's names are specifically searched for in a lot of the queries. Since there are a lot of different character names, I've created indexes for both special character names and villager names as `sc-names` and `villager-names` to speed up query times.

Other often searched attributes include the game titles, however, since there are only 6 different games in the database so far (and it will take multiple years in between new entries to the games), I decided it was not neccessary to create an index for it.

## Limitations

The current iteration of the database is not cabable of tracking event dates too well. It is currently only cabable of tracking event months to save up needed space for data storage.
