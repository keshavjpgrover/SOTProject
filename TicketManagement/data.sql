USE ticketingsystem;

-- Drop tables if they exist
DROP TABLE IF EXISTS Payment, Ticket, Booking, Routes, TrainSchedule, Station, Trains, User;

-- Create User table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    password VARCHAR(100),
    role ENUM('admin', 'customer')
);

-- Create Station table
CREATE TABLE Station (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(50),
    city VARCHAR(50)
);

-- Create Trains table
CREATE TABLE Trains (
    train_number VARCHAR(10) PRIMARY KEY,
    train_name VARCHAR(50),
    number_of_seats INT,
    type ENUM('local', 'express')
);

-- Create TrainSchedule table
CREATE TABLE TrainSchedule (
    TrainNumber INT,
    FromStation VARCHAR(50),
    ToStation VARCHAR(50),
    TimeReachingFrom TIME,
    TimeReachingTo TIME
);

-- Create Routes table
CREATE TABLE Routes (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    train_number VARCHAR(10),
    station_id INT,
    stop_order INT,
    distance_from_start DECIMAL(5, 2),
    FOREIGN KEY (train_number) REFERENCES Trains(train_number),
    FOREIGN KEY (station_id) REFERENCES Station(station_id)
);

-- Create Booking table
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    train_number VARCHAR(10),
    schedule_id INT,
    date DATE,
    status ENUM('Booked', 'cancelled', 'confirmed'),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (train_number) REFERENCES Trains(train_number)
);

-- Create Ticket table
CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    seat_number INT,
    price DECIMAL(10, 2),
    start_station_id INT,
    end_station_id INT,
    date DATE,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (start_station_id) REFERENCES Station(station_id),
    FOREIGN KEY (end_station_id) REFERENCES Station(station_id)
);

-- Create Payment table
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    date DATE,
    amount DECIMAL(10, 2),
    payment_method ENUM('Cash', 'Card'),
    payment_status ENUM('failed', 'success', 'pending'),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Insert sample data into User table
INSERT INTO User (first_name, last_name, phone_number, email, password, role) VALUES
('John', 'Doe', '1234567890', 'john.doe@example.com', 'password1', 'customer'),
('Jane', 'Smith', '2345678901', 'jane.smith@example.com', 'password2', 'customer'),
('Alice', 'Johnson', '3456789012', 'alice.johnson@example.com', 'password3', 'admin'),
('Bob', 'Brown', '4567890123', 'bob.brown@example.com', 'password4', 'customer'),
('Charlie', 'Davis', '5678901234', 'charlie.davis@example.com', 'password5', 'customer');

-- Insert sample data into Station table
INSERT INTO Station (station_name, city) VALUES
('Kashmere Gate', 'Delhi'),
('Lal Quila', 'Delhi'),
('Jama Masjid', 'Delhi'),
('Delhi Gate', 'Delhi'),
('ITO', 'Delhi'),
('Mandi House', 'Delhi'),
('Janpath', 'Delhi'),
('Central Secretariat', 'Delhi'),
('Khan Market', 'Delhi'),
('Jawaharlal Nehru Stadium', 'Delhi'),
('Jangpura', 'Delhi'),
('Lajpat Nagar', 'Delhi'),
('Moolchand', 'Delhi'),
('Kailash Colony', 'Delhi'),
('Nehru Place', 'Delhi'),
('Kalkaji Mandir', 'Delhi'),
('Govind Puri', 'Delhi'),
('Okhla', 'Delhi'),
('Jasola', 'Delhi'),
('Sarita Vihar', 'Delhi'),
('Mohan Estate', 'Delhi'),
('Tughlakabad', 'Delhi'),
('Badarpur Border', 'Delhi'),
('Sarai', 'Faridabad'),
('NHPC Chowk', 'Faridabad'),
('Mewala Maharajpur', 'Faridabad'),
('Sector 28 Faridabad', 'Faridabad'),
('Badkal Mor', 'Faridabad'),
('Old Faridabad', 'Faridabad'),
('Neelam Chowk Ajronda', 'Faridabad'),
('Bata Chowk', 'Faridabad'),
('Escorts Mujesar', 'Faridabad');

