USE Football;
--------------------------------------------
-- CREATE TABLES
CREATE TABLE players (
player_id INT(10) AUTO_INCREMENT,
name VARCHAR(20) UNIQUE NOT NULL,
age TINYINT(3) NOT NULL,
ovr SMALLINT(3) NOT NULL,
wage DECIMAL(6,1) NOT NULL,
market_value DECIMAL(5,2) NOT NULL,
dob DATE NOT NULL,
PRIMARY KEY (player_id)
);
-----------
CREATE TABLE teams (
team_id INT(10) AUTO_INCREMENT,
name VARCHAR(20) UNIQUE NOT NULL,
ucl_trophies TINYINT(3) DEFAULT 0,
captain_start_date DATE NOT NULL,
PRIMARY KEY (team_id)
);
ALTER TABLE teams MODIFY COLUMN captain_start_date DATE DEFAULT NULL;
-----------
CREATE TABLE loans (
loan_id INT(10) AUTO_INCREMENT,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
fee DECIMAL(6,2) DEFAULT 0,
PRIMARY KEY (loan_id)
);
-----------
CREATE TABLE agents (
agent_id INT(10) AUTO_INCREMENT,
name VARCHAR(20) UNIQUE NOT NULL,
age TINYINT(3) NOT NULL,
PRIMARY KEY (agent_id)
);
--------------------------------------------
-- ADD FOREIGN KEYS TO players TABLE
ALTER TABLE players ADD team_id INT(10) DEFAULT NULL;
ALTER TABLE players ADD captained_by INT(10) DEFAULT NULL;
ALTER TABLE players ADD agent_id INT(10) DEFAULT NULL;
-----------
ALTER TABLE players
ADD FOREIGN KEY(team_id)
REFERENCES teams(team_id)
ON DELETE SET NULL;
-----------
ALTER TABLE players
ADD FOREIGN KEY(captained_by)
REFERENCES players(player_id)
ON DELETE SET NULL;
-----------
ALTER TABLE players
ADD FOREIGN KEY(agent_id)
REFERENCES agents(agent_id)
ON DELETE SET NULL;
--------------------------------------------
-- ADD FOREIGN KEYS TO players TABLE
ALTER TABLE teams ADD captain INT(10) DEFAULT NULL;
ALTER TABLE teams
ADD FOREIGN KEY(captain)
REFERENCES players(player_id)
ON DELETE SET NULL;
--------------------------------------------
-- ADD FOREIGN KEYS TO loans TABLE
ALTER TABLE loans ADD player_id INT(10) DEFAULT NULL;
ALTER TABLE loans
ADD FOREIGN KEY(player_id)
REFERENCES players(player_id)
ON DELETE SET NULL;

ALTER TABLE loans ADD club_from INT(10) DEFAULT NULL;
ALTER TABLE loans
ADD FOREIGN KEY(club_from)
REFERENCES teams(team_id)
ON DELETE SET NULL;

