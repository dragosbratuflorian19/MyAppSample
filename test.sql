USE Football;
-------------------------------------
CREATE TABLE players (
player_id INT(10) AUTO_INCREMENT,
name VARCHAR(20) UNIQUE NOT NULL,
birthdate DATE NOT NULL,
age TINYINT(2) NOT NULL,
wage DECIMAL(20, 1) DEFAULT 120000.5,
PRIMARY KEY (player_id)
);
-------------------------------------
DROP TABLE players;
INSERT INTO players(name,birthdate, age, wage)
VALUES
('Cristiano Ronaldo', '1985-02-25',34,20000000.2),
('Marcus Rashford', '1995-12-21',24,11000000.4),
('Paul Pogba', '1990-03-26',27,19000000.1),
('Paulo Dybla', '1994-11-11',25,14000000.0),
('Eden Hazard', '1990-01-15',28,15000000.2),
('Karim Benzema', '1987-10-01',29,12000000.9),
('Anthony Martial', '1996-06-12',24,12000000.5),
('Sergio Ramos', '1995-12-21',24,11000000.4),
('Gareth Bale', '1985-02-25',34,20000000.2),
('MAthias DeLigt', '1995-12-21',24,11000000.4),
('Gianluigi Buffon', '1985-02-25',34,20000000.2),
('Scott McTominay', '1995-12-21',24,11000000.4),
('Luka Modric', '1985-02-25',34,20000000.2),
('Aaron Bissaka', '1995-12-21',24,11000000.4),
('Gonzalo Higuain', '1985-02-25',34,20000000.2),
('David DeGea', '1995-12-21',24,11000000.4)
;
-------------------------------------
ALTER TABLE players ADD captained_by INT(10) DEFAULT NULL;
ALTER TABLE players
ADD FOREIGN KEY(captained_by)
REFERENCES players(player_id)
ON DELETE SET NULL;
ALTER TABLE players ADD CONSTRAINT fk_captained_by FOREIGN KEY (captained_by) REFERENCES players(player_id);
UPDATE players
SET captained_by=NULL;
UPDATE players
-------------------------------------
DROP TABLE teams;
CREATE TABLE teams (
team_id INT(10) AUTO_INCREMENT PRIMARY KEY,
team_name VARCHAR(20) UNIQUE NOT NULL,
captain_id INT(10) DEFAULT 0,
cpt_start DATE DEFAULT NULL
);
INSERT INTO teams(team_name, captain_id,cpt_start)
VALUES
('Manchester United', 3, '2016-06-01'),
('Real Madrid', 8, '2005-06-01'),
('Juventus', 1, '2018-06-01')
;
ALTER TABLE players ADD team_id INT(10) DEFAULT NULL;
ALTER TABLE players
ADD FOREIGN KEY(team_id)
REFERENCES teams(team_id)
ON DELETE SET NULL;
UPDATE players
SET captained_by=1
WHERE name IN ('Paulo Dybla', 'MAthias DeLigt', 'Gianluigi Buffon', 'Gonzalo Higuain');
UPDATE players
SET captained_by=3
WHERE name IN ('Marcus Rashford', 'Anthony Martial', 'Scott McTominay', 'Aaron Bissaka', 'David DeGea');
UPDATE players
SET captained_by=8
WHERE name IN ('Eden Hazard', 'Karim Benzema', 'Gareth Bale', 'Luka Modric');
UPDATE players
SET team_id=1
WHERE captained_by=3;
UPDATE players
SET team_id=2
WHERE captained_by=8;
UPDATE players
SET team_id=3
WHERE captained_by=1;
SELECT * FROM teams;
SELECT * FROM players;

SELECT p.player_id, p.name, t.team_name, t.team_id
FROM players p
LEFT JOIN teams t ON (p.team_id = t.team_id);
