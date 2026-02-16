CREATE DATABASE IF NOT EXISTS db_stage3;
USE db_stage3;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255), -- SECURE: Bcrypt
    role VARCHAR(20)
);


-- Password is 'password'
INSERT INTO users (name, email, password_hash, role) 
VALUES ('Test User', 'test@demo.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user');