-- Insert sample data into Trains table
INSERT INTO Trains (train_number, train_name, number_of_seats, type) VALUES
('T001', 'Express 1', 120, 'express'),
('T002', 'Express 2', 150, 'express'),
('T003', 'Local 1', 200, 'local'),
('T004', 'Local 2', 180, 'local'),
('T005', 'Express 3', 160, 'express');

-- Insert updated data into TrainSchedule table
INSERT INTO TrainSchedule (TrainNumber, FromStation, ToStation, TimeReachingFrom, TimeReachingTo) VALUES
(1001, 'Kashmere Gate', 'Lal Qila', '06:00:00', '06:03:00'),
(1001, 'Lal Qila', 'Jama Masjid', '06:03:00', '06:06:00'),
(1001, 'Jama Masjid', 'Delhi Gate', '06:06:00', '06:09:00'),
(1001, 'Delhi Gate', 'ITO', '06:09:00', '06:12:00'),
(1001, 'ITO', 'Mandi House', '06:12:00', '06:15:00'),
(1001, 'Mandi House', 'Janpath', '06:15:00', '06:18:00'),
(1001, 'Janpath', 'Central Secretariat', '06:18:00', '06:21:00'),
(1001, 'Central Secretariat', 'Khan Market', '06:21:00', '06:24:00'),
(1001, 'Khan Market', 'Jawaharlal Nehru Stadium', '06:24:00', '06:27:00'),
(1001, 'Jawaharlal Nehru Stadium', 'Jangpura', '06:27:00', '06:30:00'),
(1001, 'Jangpura', 'Lajpat Nagar', '06:30:00', '06:33:00'),
(1001, 'Lajpat Nagar', 'Moolchand', '06:33:00', '06:36:00'),
(1001, 'Moolchand', 'Kailash Colony', '06:36:00', '06:39:00'),
(1001, 'Kailash Colony', 'Nehru Place', '06:39:00', '06:42:00'),
(1001, 'Nehru Place', 'Kalkaji Mandir', '06:42:00', '06:45:00'),
(1001, 'Kalkaji Mandir', 'Govind Puri', '06:45:00', '06:48:00'),
(1001, 'Govind Puri', 'Okhla', '06:48:00', '06:51:00'),
(1001, 'Okhla', 'Jasola-Apollo', '06:51:00', '06:54:00'),
(1001, 'Jasola-Apollo', 'Sarita Vihar', '06:54:00', '06:57:00'),
(1001, 'Sarita Vihar', 'Mohan Estate', '06:57:00', '07:00:00'),
(1001, 'Mohan Estate', 'Tughlakabad', '07:00:00', '07:03:00'),
(1001, 'Tughlakabad', 'Badarpur Border', '07:03:00', '07:06:00'),
(1001, 'Badarpur Border', 'Sarai', '07:06:00', '07:09:00'),
(1001, 'Sarai', 'NHPC Chowk', '07:09:00', '07:12:00'),
(1001, 'NHPC Chowk', 'Mewala Maharajpur', '07:12:00', '07:15:00'),
(1001, 'Mewala Maharajpur', 'Sector 28', '07:15:00', '07:18:00'),
(1001, 'Sector 28', 'Badkal Mor', '07:18:00', '07:21:00'),
(1001, 'Badkal Mor', 'Old Faridabad', '07:21:00', '07:24:00'),
(1001, 'Old Faridabad', 'Neelam Chowk Ajronda', '07:24:00', '07:27:00'),
(1001, 'Neelam Chowk Ajronda', 'Bata Chowk', '07:27:00', '07:30:00'),
(1001, 'Bata Chowk', 'Escorts Mujesar', '07:30:00', '07:33:00'),

