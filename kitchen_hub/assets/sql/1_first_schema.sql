CREATE TABLE IF NOT EXISTS `Storage` (
    `id` INTEGER NOT NULL PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Category` (
    `id` INTEGER NOT NULL PRIMARY KEY,
    `icon` INTEGER NOT NULL,
    `name` VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Product` (
    `id` INTEGER NOT NULL PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    `icon` INTEGER NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `ct_fk` INTEGER NOT NULL,
    FOREIGN KEY(`ct_fk`) REFERENCES `Category`(`id`)
);

CREATE TABLE IF NOT EXISTS `Savings` (
    `id` INTEGER NOT NULL PRIMARY KEY,
    `amount` DECIMAL(10,2) NOT NULL,
    `added` DATETIME NOT NULL,
    `pd_fk` INTEGER NOT NULL,
    `st_fk` INTEGER NOT NULL,
    `pr_fk` INTEGER NOT NULL,
    FOREIGN KEY(`st_fk`) REFERENCES `Storage`(`id`),
    FOREIGN KEY(`pr_fk`) REFERENCES `Product`(`id`)
);
