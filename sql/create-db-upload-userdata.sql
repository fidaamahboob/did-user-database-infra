Create database if not exists user_data;
use user_data;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL UNIQUE,
    last_name VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO users (first_name, last_name, date_of_birth, is_active)
VALUES
('Alice', 'Johnson', '1990-04-12', TRUE),
('Bob', 'Williams', '1985-11-23', TRUE),
('Charlie', 'Brown', '1992-06-15', TRUE),
('Diana', 'Evans', '1998-02-09', TRUE),
('Ethan', 'Clark', '1989-08-30', TRUE),
('Fiona', 'Martinez', '1995-12-25', FALSE),
('George', 'Miller', '1993-07-04', TRUE),
('Hannah', 'Davis', '2000-01-18', TRUE),
('Isaac', 'Moore', '1987-09-12', TRUE),
('Julia', 'Taylor', '1994-05-21', FALSE)
('Alex', 'Jones', '2010-04-12', TRUE);