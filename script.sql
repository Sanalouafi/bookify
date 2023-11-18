-- la creation du base de donnees

CREATE DATABASE bookify;

-- la création des tables avec les clés étrangères

CREATE TABLE Employees (
   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    email VARCHAR(50),
    departement VARCHAR(50),
    post VARCHAR(50)
    
);
CREATE TABLE Salles (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR (50),
    capacite int (100)
);

CREATE TABLE Reservation (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dateDebut date,
    dateFin date,
    employeeId int,
    salleId int,
    FOREIGN KEY (employeeId) REFERENCES Employees(id),
    FOREIGN KEY (salleId) REFERENCES Salles(id)

    
);
CREATE TABLE Equipements(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50),
    salleId int,
  FOREIGN KEY (salleId) REFERENCES Salles(id)
);

--la creation des index

CREATE INDEX idx_employee_Id ON employees(id);

CREATE INDEX idx_salle_Id ON sales(id);

CREATE INDEX idx_reservation_Id ON reservation(id);

CREATE INDEX idx_employee_Id_reservation ON reservation(employeeId);

CREATE INDEX idx_salle_Id_reservation ON reservation(saleId);

CREATE INDEX idx_equipement_Id ON equipements(id);

CREATE INDEX idx_salle_Id_equipements ON equipements(saleId);




--l'insertion de donnes sur les tables

--table employee
INSERT INTO employees (nom, email, departement, post)
 VALUES
 ('aicha', 'aicha@gmail.com', '1', '24'),
 ('aicha', 'aicha@gmail.com', '2', '25'),
 ('aicha', 'aicha@gmail.com', '3', '6'),
 ('aicha', 'aicha@gmail.com', '4', '24');

 --table salles
 INSERT INTO salles (nom, capacite)
 VALUES
 ('salle 1', 24),
 ('salle 2',  36),
 ('salle 3', 27),
 ('salle 4',58);

 --table reservations
INSERT INTO reservation (dateDebut,dateFin,employeeId,salleId)
 VALUES
 ('2024-12-12','2024-12-13',1,1),
 ('2024-12-15','2024-12-17',2,1),
 ('2024-12-13','2024-12-18',1,3);
 
 --table equipements

 INSERT INTO equipements (nom,salleId)
 VALUES
 ('chaise',1),
 ('table',1),
 ('ordinateur',3);

--select with condition

 SELECT nom FROM employees WHERE nom LIKE"a%";

 --Joins
 SELECT e.nom, r.dateDebut, r.dateFin, s.nom
FROM employees AS e
JOIN reservation AS r ON e.id = r.employeeId
JOIN salles AS s ON r.salleId = s.id
WHERE e.nom = "aicha" AND s.nom = "salle 3";