(1002, 'Kashmere Gate', 'Lal Qila', '08:00:00', '08:03:00'),
(1002, 'Lal Qila', 'Jama Masjid', '08:03:00', '08:06:00'),
(1002, 'Jama Masjid', 'Delhi Gate', '08:06:00', '08:09:00'),
(1002, 'Delhi Gate', 'ITO', '08:09:00', '08:12:00'),
(1002, 'ITO', 'Mandi House', '08:12:00', '08:15:00'),
(1002, 'Mandi House', 'Janpath', '08:15:00', '08:18:00'),
(1002, 'Janpath', 'Central Secretariat', '08:18:00', '08:21:00'),
(1002, 'Central Secretariat', 'Khan Market', '08:21:00', '08:24:00'),
(1002, 'Khan Market', 'Jawaharlal Nehru Stadium', '08:24:00', '08:27:00'),
(1002, 'Jawaharlal Nehru Stadium', 'Jangpura', '08:27:00', '08:30:00'),
(1002, 'Jangpura', 'Lajpat Nagar', '08:30:00', '08:33:00'),
(1002, 'Lajpat Nagar', 'Moolchand', '08:33:00', '08:36:00'),
(1002, 'Moolchand', 'Kailash Colony', '08:36:00', '08:39:00'),
(1002, 'Kailash Colony', 'Nehru Place', '08:39:00', '08:42:00'),
(1002, 'Nehru Place', 'Kalkaji Mandir', '08:42:00', '08:45:00'),
(1002, 'Kalkaji Mandir', 'Govind Puri', '08:45:00', '08:48:00'),
(1002, 'Govind Puri', 'Okhla', '08:48:00', '08:51:00'),
(1002, 'Okhla', 'Jasola-Apollo', '08:51:00', '08:54:00'),
(1002, 'Jasola-Apollo', 'Sarita Vihar', '08:54:00', '08:57:00'),
(1002, 'Sarita Vihar', 'Mohan Estate', '08:57:00', '09:00:00'),
(1002, 'Mohan Estate', 'Tughlakabad', '09:00:00', '09:03:00'),
(1002, 'Tughlakabad', 'Badarpur Border', '09:03:00', '09:06:00'),
(1002, 'Badarpur Border', 'Sarai', '09:06:00', '09:09:00'),
(1002, 'Sarai', 'NHPC Chowk', '09:09:00', '09:12:00'),
(1002, 'NHPC Chowk', 'Mewala Maharajpur', '09:12:00', '09:15:00'),
(1002, 'Mewala Maharajpur', 'Sector 28', '09:15:00', '09:18:00'),
(1002, 'Sector 28', 'Badkal Mor', '09:18:00', '09:21:00'),
(1002, 'Badkal Mor', 'Old Faridabad', '09:21:00', '09:24:00'),
(1002, 'Old Faridabad', 'Neelam Chowk Ajronda', '09:24:00', '09:27:00'),
(1002, 'Neelam Chowk Ajronda', 'Bata Chowk', '09:27:00', '09:30:00'),
(1002, 'Bata Chowk', 'Escorts Mujesar', '09:30:00', '09:33:00'),

