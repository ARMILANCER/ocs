ALTER TABLE scenario ADD COLUMN description TEXT NOT NULL;

ALTER TABLE choice DROP COLUMN name;
ALTER TABLE choice ADD COLUMN description TEXT NOT NULL;

ALTER TABLE characters DROP short_description;
ALTER TABLE `characters` CHANGE `long_description` `long_description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE `user` ADD `wins` INT AFTER `password`;