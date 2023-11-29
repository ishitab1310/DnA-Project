-- create_database.sql
DROP DATABASE IF EXISTS `flight_management_system`;
CREATE DATABASE IF NOT EXISTS `flight_management_system`;
USE `flight_management_system`;

CREATE TABLE Airplane (
    airplane_number INT PRIMARY KEY,
    airplane_model VARCHAR(255),
    fuel_capacity INT,
    passenger_capacity INT
);

INSERT INTO Airplane (airplane_number, airplane_model, fuel_capacity, passenger_capacity)
VALUES
  (100, 'Boeing', 44077, 275),
  (134, 'Airbus', 71307, 69),
  (271, 'Embraer', 78523, 290),
  (297, 'McDonnell Douglas ', 79092, 176),
  (312, 'Dassault', 55078, 260);
CREATE TABLE Maintenance_History (
    id INT PRIMARY KEY,
    airplane_number INT,
    type VARCHAR(255),
    cost DECIMAL(10, 2),
    date DATE,
    employee_involved INT,
    employee_id INT,
    FOREIGN KEY (airplane_number) REFERENCES Airplane(airplane_number),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO Maintenance_History (id, airplane_number, type, cost, date, employee_involved, employee_id)
VALUES
  (1, 100, 'routine', 5000.00, '2023-01-01', 1, 1),
  (2, 134, 'major', 15000.00, '2023-02-15', 2, 2),
  (3, 271, 'minor', 3000.00, '2023-03-20', 3, 3),
  (4, 297, 'routine', 6000.00, '2023-04-10', 4, 4),
  (5, 312, 'major', 20000.00, '2023-05-25', 5, 5);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    roles VARCHAR(255),
    languages_spoken VARCHAR(255),
    designation VARCHAR(255),
    age INT,
    date_of_birth DATE
);
INSERT INTO Employee (employee_id, roles, languages_spoken, designation, age, date_of_birth)
VALUES
  (1, 'Pilot', 'English', 'Captain', 35, '1988-05-15'),
  (2, 'Mechanic', 'Spanish', 'Senior Engineer', 42, '1981-10-22'),
  (3, 'Crew', 'French', 'Attendant', 28, '1994-02-08'),
  (4, 'Pilot', 'German', 'First Officer', 40, '1983-08-18'),
  (5, 'Mechanic', 'Italian', 'Engineer', 37, '1986-11-30');
  

CREATE TABLE Location (
    airport_id VARCHAR(255) PRIMARY KEY,
    timezone VARCHAR(255),
    coordinates VARCHAR(255),
    arrival_departure_time VARCHAR(255),
    flight_duration VARCHAR(255)
);
INSERT INTO Location (airport_id, timezone, coordinates, arrival_departure_time, flight_duration)
VALUES
('airport1', 'UTC-5', '40.7128° N, 74.0060° W', '08:00 AM - 08:00 PM', '5 hours'),
('airport2', 'UTC-4', '34.0522° N, 118.2437° W', '09:00 AM - 09:00 PM', '4.5 hours'),
('airport3', 'UTC-6', '41.8781° N, 87.6298° W', '10:00 AM - 10:00 PM', '3.5 hours'),
('airport4', 'UTC+0', '51.5074° N, 0.1278° W', '11:00 AM - 11:00 PM', '6 hours'),
('airport5', 'UTC+1', '48.8566° N, 2.3522° E', '12:00 PM - 12:00 AM', '7 hours');


CREATE TABLE Flight (
    id INT PRIMARY KEY,
    airplane_number INT,
    from_location VARCHAR(255),
    to_location VARCHAR(255),
    arrival_departure_time TIMESTAMP,
    flight_duration DECIMAL(10, 2),
    number_of_layovers INT,
    FOREIGN KEY (airplane_number) REFERENCES Airplane(airplane_number),
    FOREIGN KEY (from_location) REFERENCES Location(airport_id),
    FOREIGN KEY (to_location) REFERENCES Location(airport_id)
);
INSERT INTO Location (airport_id, timezone, coordinates, arrival_departure_time, flight_duration)
VALUES
('airport1', 'UTC-5', '40.7128° N, 74.0060° W', '08:00 AM - 08:00 PM', '5 hours'),
('airport2', 'UTC-4', '34.0522° N, 118.2437° W', '09:00 AM - 09:00 PM', '4.5 hours'),
('airport3', 'UTC-6', '41.8781° N, 87.6298° W', '10:00 AM - 10:00 PM', '3.5 hours'),
('airport4', 'UTC+0', '51.5074° N, 0.1278° W', '11:00 AM - 11:00 PM', '6 hours'),
('airport5', 'UTC+1', '48.8566° N, 2.3522° E', '12:00 PM - 12:00 AM', '7 hours');

CREATE TABLE Reservation (
    id INT PRIMARY KEY,
    flight_id INT,
    date DATE,
    meal BOOLEAN,
    passenger_id INT,
    FOREIGN KEY (flight_id) REFERENCES Flight(id)
);
INSERT INTO Reservation (id, flight_id, date, meal, passenger_id)
VALUES
(1, 1, '2023-05-20', 1, 201),
(2, 2, '2023-05-21', 0, 202),
(3, 3, '2023-05-22', 1, 203),
(4, 4, '2023-05-23', 0, 204),
(5, 5, '2023-05-24', 1, 205);

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    phone_number VARCHAR(255),
    age INT,
    date_of_birth DATE,
    name VARCHAR(255)
);

INSERT INTO Passenger (passenger_id, phone_number, age, date_of_birth, name)
VALUES
(201, '123-456-7890', 28, '1995-03-15', 'Passenger1'),
(202, '987-654-3210', 35, '1988-08-20', 'Passenger2'),
(203, '111-222-3333', 42, '1981-11-25', 'Passenger3'),
(204, '555-666-7777', 50, '1973-04-30', 'Passenger4'),
(205, '999-888-7777', 22, '2001-07-05', 'Passenger5');

CREATE TABLE Baggage (
    tag_index VARCHAR(255) PRIMARY KEY,
    weight_in_kg DECIMAL(10, 2),
    passenger_id INT,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);
INSERT INTO Baggage (tag_index, weight_in_kg, passenger_id)
VALUES
('tag1', 10.5, 201),
('tag2', 13.2, 202),
('tag3', 18.0, 203),
('tag4', 12.3, 204),
('tag5', 15.8, 205);
CREATE TABLE Feedback (
    id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    positive_negative BOOLEAN,
    number_of_words INT,
    FOREIGN KEY (flight_id) REFERENCES Flight(id),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

INSERT INTO Feedback (id, flight_id, passenger_id, positive_negative, number_of_words)
VALUES
(1, 1, 201, 1, 10),
(2, 2, 202, 0, 8),
(3, 3, 203, 1, 12),
(4, 4, 204, 0, 9),
(5, 5, 205, 1, 11);

CREATE TABLE Log (
    id INT PRIMARY KEY,
    airplane_number INT,
    parametric_reading VARCHAR(255),
    FOREIGN KEY (airplane_number) REFERENCES Airplane(airplane_number)
);



INSERT INTO Log (id, airplane_number, parametric_reading)
VALUES
(1, 100, 'reading1'),
(2, 134, 'reading2'),
(3, 271, 'reading3'),
(4, 297, 'reading4'),
(5, 312, 'reading5');

