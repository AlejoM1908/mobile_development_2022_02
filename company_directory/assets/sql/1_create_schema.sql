DROP TABLE IF EXISTS `company`;
DROP TABLE IF EXISTS `company_type`;

CREATE TABLE `company` (
    `id` INTEGER NOT NULL PRIMARY KEY,
    `name` VARCHAR(40) NOT NULL,
    `email` VARCHAR(60) NOT NULL,
    `phone` VARCHAR(14) NOT NULL,
    `url` VARCHAR(100) NOT NULL,
    `type` INTEGER REFERENCES `company_type` (`id`),
    `products` VARCHAR(120) NOT NULL
);

CREATE TABLE `company_type` (
    `id` INTEGER NOT NULL PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL
);

INSERT INTO `company_type` (`id`, `name`) VALUES
    (0, 'Consulting'),
    (1, 'SoftwareDevelopment');
