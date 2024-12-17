CREATE TABLE `users`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(36) NOT NULL,
    `last_name` VARCHAR(36) NOT NULL,
    `username` VARCHAR(20) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(36),
    `founding_year` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(36) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business'),
    `location` VARCHAR(36),
    PRIMARY KEY(`id`)
);

CREATE TABLE `people_connections`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id1` INT UNSIGNED NOT NULL,
    `user_id2` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id1`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_id2`) REFERENCES `users`(`id`)
);

CREATE TABLE `school_connections`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `school_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree_type` VARCHAR(5),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `company_connections`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `company_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(36),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
