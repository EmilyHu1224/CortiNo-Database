-- DROP TABLE `measurement_notes`;
-- DROP TABLE `measurement_tags`;
-- DROP TABLE `measurements`;
-- DROP TABLE `user_tags`;
-- DROP TABLE `user_information`;
-- DROP TABLE `users`;

CREATE TABLE `users`(
    `user_id` CHAR(36) PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `salt` VARCHAR(255) NOT NULL,
    `hash` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `user_information`(
    `user_id` CHAR(36) PRIMARY KEY REFERENCES `users`(`user_id`),
    `name` VARCHAR(255) NOT NULL,
    `birth_year` YEAR NULL,
    `sex` INT NULL
);
CREATE TABLE `user_tags`(
    `tag_id` CHAR(36) PRIMARY KEY,
    `user_id` CHAR(36) NOT NULL REFERENCES `users`(`user_id`),
    `tag_name` VARCHAR(255) NOT NULL,
    `is_deleted` TINYINT(1) NULL
);
CREATE TABLE `measurements`(
    `user_id` CHAR(36) NOT NULL REFERENCES `users`(`user_id`),
    `reading` DOUBLE(8, 2) NOT NULL,
    `measurement_id` CHAR(36) PRIMARY KEY,
    `measured_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `measurement_tags`(
    `tag_id` INT NOT NULL REFERENCES `user_tags`(`tag_id`),
    `measurement_id` INT NOT NULL REFERENCES `measurements`(`measurement_id`)
);
CREATE TABLE `measurement_notes`(
    `measurement_id` INT NOT NULL REFERENCES `measurements`(`measurement_id`),
    `notes` VARCHAR(255) NOT NULL
);