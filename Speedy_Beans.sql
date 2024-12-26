drop database speedy_beans;
create database speedy_beans;

use speedy_beans;
-- Creazione della tabella Persone
CREATE TABLE Persone (
    id_persona INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200),
    cognome VARCHAR(200),
    username VARCHAR(200) UNIQUE,
    password VARCHAR(200) 
);

-- Creazione della tabella Utente
CREATE TABLE Utenti (
    id_persona INT PRIMARY KEY,
    ragione_sociale VARCHAR(200),
    partita_iva VARCHAR(200),
    codice_sdi VARCHAR(200),
    indirizzo VARCHAR(200),
    cap INT,
    citta VARCHAR(200),
    provincia VARCHAR(200),
    nazione VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(200),
    FOREIGN KEY (id_persona) REFERENCES Persone(id_persona)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Inserimento dati nella tabella Persone
INSERT INTO Persone (nome, cognome, username, password) VALUES
('Mario', 'Rossi', 'mrossi', 'password1'),
('Luigi', 'Verdi', 'lverdi', 'password2'),
('Anna', 'Bianchi', 'abianchi', 'password3');

-- Inserimento dati nella tabella Utenti
INSERT INTO Utenti (id_persona, ragione_sociale, partita_iva, codice_sdi, indirizzo, cap, citta, provincia, nazione, telefono, email) VALUES
(1, 'Negozio Rossi SRL', 'IT12345678901', 'SDI12345', 'Via Roma, 1', 200, 'Roma', 'RM', 'Italia', '1234567890', 'mrossi@negoziorossi.it'),
(2, 'Verdi Import', 'IT98765432109', 'SDI54321', 'Via Milano, 2', 20200, 'Milano', 'MI', 'Italia', '0987654321', 'lverdi@verdiimport.it');


-- Insert 30 new users into Persone
INSERT INTO Persone (nome, cognome, username, password) VALUES
('Giovanni', 'Rossi1', 'grossi1', 'password11'),
('Giulia', 'Rossi2', 'grossi2', 'password12'),
('Paolo', 'Rossi3', 'prossi3', 'password13'),
('Claudia', 'Rossi4', 'crossi4', 'password14'),
('Francesco', 'Rossi5', 'frossi5', 'password15'),
('Marco', 'Rossi6', 'mrossi6', 'password16'),
('Sara', 'Rossi7', 'srossi7', 'password17'),
('Elisa', 'Rossi8', 'erossi8', 'password18'),
('Andrea', 'Rossi9', 'arossi9', 'password19'),
('Silvia', 'Rossi10', 'srossi10', 'password110'),
('Federico', 'Rossi11', 'frossi11', 'password111'),
('Laura', 'Rossi12', 'lrossi12', 'password112'),
('Alessandro', 'Rossi13', 'arossi13', 'password113'),
('Marta', 'Rossi14', 'mrossi14', 'password114'),
('Davide', 'Rossi15', 'drossi15', 'password115'),
('Elena', 'Rossi16', 'erossi16', 'password116'),
('Matteo', 'Rossi17', 'mrossi17', 'password117'),
('Valentina', 'Rossi18', 'vrossi18', 'password118'),
('Roberto', 'Rossi19', 'rrossi19', 'password119'),
('Michela', 'Rossi20', 'mrossi20', 'password120'),
('Carlo', 'Rossi21', 'crossi21', 'password121'),
('Alessia', 'Rossi22', 'arossi22', 'password122'),
('Luca', 'Rossi23', 'lrossi23', 'password123'),
('Chiara', 'Rossi24', 'crossi24', 'password124'),
('Giorgio', 'Rossi25', 'grossi25', 'password125'),
('Marina', 'Rossi26', 'mrossi26', 'password126'),
('Vincenzo', 'Rossi27', 'vrossi27', 'password127'),
('Angela', 'Rossi28', 'arossi28', 'password128'),
('Emanuele', 'Rossi29', 'erossi29', 'password129'),
('Simona', 'Rossi30', 'srossi30', 'password130');

-- Insert corresponding entries in Utenti with diverse business names
INSERT INTO Utenti (id_persona, ragione_sociale, partita_iva, codice_sdi, indirizzo, cap, citta, provincia, nazione, telefono, email) VALUES
(4, 'Tech Solutions SRL', 'IT123450001', 'SDI0001', 'Via Roma, 10', 10000, 'Napoli', 'NA', 'Italia', '1234500000', 'grossi1@azienda.it'),
(5, 'Green Energy SRL', 'IT123450002', 'SDI0002', 'Via Milano, 20', 10001, 'Milano', 'MI', 'Italia', '1234500001', 'grossi2@azienda.it'),
(6, 'Logistica Avanzata SPA', 'IT123450003', 'SDI0003', 'Via Firenze, 30', 10002, 'Firenze', 'FI', 'Italia', '1234500002', 'prossi3@azienda.it'),
(7, 'Marketing Innovativo SRL', 'IT123450004', 'SDI0004', 'Via Torino, 40', 10003, 'Torino', 'TO', 'Italia', '1234500003', 'crossi4@azienda.it'),
(8, 'Studio Legale Rossi & Associati', 'IT123450005', 'SDI0005', 'Via Bologna, 50', 10004, 'Bologna', 'BO', 'Italia', '1234500004', 'frossi5@azienda.it'),
(9, 'Servizi Finanziari SRL', 'IT123450006', 'SDI0006', 'Via Palermo, 60', 10005, 'Palermo', 'PA', 'Italia', '1234500005', 'mrossi6@azienda.it'),
(10, 'Farmacia Centrale', 'IT123450007', 'SDI0007', 'Via Venezia, 70', 10006, 'Venezia', 'VE', 'Italia', '1234500006', 'srossi7@azienda.it'),
(11, 'Pasticceria Delizia', 'IT123450008', 'SDI0008', 'Via Genova, 80', 10007, 'Genova', 'GE', 'Italia', '1234500007', 'erossi8@azienda.it'),
(12, 'Ristorante Bella Italia', 'IT123450009', 'SDI0009', 'Via Bari, 90', 10008, 'Bari', 'BA', 'Italia', '1234500008', 'arossi9@azienda.it'),
(13, 'E-Commerce Fashion SRL', 'IT123450010', 'SDI0010', 'Via Padova, 100', 10009, 'Padova', 'PD', 'Italia', '1234500009', 'srossi10@azienda.it'),
(14, 'Costruzioni Edili Rossi', 'IT123450011', 'SDI0011', 'Via Trieste, 110', 10010, 'Trieste', 'TS', 'Italia', '1234500010', 'frossi11@azienda.it'),
(15, 'Innovazione Medica SRL', 'IT123450012', 'SDI0012', 'Via Brescia, 120', 10011, 'Brescia', 'BS', 'Italia', '1234500011', 'lrossi12@azienda.it'),
(16, 'Autosalone Rossi SPA', 'IT123450013', 'SDI0013', 'Via Trento, 130', 10012, 'Trento', 'TN', 'Italia', '1234500012', 'arossi13@azienda.it'),
(17, 'Import Export Rossi', 'IT123450014', 'SDI0014', 'Via Ravenna, 140', 10013, 'Ravenna', 'RA', 'Italia', '1234500013', 'mrossi14@azienda.it'),
(18, 'Supermercato Rossi SRL', 'IT123450015', 'SDI0015', 'Via Perugia, 150', 10014, 'Perugia', 'PG', 'Italia', '1234500014', 'drossi15@azienda.it'),
(19, 'Centro Estetico Elegance', 'IT123450016', 'SDI0016', 'Via Ancona, 160', 10015, 'Ancona', 'AN', 'Italia', '1234500015', 'erossi16@azienda.it'),
(20, 'Agenzia Viaggi Rossi', 'IT123450017', 'SDI0017', 'Via Pescara, 170', 10016, 'Pescara', 'PE', 'Italia', '1234500016', 'mrossi17@azienda.it'),
(21, 'Impresa Pulizie Shine', 'IT123450018', 'SDI0018', 'Via Campobasso, 180', 10017, 'Campobasso', 'CB', 'Italia', '1234500017', 'vrossi18@azienda.it'),
(22, 'Hotel Mare Blu SRL', 'IT123450019', 'SDI0019', 'Via Catanzaro, 190', 10018, 'Catanzaro', 'CZ', 'Italia', '1234500018', 'rrossi19@azienda.it'),
(23, 'Assicurazioni Sicure SRL', 'IT123450020', 'SDI0020', 'Via Potenza, 200', 10019, 'Potenza', 'PZ', 'Italia', '1234500019', 'mrossi20@azienda.it'),
(24, 'Agenzia Immobiliare Rossi', 'IT123450021', 'SDI0021', 'Via Matera, 210', 10020, 'Matera', 'MT', 'Italia', '1234500020', 'crossi21@azienda.it'),
(25, 'Studio Grafico Creativo', 'IT123450022', 'SDI0022', 'Via Reggio, 220', 10021, 'Reggio Calabria', 'RC', 'Italia', '1234500021', 'arossi22@azienda.it'),
(26, 'Panetteria Fresco Pane', 'IT123450023', 'SDI0023', 'Via Siena, 230', 10022, 'Siena', 'SI', 'Italia', '1234500022', 'lrossi23@azienda.it'),
(27, 'Falegnameria Artigiana', 'IT123450024', 'SDI0024', 'Via Taranto, 240', 10023, 'Taranto', 'TA', 'Italia', '1234500023', 'crossi24@azienda.it'),
(28, 'Studio Architettura Moderna', 'IT123450025', 'SDI0025', 'Via Salerno, 250', 10024, 'Salerno', 'SA', 'Italia', '1234500024', 'grossi25@azienda.it'),
(29, 'Riparazioni Rossi', 'IT123450026', 'SDI0026', 'Via Cosenza, 260', 10025, 'Cosenza', 'CS', 'Italia', '1234500025', 'mrossi26@azienda.it'),
(30, 'Centro Benessere Relax', 'IT123450027', 'SDI0027', 'Via Sassari, 270', 10026, 'Sassari', 'SS', 'Italia', '1234500026', 'vrossi27@azienda.it'),
(31, 'Fattoria Bio Verde', 'IT123450028', 'SDI0028', 'Via Nuoro, 280', 10027, 'Nuoro', 'NU', 'Italia', '1234500027', 'arossi28@azienda.it'),
(32, 'Laboratorio Analisi Sanitaria', 'IT123450029', 'SDI0029', 'Via Lodi, 290', 10028, 'Lodi', 'LO', 'Italia', '1234500028', 'erossi29@azienda.it'),
(33, 'Servizi IT Global SRL', 'IT123450030', 'SDI0030', 'Via Sondrio, 300', 10029, 'Sondrio', 'SO', 'Italia', '1234500029', 'srossi30@azienda.it');

-- Inserimento di 3 nuove persone nella tabella Persone
INSERT INTO Persone (nome, cognome, username, password) VALUES
('Alberto', 'Gialli', 'agialli', 'password131'),
('Monica', 'Blu', 'mblu', 'password132'),
('Stefano', 'Neri', 'sneri', 'password133');



-- Inserimento di 5 nuove persone nella tabella Persone
INSERT INTO Persone (nome, cognome, username, password) VALUES
('Valerio', 'Ferrarini', 'vferrarini', 'password134'),
('Clara', 'Sorrentino', 'csorrentino', 'password135'),
('Giorgio', 'Leoni', 'gleoni', 'password136'),
('Elena', 'Marinelli', 'emarinelli', 'password137'),
('Marco', 'Toscani', 'mtoscani', 'password138');