(1003, 'Kashmere Gate', 'Lal Qila', '10:00:00', '10:03:00'),
(1003, 'Lal Qila', 'Jama Masjid', '10:03:00', '10:06:00'),
(1003, 'Jama Masjid', 'Delhi Gate', '10:06:00', '10:09:00'),
(1003, 'Delhi Gate', 'ITO', '10:09:00', '10:12:00'),
(1003, 'ITO', 'Mandi House', '10:12:00', '10:15:00'),
(1003, 'Mandi House', 'Janpath', '10:15:00', '10:18:00'),
(1003, 'Janpath', 'Central Secretariat', '10:18:00', '10:21:00'),
(1003, 'Central Secretariat', 'Khan Market', '10:21:00', '10:24:00'),
(1003, 'Khan Market', 'Jawaharlal Nehru Stadium', '10:24:00', '10:27:00'),
(1003, 'Jawaharlal Nehru Stadium', 'Jangpura', '10:27:00', '10:30:00'),
(1003, 'Jangpura', 'Lajpat Nagar', '10:30:00', '10:33:00'),
(1003, 'Lajpat Nagar', 'Moolchand', '10:33:00', '10:36:00'),
(1003, 'Moolchand', 'Kailash Colony', '10:36:00', '10:39:00'),
(1003, 'Kailash Colony', 'Nehru Place', '10:39:00', '10:42:00'),
(1003, 'Nehru Place', 'Kalkaji Mandir', '10:42:00', '10:45:00'),
(1003, 'Kalkaji Mandir', 'Govind Puri', '10:45:00', '10:48:00'),
(1003, 'Govind Puri', 'Okhla', '10:48:00', '10:51:00'),
(1003, 'Okhla', 'Jasola-Apollo', '10:51:00', '10:54:00'),
(1003, 'Jasola-Apollo', 'Sarita Vihar', '10:54:00', '10:57:00'),
(1003, 'Sarita Vihar', 'Mohan Estate', '10:57:00', '11:00:00'),
(1003, 'Mohan Estate', 'Tughlakabad', '11:00:00', '11:03:00'),
(1003, 'Tughlakabad', 'Badarpur Border', '11:03:00', '11:06:00'),
(1003, 'Badarpur Border', 'Sarai', '11:06:00', '11:09:00'),
(1003, 'Sarai', 'NHPC Chowk', '11:09:00', '11:12:00'),
(1003, 'NHPC Chowk', 'Mewala Maharajpur', '11:12:00', '11:15:00'),
(1003, 'Mewala Maharajpur', 'Sector 28', '11:15:00', '11:18:00'),
(1003, 'Sector 28', 'Badkal Mor', '11:18:00', '11:21:00'),
(1003, 'Badkal Mor', 'Old Faridabad', '11:21:00', '11:24:00'),
(1003, 'Old Faridabad', 'Neelam Chowk Ajronda', '11:24:00', '11:27:00'),
(1003, 'Neelam Chowk Ajronda', 'Bata Chowk', '11:27:00', '11:30:00'),
(1003, 'Bata Chowk', 'Escorts Mujesar', '11:30:00', '11:33:00'),

(1004, 'Kashmere Gate', 'Lal Qila', '12:00:00', '12:03:00'),
(1004, 'Lal Qila', 'Jama Masjid', '12:03:00', '12:06:00'),
(1004, 'Jama Masjid', 'Delhi Gate', '12:06:00', '12:09:00'),
(1004, 'Delhi Gate', 'ITO', '12:09:00', '12:12:00'),
(1004, 'ITO', 'Mandi House', '12:12:00', '12:15:00'),
(1004, 'Mandi House', 'Janpath', '12:15:00', '12:18:00'),
(1004, 'Janpath', 'Central Secretariat', '12:18:00', '12:21:00'),
(1004, 'Central Secretariat', 'Khan Market', '12:21:00', '12:24:00'),
(1004, 'Khan Market', 'Jawaharlal Nehru Stadium', '12:24:00', '12:27:00'),
(1004, 'Jawaharlal Nehru Stadium', 'Jangpura', '12:27:00', '12:30:00'),
(1004, 'Jangpura', 'Lajpat Nagar', '12:30:00', '12:33:00'),
(1004, 'Lajpat Nagar', 'Moolchand', '12:33:00', '12:36:00'),
(1004, 'Moolchand', 'Kailash Colony', '12:36:00', '12:39:00'),
(1004, 'Kailash Colony', 'Nehru Place', '12:39:00', '12:42:00'),
(1004, 'Nehru Place', 'Kalkaji Mandir', '12:42:00', '12:45:00'),
(1004, 'Kalkaji Mandir', 'Govind Puri', '12:45:00', '12:48:00'),
(1004, 'Govind Puri', 'Okhla', '12:48:00', '12:51:00'),
(1004, 'Okhla', 'Jasola-Apollo', '12:51:00', '12:54:00'),
(1004, 'Jasola-Apollo', 'Sarita Vihar', '12:54:00', '12:57:00'),
(1004, 'Sarita Vihar', 'Mohan Estate', '12:57:00', '13:00:00'),
(1004, 'Mohan Estate', 'Tughlakabad', '13:00:00', '13:03:00'),
(1004, 'Tughlakabad', 'Badarpur Border', '13:03:00', '13:06:00'),
(1004, 'Badarpur Border', 'Sarai', '13:06:00', '13:09:00'),
(1004, 'Sarai', 'NHPC Chowk', '13:09:00', '13:12:00'),
(1004, 'NHPC Chowk', 'Mewala Maharajpur', '13:12:00', '13:15:00'),
(1004, 'Mewala Maharajpur', 'Sector 28', '13:15:00', '13:18:00'),
(1004, 'Sector 28', 'Badkal Mor', '13:18:00', '13:21:00'),
(1004, 'Badkal Mor', 'Old Faridabad', '13:21:00', '13:24:00'),
(1004, 'Old Faridabad', 'Neelam Chowk Ajronda', '13:24:00', '13:27:00'),
(1004, 'Neelam Chowk Ajronda', 'Bata Chowk', '13:27:00', '13:30:00'),
(1004, 'Bata Chowk', 'Escorts Mujesar', '13:30:00', '13:33:00'),

