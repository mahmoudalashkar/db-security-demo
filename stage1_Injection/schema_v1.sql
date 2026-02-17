CREATE DATABASE IF NOT EXISTS db_stage1;
USE db_stage1;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255), -- VULNERABLE: Plaintext
    role VARCHAR(20)
);

CREATE TABLE login_attempts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) NOT NULL,
  ip VARCHAR(45) NOT NULL,
  fails INT NOT NULL DEFAULT 0,
  locked_until DATETIME NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uniq_email_ip (email, ip)
);

INSERT INTO users (name, email, password, role) 
VALUES ('Test User', 'test@demo.com', '123456', 'user');

INSERT IGNORE INTO users (name, email, password, role)
VALUES 
('Tom Hanks', 'tom.hanks@demo.com', 'password1234', 'user'),
('Emma Watson', 'emma.watson@demo.com', 'password5678', 'admin'),
('Robert Downey', 'robert.downey@demo.com', 'password91011', 'user'),
('Scarlett Johansson', 'scarlett.johansson@demo.com', 'password1213', 'user'),
('Chris Hemsworth', 'chris.hemsworth@demo.com', 'password1415', 'admin'),
('Natalie Portman', 'natalie.portman@demo.com', 'password1617', 'user'),
('Morgan Freeman', 'morgan.freeman@demo.com', 'password1819', 'user'),
('Sandra Bullock', 'sandra.bullock@demo.com', 'password2021', 'admin'),
('Harrison Ford', 'harrison.ford@demo.com', 'password2223', 'user'),
('Meryl Streep', 'meryl.streep@demo.com', 'password2425', 'user');