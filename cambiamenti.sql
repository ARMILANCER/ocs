-- Database modification
ALTER TABLE scenario ADD COLUMN description TEXT NOT NULL;

ALTER TABLE choice DROP COLUMN name;
ALTER TABLE choice ADD COLUMN description TEXT NOT NULL;

ALTER TABLE characters DROP short_description;
ALTER TABLE `characters` CHANGE `long_description` `long_description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE `user` ADD `wins` INT AFTER `password`;
-- DB structure

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
  description text NOT NULL
);

CREATE TABLE IF NOT EXISTS characters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(70) NOT NULL UNIQUE,
    long_description text NOT NULL
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

-- Database population
INSERT INTO scenario (name, description) VALUES ("L'infiltrazione notturna", "La squadra si avvicina furtivamente al confine del territorio nemico sotto la copertura della notte. Il campo è sorvegliato da pattuglie armate e droni di sorveglianza.");
INSERT INTO scenario (name, description) VALUES ("Il villaggio abbandonato", "Falco 7 scopre un villaggio abbandonato che potrebbe fornire rifugio temporaneo, ma ci sono segni che i terroristi potrebbero aver piazzato delle trappole.");
INSERT INTO scenario (name, description) VALUES ("La tempesta di sabbia", "Una tempesta di sabbia improvvisa riduce drasticamente la visibilità, mettendo a rischio l'intera squadra.");
INSERT INTO scenario (name, description) VALUES ("Il ponte minato", "La squadra arriva a un ponte che attraversa un canyon, ma scopre che è stato minato dai terroristi.");
INSERT INTO scenario (name, description) VALUES ("Il campo nemico", "La squadra scopre un campo nemico con armi e rifornimenti, ma è pesantemente sorvegliato.");
INSERT INTO scenario (name, description) VALUES ("La torre di guardia", "La squadra deve passare vicino a una torre di guardia nemica con cecchini ben posizionati.");
INSERT INTO scenario (name, description) VALUES ("Il quartier generale nemico", "La squadra arriva finalmente al complesso dove sono tenuti gli ostaggi, ma l'area è fortificata con numerose guardie e sistemi di sicurezza avanzati.");
INSERT INTO scenario (name, description) VALUES ("La fuga", "Con gli ostaggi liberati, la squadra deve fuggire prima che arrivino i rinforzi nemici. La fuga è complicata da diversi fattori, tra cui il terreno e la presenza di pattuglie nemiche.");

INSERT INTO choice (id_scenario, description) VALUES
(1, 'Dividere la squadra in due gruppi: Falco e Torre distraggono i nemici mentre Snake si infiltra furtivamente.'),
(1, "Utilizzare dispositivi di disturbo per confondere i droni e avanzare in un'unica formazione compatta."),
(2, 'Inviare Snake a esplorare il villaggio da solo, sfruttando le sue abilità di infiltrazione.'),
(2, 'Entrare tutti insieme, muovendosi lentamente e con cautela per evitare le trappole.'),
(3, 'Fermarsi e aspettare che la tempesta si calmi, rischiando di perdere tempo prezioso.'),
(3, 'Procedere lentamente, usando strumenti di navigazione avanzati per mantenere la rotta.'),
(4, 'Torre disinnesca le mine mentre Falco e Snake coprono la zona.'),
(4, 'Cercare un percorso alternativo attraverso il canyon, nonostante il rischio di rallentare la missione.'),
(5, 'Infiltrarsi di notte per rubare rifornimenti e sabotare le armi.'),
(5, "Evitare il campo e proseguire senza attirare l'attenzione."),
(6, 'Snake prende posizione e elimina i cecchini uno per uno.'),
(6, 'Evitare il confronto e cercare un percorso alternativo.'),
(7, 'Utilizzare Torre per disattivare i sistemi di sicurezza e aprire una breccia silenziosa.'),
(7, 'Pianificare un assalto coordinato, sfruttando tutti i membri della squadra per un attacco frontale.'),
(8, 'Utilizzare un veicolo nemico per una fuga rapida.'),
(8, 'Fuggire a piedi attraverso un percorso meno sorvegliato.');

INSERT INTO characters (name, long_description) VALUES
("Capitano Marco Bianchi: Falco", "Il Capitano Marco Bianchi, conosciuto con il nome in codice Falco, è il leader indiscusso della squadra. Con un'esperienza militare vasta e diversificata, è un comandante rispettato e stimato dai suoi uomini. La sua abilità nel prendere decisioni rapide e precise è fondamentale per il successo delle missioni. Determinato e coraggioso, guida la squadra attraverso le sfide più difficili con fermezza e sagacia.");
INSERT INTO characters (name, long_description) VALUES
("Sergente Matteo Russo: Torre", "Il Sergente Matteo Russo, soprannominato Torre, è il pilastro della squadra. Esperto nell'uso di armi pesanti e nella pianificazione tattica, è la spalla su cui tutti possono fare affidamento in situazioni critiche. Con la sua calma e la sua determinazione, è un punto di riferimento per i suoi compagni, sempre pronto a proteggerli e a guidarli verso la vittoria.");
INSERT INTO characters (name, long_description) VALUES
("Soldato Andrea Ferrari: Snake", "Il Soldato Andrea Ferrari, conosciuto come Snake, è il fulcro dell'azione della squadra. Abile nell'infiltrarsi dietro le linee nemiche e nel condurre operazioni di ricognizione, è una risorsa preziosa per la squadra. Con la sua determinazione ferrea e la sua abilità nel combattimento a distanza, è sempre pronto a mettere a repentaglio la propria vita per il successo della missione e il benessere dei suoi compagni.");
INSERT INTO characters (name, long_description) VALUES
("Soldato semplice", "Il Soldato Semplice è un membro generico della squadra, addestrato per supportare in qualsiasi ruolo necessario. Sebbene non possieda delle competenze specialistiche esso è versatile e adattabile. Pronto a seguire gli ordini e a eseguire compiti di base, è un elemento essenziale per mantenere l'efficacia della squadra in situazioni critiche.");