(1005, 'Kashmere Gate', 'Lal Qila', '14:00:00', '14:03:00'),
(1005, 'Lal Qila', 'Jama Masjid', '14:03:00', '14:06:00'),
(1005, 'Jama Masjid', 'Delhi Gate', '14:06:00', '14:09:00'),
(1005, 'Delhi Gate', 'ITO', '14:09:00', '14:12:00'),
(1005, 'ITO', 'Mandi House', '14:12:00', '14:15:00'),
(1005, 'Mandi House', 'Janpath', '14:15:00', '14:18:00'),
(1005, 'Janpath', 'Central Secretariat', '14:18:00', '14:21:00'),
(1005, 'Central Secretariat', 'Khan Market', '14:21:00', '14:24:00'),
(1005, 'Khan Market', 'Jawaharlal Nehru Stadium', '14:24:00', '14:27:00'),
(1005, 'Jawaharlal Nehru Stadium', 'Jangpura', '14:27:00', '14:30:00'),
(1005, 'Jangpura', 'Lajpat Nagar', '14:30:00', '14:33:00'),
(1005, 'Lajpat Nagar', 'Moolchand', '14:33:00', '14:36:00'),
(1005, 'Moolchand', 'Kailash Colony', '14:36:00', '14:39:00'),
(1005, 'Kailash Colony', 'Nehru Place', '14:39:00', '14:42:00'),
(1005, 'Nehru Place', 'Kalkaji Mandir', '14:42:00', '14:45:00'),
(1005, 'Kalkaji Mandir', 'Govind Puri', '14:45:00', '14:48:00'),
(1005, 'Govind Puri', 'Okhla', '14:48:00', '14:51:00'),
(1005, 'Okhla', 'Jasola-Apollo', '14:51:00', '14:54:00'),
(1005, 'Jasola-Apollo', 'Sarita Vihar', '14:54:00', '14:57:00'),
(1005, 'Sarita Vihar', 'Mohan Estate', '14:57:00', '15:00:00'),
(1005, 'Mohan Estate', 'Tughlakabad', '15:00:00', '15:03:00'),
(1005, 'Tughlakabad', 'Badarpur Border', '15:03:00', '15:06:00'),
(1005, 'Badarpur Border', 'Sarai', '15:06:00', '15:09:00'),
(1005, 'Sarai', 'NHPC Chowk', '15:09:00', '15:12:00'),
(1005, 'NHPC Chowk', 'Mewala Maharajpur', '15:12:00', '15:15:00'),
(1005, 'Mewala Maharajpur', 'Sector 28', '15:15:00', '15:18:00'),
(1005, 'Sector 28', 'Badkal Mor', '15:18:00', '15:21:00'),
(1005, 'Badkal Mor', 'Old Faridabad', '15:21:00', '15:24:00'),
(1005, 'Old Faridabad', 'Neelam Chowk Ajronda', '15:24:00', '15:27:00'),
(1005, 'Neelam Chowk Ajronda', 'Bata Chowk', '15:27:00', '15:30:00'),
(1005, 'Bata Chowk', 'Escorts Mujesar', '15:30:00', '15:33:00');

