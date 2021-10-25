-- SCHEMA

CREATE TABLE Hospitals (
  hospital_id TEXT NOT NULL PRIMARY KEY,
  name TEXT
);
  
 CREATE TABLE Departments (
  department_id INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  hospital_id TEXT NOT NULL,
  number_of_nurses INTEGER NOT NULL,
  FOREIGN KEY(hospital_id) REFERENCES Hospitals(hospital_id)
 );
 
 CREATE TABLE Nurses (
  nurse_id INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  department_id INTEGER NOT NULL,
  years_of_experience INTEGER,
  number_of_patients INTEGER NOT NULL,
  FOREIGN KEY(department_id) REFERENCES Departments(department_id)
);

 CREATE TABLE Patients (
  patient_id INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  nurse_id INTEGER NOT NULL,
  FOREIGN KEY(nurse_id) REFERENCES Nurses(nurse_id)
);

--QUERY 

INSERT INTO Hospitals (hospital_id, name) VALUES
("KCH", "King's College Hospital"),
("STH", "St Thomas' Hospital");

INSERT INTO Departments(department_id, name, hospital_id, number_of_nurses) VALUES
(1, "Paediatrics", "KCH", 4),
(2, "ER", "KCH", 2),
(3, "Orthopaedics", "STH", 3),
(4, "Gynecology", "STH", 3),
(5, "Neurology", "STH", 2);

INSERT INTO Nurses(nurse_id, name, department_id, years_of_experience, number_of_patients) VALUES
(1, "Sarah", 1, 4, 3),
(2, "Heather", 4, 5, 3),
(3, "Dan", 3, 2, 4),
(4, "Myles", 5, 4, 2),
(5, "Jessie", 2, 1, 5);

INSERT INTO Patients(patient_id, name, nurse_id) VALUES
(1, "John", 5),
(2, "Bethany", 4),
(3, "Julien", 3),
(4, "Angelina", 2),
(5, "Bob", 1);

UPDATE Patients SET
name = "Phillipa"
WHERE patient_id = 5;

SELECT name from Nurses
WHERE nurse_id = 2;

DELETE FROM Patients
WHERE patient_id = 1;

SELECT * FROM Hospitals;
SELECT * FROM Departments;
SELECT * FROM Nurses;
SELECT * FROM Patients;
