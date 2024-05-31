CREATE TABLE IF NOT EXISTS `user` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    mail VARCHAR(150) NOT NULL UNIQUE,
    `password` VARCHAR(30) NOT NULL,
    wins int (11)
);

CREATE TABLE IF NOT EXISTS scenario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  image VARCHAR(200) UNIQUE,
  description text not null
);

CREATE TABLE IF NOT EXISTS characters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(70) NOT NULL UNIQUE,
    long_description text NOT NULL,
    image VARCHAR(200) UNIQUE
);

CREATE TABLE IF NOT EXISTS choice (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    id_scenario INT NOT NULL,
    FOREIGN KEY (id_scenario) REFERENCES scenario(id)
);

CREATE TABLE IF NOT EXISTS character_user (
    id_user INT NOT NULL,
    id_character INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES `user`(id),
    FOREIGN KEY (id_character) REFERENCES characters(id)
);

CREATE TABLE IF NOT EXISTS `match` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    timer INT NOT NULL,
    score INT NOT NULL,
    `image` varchar(200) UNIQUE,
    id_user INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES `user`(id)
);

CREATE TABLE IF NOT EXISTS match_scenario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_scenario INT NOT NULL,
    id_match INT NOT NULL,
    FOREIGN KEY (id_scenario) REFERENCES scenario(id),
    FOREIGN KEY (id_match) REFERENCES `match`(id)
);

CREATE TABLE IF NOT EXISTS user_choice (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_match INT NOT NULL,
    id_choice INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_match) REFERENCES `match`(id),
    FOREIGN KEY (id_choice) REFERENCES choice(id)
);