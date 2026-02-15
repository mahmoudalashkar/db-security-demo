CREATE DATABASE IF NOT EXISTS db_stage2;
USE db_stage2;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255), -- WEAK: MD5 Hash
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

-- MD5 of '123456' is e10adc3949ba59abbe56e057f20f883e
INSERT INTO users (name, email, password, role) 
VALUES ('Test User', 'test@demo.com', 'e10adc3949ba59abbe56e057f20f883e', 'user');
