CREATE DATABASE IF NOT EXISTS db_stage4;
USE db_stage4;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
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

USE db_stage4;

-- Bulk inserting 50 users for a realistic corporate environment
INSERT INTO users (name, email, password_hash, role) VALUES
('System Admin', 'darkknight_99@corp.local', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin'),
('Alice Smith', 'a.smith@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Bob Johnson', 'b.johnson@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Charlie Davis', 'c.davis@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'manager'),
('Diana Prince', 'd.prince@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'admin'),
('Edward Norton', 'e.norton@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Fiona Gallagher', 'f.gallagher@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'dev'),
('George Miller', 'g.miller@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Hannah Abbott', 'h.abbott@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'hr'),
('Ian Wright', 'i.wright@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Jack Sparrow', 'j.sparrow@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Kevin Hart', 'k.hart@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'sales'),
('Laura Palmer', 'l.palmer@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Mike Wazowski', 'm.wazowski@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'dev'),
('Nina Simone', 'n.simone@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Oscar Isaac', 'o.isaac@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'manager'),
('Peter Parker', 'p.parker@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Quentin Tarantino', 'q.tarantino@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'dev'),
('Riley Reid', 'r.reid@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Sarah Connor', 's.connor@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'security'),
('Tony Stark', 't.stark@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'admin'),
('Ursula Dittrich', 'u.dittrich@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Victor Von Doom', 'v.vondoom@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'dev'),
('Wanda Maximoff', 'w.maximoff@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Xavier Renegade', 'x.renegade@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Yara Greyjoy', 'y.greyjoy@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'manager'),
('Zane Grey', 'z.grey@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Arthur Dent', 'a.dent@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Brie Larson', 'b.larson@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'hr'),
('Chris Evans', 'c.evans@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('David Bowie', 'd.bowie@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'dev'),
('Ellen Ripley', 'e.ripley@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'security'),
('Finn Wolfhard', 'f.wolfhard@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Gwen Stacy', 'g.stacy@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Harry Potter', 'h.potter@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Iris West', 'i.west@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('James Bond', 'j.bond@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'admin'),
('Kate Bishop', 'k.bishop@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Luke Skywalker', 'l.skywalker@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'dev'),
('Marty McFly', 'm.mcfly@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Natasha Romanoff', 'n.romanoff@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'security'),
('Oliver Queen', 'o.queen@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'manager'),
('Peggy Carter', 'p.carter@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'admin'),
('Quinn Fabray', 'q.fabray@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Rick Grimes', 'r.grimes@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Steve Rogers', 's.rogers@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Thor Odinson', 't.odinson@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'dev'),
('Uma Thurman', 'u.thurman@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Velma Dinkley', 'v.dinkley@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'dev'),
('Winston Smith', 'w.smith@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user'),
('Zelda Fitzgerald', 'z.fitzgerald@corp.local', '$2y$10$e0MYzxeK..uD.vF2P7zHwIr2wS.vF2P', 'user');

-- Test user for your login check (Password is 'password')
INSERT INTO users (name, email, password_hash, role) 
VALUES ('Test User', 'test@demo.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user');