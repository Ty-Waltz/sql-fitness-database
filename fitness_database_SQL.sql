CREATE SCHEMA fitness_database;
USE fitness_database;

CREATE TABLE Members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO Members (name, age)
VALUES ("John Smith", 40),
       ("Kate Johnson", 22),
       ("Ryan Brown", 35);
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES 
    (1, 1, '2024-08-01', '08:00 AM', 'Cardio'),
    (2, 2, '2024-08-02', '09:00 AM', 'Yoga'),
    (3, 3, '2024-08-03', '10:00 AM', 'Weight Training');
    
UPDATE WorkoutSessions
SET session_time = '06:00 PM'
WHERE member_id = 2
AND session_date = '2024-08-02';

DELETE FROM Members
WHERE name = 'John Smith';

DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Smith');