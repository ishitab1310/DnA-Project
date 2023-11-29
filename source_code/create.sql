-- create_database.sql
CREATE DATABASE IF NOT EXISTS `flight_management_system`;
USE `flight_management_system`;

CREATE TABLE Airplane (
    airplane_number INT PRIMARY KEY,
    airplane_model VARCHAR(255),
    fuel_capacity INT,
    passenger_capacity INT
);

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

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    roles VARCHAR(255),
    languages_spoken VARCHAR(255),
    designation VARCHAR(255),
    age INT,
    date_of_birth DATE
);

CREATE TABLE Location (
    airport_id VARCHAR(255) PRIMARY KEY,
    timezone VARCHAR(255),
    coordinates VARCHAR(255),
    arrival_departure_time VARCHAR(255),
    flight_duration VARCHAR(255)
);

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

CREATE TABLE Reservation (
    id INT PRIMARY KEY,
    flight_id INT,
    date DATE,
    meal BOOLEAN,
    passenger_id INT,
    FOREIGN KEY (flight_id) REFERENCES Flight(id)
);

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    phone_number VARCHAR(255),
    age INT,
    date_of_birth DATE,
    name VARCHAR(255)
);

CREATE TABLE Baggage (
    tag_index VARCHAR(255) PRIMARY KEY,
    weight_in_kg DECIMAL(10, 2),
    passenger_id INT,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

CREATE TABLE Feedback (
    id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    positive_negative BOOLEAN,
    number_of_words INT,
    FOREIGN KEY (flight_id) REFERENCES Flight(id),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

CREATE TABLE Log (
    id INT PRIMARY KEY,
    airplane_number INT,
    parametric_reading VARCHAR(255),
    FOREIGN KEY (airplane_number) REFERENCES Airplane(airplane_number)
);
