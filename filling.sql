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

INSERT INTO scenario (name, description, image)
VALUES
('L\'Infiltrazione Notturna', 'La squadra si avvicina furtivamente al confine del territorio nemico sotto la copertura della notte. Il campo è sorvegliato da pattuglie armate e droni di sorveglianza.', '../img/Scenario1.jpg'),
('Il Villaggio Abbandonato', 'Falco 7 scopre un villaggio abbandonato che potrebbe fornire rifugio temporaneo, ma ci sono segni che i terroristi potrebbero aver piazzato delle trappole.', '../img/Scenario2.jpg'),
('La Tempesta di Sabbia', 'Una tempesta di sabbia improvvisa riduce drasticamente la visibilità, mettendo a rischio l\'intera squadra.', '../img/Scenario3.jpg'),
('Il Ponte Minato', 'La squadra arriva a un ponte che attraversa un canyon, ma scopre che è stato minato dai terroristi.', '../img/Scenario4.jpg'),
('Il Campo Nemico', 'La squadra scopre un campo nemico con armi e rifornimenti, ma è pesantemente sorvegliato.', '../img/Scenario5.jpg'),
('La Torre di Guardia', 'La squadra deve passare vicino a una torre di guardia nemica con cecchini ben posizionati.', '../img/Scenario6.jpg'),
('Il Complesso Nemico', 'La squadra arriva finalmente al complesso dove sono tenuti gli ostaggi, ma l\'area è fortificata con numerose guardie e sistemi di sicurezza avanzati.', '../img/Scenario7.jpg'),
('La Fuga', 'Con gli ostaggi liberati, la squadra deve fuggire prima che arrivino i rinforzi nemici. La fuga è complicata da diversi fattori, tra cui il terreno e la presenza di pattuglie nemiche.', '../img/Scenario8.jpg');