ALTER TABLE loans ADD club_to INT(10) DEFAULT NULL;
ALTER TABLE loans
ADD FOREIGN KEY(club_to)
REFERENCES teams(team_id)
ON DELETE SET NULL;
--------------------------------------------
-- INSERT INTO players TABLE
INSERT INTO players(name, age, ovr, wage, market_value, dob)
VALUES
('Burki', 32, 90, 14, 312, '1997-10-08'),
('Kross', 24, 93, 14, 336, '1992-12-01'),
('Chilwell', 34, 84, 29, 59, '1998-06-16'),
('Koke', 29, 92, 12, 161, '1984-12-26'),
('Ozil', 34, 99, 20, 91, '1988-11-05'),
('Dybala', 19, 99, 14, 114, '1991-05-06'),
('Lindelof', 23, 86, 18, 110, '1982-03-20'),
('McTominay', 32, 88, 27, 115, '1998-11-26'),
('Firmino', 20, 87, 20, 179, '1996-03-28'),
('Sterling', 22, 99, 28, 347, '1995-07-18'),
('Cuadrado', 32, 93, 16, 152, '1985-10-25'),
('Casemiro', 32, 94, 25, 222, '1989-06-14'),
('Morata', 24, 99, 22, 345, '1992-02-17'),
('Tielemans', 24, 99, 21, 95, '1982-10-09'),
('Godin', 32, 85, 19, 248, '1987-04-19'),
('D Ambrosio', 30, 85, 23, 264, '1997-07-09'),
('Insigne', 22, 98, 19, 135, '1996-06-13'),
('Carvajal', 31, 98, 25, 197, '1994-04-24'),
('Sule', 32, 87, 29, 145, '1986-07-11'),
('Neymar', 29, 84, 18, 164, '1997-10-27'),
('Saul', 18, 96, 25, 141, '1984-03-07'),
('Bonucci', 18, 87, 21, 65, '1982-09-09'),
('Suarez', 22, 87, 24, 314, '1989-01-16'),
('Fred', 31, 81, 11, 325, '1985-12-06'),
('Emerson', 34, 86, 10, 307, '2000-10-18'),
('Coutinho', 30, 94, 25, 318, '1988-02-18'),
('Verratti', 21, 86, 24, 82, '1981-05-16'),
('Jorginho', 32, 94, 23, 260, '1994-01-20'),
('Sensi', 20, 82, 26, 95, '1989-11-12'),
('Trippier', 22, 82, 30, 132, '1984-07-20'),
('Allan', 20, 81, 26, 100, '1985-03-26'),
('Robertson', 31, 84, 24, 204, '1999-01-14'),
('Evans', 30, 97, 15, 286, '1996-06-25'),
('M. Niles', 20, 94, 20, 240, '1989-09-03'),
('Mendy', 21, 94, 16, 131, '1992-10-24'),
('Oblak', 32, 90, 19, 367, '1988-12-23'),
('Messi', 31, 93, 16, 71, '1984-07-09'),
('Ospina', 19, 83, 11, 319, '1996-07-19'),
('Navas', 30, 83, 27, 342, '1999-01-26'),
('Higuain', 33, 81, 26, 66, '1997-05-25'),
('Eriksen', 22, 97, 11, 179, '2000-08-27'),
('Wan Bissaka', 34, 85, 28, 228, '1987-01-18'),
('Iheanacho', 33, 96, 11, 188, '1993-10-15'),
('Torreira', 21, 85, 25, 241, '1996-05-07'),
('Coman', 23, 83, 27, 345, '1998-10-08'),
('Akanji', 29, 88, 23, 178, '1988-02-04'),
('Lloris', 29, 96, 20, 296, '1988-05-11'),
('Kepa', 28, 86, 10, 337, '2000-09-27'),
('Alaba', 35, 99, 12, 87, '1984-02-24'),
('Mbappe', 35, 91, 11, 159, '1984-08-06'),
('Muller', 30, 92, 22, 242, '1995-04-16'),
('Henderson', 29, 96, 11, 126, '1994-11-07'),
('Pogba', 25, 97, 13, 97, '1987-07-09'),
('De Ligt', 33, 95, 11, 278, '1988-06-27'),
('Icardi', 26, 92, 26, 266, '1990-10-12'),
('Biraghi', 18, 82, 18, 275, '1982-06-21'),
('Ronaldo', 28, 84, 12, 255, '1988-01-24'),
('Alcantara', 33, 87, 17, 171, '1984-07-11'),
('Fabinho', 24, 95, 26, 50, '1986-09-16'),
('Lewandowski', 33, 87, 12, 241, '1999-04-20'),
('Busquets', 19, 91, 23, 190, '1985-04-02'),
('Marquinhos', 29, 84, 20, 94, '1987-09-03'),
('Matip', 26, 83, 11, 267, '1984-07-12'),
('Ter Stegen', 34, 92, 10, 132, '1983-12-06'),
('Laporte', 28, 96, 24, 365, '1993-09-18'),
('Gnabry', 35, 90, 21, 147, '1987-07-17'),
('Mertens', 18, 85, 25, 69, '1983-10-09'),
('Pjanic', 33, 87, 26, 361, '1993-07-25'),
('Chambers', 21, 94, 29, 227, '2000-03-08'),
('Mane', 20, 94, 27, 140, '1986-03-09'),
('Ramsey', 21, 99, 28, 366, '1983-10-24'),
('De gea', 33, 88, 29, 286, '1999-04-19'),
('Leno', 28, 98, 13, 190, '1995-12-10'),
('Hazard', 32, 86, 12, 343, '1990-09-01'),
('Lucas', 23, 80, 20, 163, '1989-10-13'),
('Gundogan', 20, 88, 29, 109, '1980-02-25'),
('Madison', 31, 98, 18, 379, '1983-02-07'),
('Ricardo', 22, 92, 20, 132, '1999-11-22'),
('Rui Mario', 23, 81, 18, 317, '1993-11-15'),
('Alderweireld', 29, 96, 19, 377, '1980-01-25'),
('Van Dijk', 20, 86, 10, 306, '1995-12-04'),
('Alex Sandro', 35, 99, 24, 398, '1986-07-05'),
('Matuidi', 25, 87, 23, 307, '1980-04-09'),
('Langlet', 28, 95, 13, 332, '1987-02-07'),
('Rashford', 31, 96, 13, 156, '1993-02-07'),
('Dan James', 18, 88, 17, 279, '1999-08-22'),
('Marcelo', 34, 88, 18, 165, '1982-04-16'),
('Felipe', 21, 83, 12, 208, '1994-01-24'),
('Kante', 20, 94, 22, 274, '1999-07-28'),
('Vardy', 29, 89, 30, 174, '1988-07-17'),
('Di Maria', 30, 90, 24, 138, '1989-02-22'),
('Kimmich', 28, 92, 15, 221, '1994-10-18'),
('Rose', 23, 84, 29, 217, '2000-02-04'),
('Barnes', 24, 80, 11, 201, '2000-03-19'),
('Gotze', 30, 86, 22, 295, '1989-08-26'),
('J. Felix', 33, 97, 23, 143, '2000-12-18'),
('Sanchez', 19, 89, 21, 220, '1989-05-11'),
('Mahrez', 28, 98, 25, 289, '1991-01-28'),
('Buffon', 33, 91, 27, 398, '1983-11-20'),
('De Vrij', 25, 85, 27, 358, '1997-11-06'),
('Semedo', 32, 93, 27, 66, '1993-09-16'),
('Varane', 29, 93, 17, 133, '1988-03-26'),
('Alba', 35, 95, 27, 304, '1990-12-18'),
('Benzema', 31, 89, 20, 176, '1994-11-03'),
('Maguire', 33, 80, 11, 118, '1993-09-27'),
('Kane', 31, 98, 22, 158, '1995-03-12'),
('Abraham', 22, 97, 24, 191, '1997-05-14'),
('Ayoze', 27, 80, 19, 201, '1984-12-17'),
('Modric', 26, 90, 17, 145, '1989-03-05'),
('Walker', 32, 98, 30, 274, '1998-02-03'),
('Soyuncu', 27, 94, 15, 124, '1980-12-06'),
('Azpilicueta', 34, 97, 17, 357, '1994-12-11'),
('Manolas', 20, 87, 15, 391, '1984-02-13'),
('Rakitic', 18, 96, 11, 391, '1996-09-10'),
('T. Hazard', 29, 89, 27, 108, '1988-07-09'),
('Boateng', 25, 98, 28, 73, '1992-05-12'),
('Dier', 25, 82, 20, 358, '1997-04-21'),
('Zielinski', 33, 84, 11, 310, '1999-10-17'),
('Lukaku', 19, 89, 17, 76, '1992-08-22'),
('Fabian Ruiz', 32, 93, 25, 195, '1989-08-26'),
('Hakimi', 33, 91, 30, 373, '1984-10-06'),
('Di Lorenzo', 18, 83, 29, 240, '1991-09-20'),
('Silva', 23, 89, 23, 247, '1994-09-17'),
('Zouma', 18, 85, 13, 172, '1987-08-14'),
('Koulibaly', 29, 99, 26, 246, '1982-07-01'),
('Courtois', 26, 84, 30, 201, '1997-04-24'),
('Thomas', 29, 95, 20, 95, '1985-05-14'),
('Pulisic', 30, 85, 30, 328, '1990-08-27'),
('Pique', 20, 88, 12, 80, '1994-07-25'),
('Schmeichel', 28, 89, 26, 212, '1998-07-08'),
('Rudiger', 32, 89, 21, 356, '1980-08-01'),
('Aurier', 19, 99, 24, 274, '1984-01-25'),
('Son', 29, 80, 18, 158, '1997-10-05'),
('Alli', 27, 83, 30, 202, '1994-08-27'),
('Witsel', 23, 87, 18, 98, '1999-10-23'),
('Lacazette', 22, 90, 21, 218, '1989-05-11'),
('Alison', 30, 90, 13, 318, '1999-07-25'),
('Ederson', 24, 84, 13, 184, '1997-03-08'),
('Vertonghen', 30, 89, 12, 289, '1994-12-24'),
('Costa', 30, 94, 16, 273, '1985-01-19'),
('Brozovic', 35, 98, 10, 93, '2000-09-12'),
('Kovacic', 33, 90, 15, 369, '2000-12-12'),
('Aubameyang', 35, 97, 19, 357, '1994-12-25'),
('Hummels', 30, 85, 22, 61, '1983-03-13'),
('Correa', 24, 85, 28, 263, '1991-01-27'),
('Neuer', 34, 99, 11, 200, '1995-02-05'),
('Meunier', 30, 90, 22, 349, '1989-04-26'),
('Arnold', 31, 89, 19, 88, '1984-11-14'),
('Wijnaldum', 24, 94, 21, 375, '1991-03-24'),
('Pepe', 34, 85, 18, 258, '1987-11-28'),
('Lautaro', 33, 82, 18, 280, '1985-11-20'),
('Willian', 21, 89, 15, 309, '1989-12-17'),
('De Jong', 30, 83, 14, 158, '1992-11-10'),
('Aguero', 20, 92, 25, 242, '1988-03-15'),
('Griezmann', 30, 88, 17, 167, '1986-04-03'),
('Bale', 34, 90, 21, 291, '1980-03-16'),
('Martial', 20, 97, 15, 350, '1985-06-10'),
('Sancho', 29, 85, 29, 277, '1993-12-12'),
('Sokratis', 18, 86, 16, 355, '1996-03-06'),
('Guendouzi', 24, 90, 18, 394, '1987-07-22'),
('Milik', 33, 80, 27, 196, '1980-01-19'),
('Bernardo', 24, 86, 23, 150, '1983-03-09'),
('Schulz', 25, 99, 12, 195, '1990-05-07'),
('De Bruyne', 18, 85, 24, 372, '1992-05-11'),
('Borja Valero', 18, 86, 25, 139, '1993-09-16'),
('Brandt', 33, 87, 14, 127, '1989-05-06'),
('Handanovic', 23, 81, 28, 80, '2000-09-24'),
('Salah', 32, 90, 27, 82, '1991-05-16'),
('Gimenez', 29, 80, 24, 170, '2000-11-05'),
('Kolasinac', 21, 87, 11, 244, '1991-08-27'),
('Shaw', 27, 98, 20, 63, '1999-06-25'),
('Bernat', 20, 93, 10, 158, '2000-12-12'),
('Stones', 30, 93, 30, 172, '1993-10-19'),
('Reus', 35, 88, 24, 219, '1986-11-22'),
('Ramos', 29, 86, 11, 236, '1997-05-02'),
('Draxler', 35, 98, 19, 158, '1981-12-18')
;

INSERT INTO teams(name, ucl_trophies)
VALUES
('Manchester United', 8),
('Leicester', 0),
('Juventus', 7),
('Real Madrid', 4),
('Napoli', 6),
('Dortmund', 8),
('Chelsea', 0),
('Barcelona', 8),
('Bayern Munchen', 1),
('Arsenal', 10),
('PSG', 3),
('Tottenham', 10),
('Atletico Madrid', 7),
('Inter Milan', 7),
('Liverpool', 5),
('Manchester City', 5)
;
-------------------------------------
SELECT *
FROM teams;