-- Insert sample data into Routes table
INSERT INTO Routes (train_number, station_id, stop_order, distance_from_start) VALUES
('T001', 1, 1, 0),
('T001', 2, 2, 1.5),
('T001', 3, 3, 2.3),
('T001', 4, 4, 3.7),
('T001', 5, 5, 5),
('T001', 6, 6, 5.8),
('T001', 7, 7, 7.2),
('T001', 8, 8, 8.5),
('T001', 9, 9, 10),
('T001', 10, 10, 11.4);

-- Insert sample data into Booking table
INSERT INTO Booking (user_id, train_number, schedule_id, date, status) VALUES
(1, 'T001', 1, '2023-10-01', 'Booked'),
(2, 'T002', 6, '2023-10-02', 'Booked'),
(3, 'T003', 2, '2023-10-03', 'cancelled'),
(4, 'T004', 3, '2023-10-04', 'confirmed'),
(5, 'T005', 4, '2023-10-05', 'Booked');

-- Insert sample data into Ticket table
INSERT INTO Ticket (booking_id, seat_number, price, start_station_id, end_station_id, date) VALUES
(1, 1, 50.00, 1, 5, '2023-10-01'),
(2, 2, 60.00, 6, 10, '2023-10-02'),
(3, 3, 40.00, 2, 4, '2023-10-03'),
(4, 4, 30.00, 3, 6, '2023-10-04'),
(5, 5, 70.00, 1, 10, '2023-10-05');

-- Insert sample data into Payment table
INSERT INTO Payment (booking_id, date, amount, payment_method, payment_status) VALUES
(1, '2023-10-01', 50.00, 'Card', 'success'),
(2, '2023-10-02', 60.00, 'Cash', 'success'),
(3, '2023-10-03', 40.00, 'Card', 'failed'),
(4, '2023-10-04', 30.00, 'Cash', 'pending'),
(5, '2023-10-05', 70.00, 'Card', 'success');

-- Select statements to verify data
SELECT * FROM User;
SELECT * FROM Station;
SELECT * FROM Trains;
SELECT * FROM TrainSchedule;
SELECT * FROM Routes;
SELECT * FROM Booking;
SELECT * FROM Ticket;
SELECT * FROM Payment;

-- Query to check available seats after booking
SELECT 
    t.train_number,
    t.train_name,
    t.number_of_seats - COUNT(b.booking_id) AS available_seats
FROM 
    Trains t
LEFT JOIN 
    Booking b ON t.train_number = b.train_number
WHERE 
    b.status = 'Booked'
GROUP BY 
    t.train_number, t.train_name, t.number_of_seats;

-- Query to calculate fare and total distance
SELECT 
    t.train_number,
    t.train_name,
    r2.distance_from_start - r1.distance_from_start AS total_distance,
    (r2.stop_order - r1.stop_order) * 100 AS fare_price,
    s1.TimeReachingFrom AS departure_time_from_source,
    s2.TimeReachingTo AS arrival_time_at_destination
FROM 
    Trains t
JOIN 
    Routes r1 ON t.train_number = r1.train_number
JOIN 
    Routes r2 ON t.train_number = r2.train_number
JOIN 
    TrainSchedule s1 ON t.train_number = s1.TrainNumber AND r1.station_id = (SELECT station_id FROM Station WHERE station_name = s1.FromStation)
JOIN 
    TrainSchedule s2 ON t.train_number = s2.TrainNumber AND r2.station_id = (SELECT station_id FROM Station WHERE station_name = s2.ToStation)
WHERE 
    r1.station_id = (SELECT station_id FROM Station WHERE station_name = 'Delhi Gate')
    AND r2.station_id = (SELECT station_id FROM Station WHERE station_name = 'Janpath')
    AND r1.stop_order < r2.stop_order;

-- Additional select statements to verify the data
SELECT * FROM Routes;
SELECT * FROM Trains;
SELECT * FROM Station;
