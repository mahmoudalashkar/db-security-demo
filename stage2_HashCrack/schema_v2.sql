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
-- INSERT INTO users (name, email, password, role) 
-- VALUES ('Test User', 'test@demo.com', '123456', 'user');
INSERT INTO users (name, email, password, role) VALUES
('System Admin', 'darkknight_99@corp.local', 'password', 'admin'),
('Alice Smith', 'a.smith@corp.local', 'password', 'user'),
('Bob Johnson', 'b.johnson@corp.local', 'password', 'user'),
('Charlie Davis', 'c.davis@corp.local', 'password', 'manager'),
('Diana Prince', 'd.prince@corp.local', 'password', 'admin'),
('Edward Norton', 'e.norton@corp.local', 'password', 'user'),
('Fiona Gallagher', 'f.gallagher@corp.local', 'password', 'dev'),
('George Miller', 'g.miller@corp.local', 'password', 'user'),
('Hannah Abbott', 'h.abbott@corp.local', 'password', 'hr'),
('Ian Wright', 'i.wright@corp.local', 'password', 'user'),
('Jack Sparrow', 'j.sparrow@corp.local', 'password', 'user'),
('Kevin Hart', 'k.hart@corp.local', 'password', 'sales'),
('Laura Palmer', 'l.palmer@corp.local', 'password', 'user'),
('Mike Wazowski', 'm.wazowski@corp.local', 'password', 'dev'),
('Nina Simone', 'n.simone@corp.local', 'password', 'user'),
('Oscar Isaac', 'o.isaac@corp.local', 'password', 'manager'),
('Peter Parker', 'p.parker@corp.local', 'password', 'user'),
('Quentin Tarantino', 'q.tarantino@corp.local', 'password', 'dev'),
('Riley Reid', 'r.reid@corp.local', 'password', 'user'),
('Sarah Connor', 's.connor@corp.local', 'password', 'security'),
('Tony Stark', 't.stark@corp.local', 'password', 'admin'),
('Ursula Dittrich', 'u.dittrich@corp.local', 'password', 'user'),
('Victor Von Doom', 'v.vondoom@corp.local', 'password', 'dev'),
('Wanda Maximoff', 'w.maximoff@corp.local', 'password', 'user'),
('Xavier Renegade', 'x.renegade@corp.local', 'password', 'user'),
('Yara Greyjoy', 'y.greyjoy@corp.local', 'password', 'manager'),
('Zane Grey', 'z.grey@corp.local', 'password', 'user'),
('Arthur Dent', 'a.dent@corp.local', 'password', 'user'),
('Brie Larson', 'b.larson@corp.local', 'password', 'hr'),
('Chris Evans', 'c.evans@corp.local', 'password', 'user'),
('David Bowie', 'd.bowie@corp.local', 'password', 'dev'),
('Ellen Ripley', 'e.ripley@corp.local', 'password', 'security'),
('Finn Wolfhard', 'f.wolfhard@corp.local', 'password', 'user'),
('Gwen Stacy', 'g.stacy@corp.local', 'password', 'user'),
('Harry Potter', 'h.potter@corp.local', 'password', 'user'),
('Iris West', 'i.west@corp.local', 'password', 'user'),
('James Bond', 'j.bond@corp.local', 'password', 'admin'),
('Kate Bishop', 'k.bishop@corp.local', 'password', 'user'),
('Luke Skywalker', 'l.skywalker@corp.local', 'password', 'dev'),
('Marty McFly', 'm.mcfly@corp.local', 'password', 'user'),
('Natasha Romanoff', 'n.romanoff@corp.local', 'password', 'security'),
('Oliver Queen', 'o.queen@corp.local', 'password', 'manager'),
('Peggy Carter', 'p.carter@corp.local', 'password', 'admin'),
('Quinn Fabray', 'q.fabray@corp.local', 'password', 'user'),
('Rick Grimes', 'r.grimes@corp.local', 'password', 'user'),
('Steve Rogers', 's.rogers@corp.local', 'password', 'user'),
('Thor Odinson', 't.odinson@corp.local', 'password', 'dev'),
('Uma Thurman', 'u.thurman@corp.local', 'password', 'user'),
('Velma Dinkley', 'v.dinkley@corp.local', 'password', 'dev'),
('Winston Smith', 'w.smith@corp.local', 'password', 'user'),
('Zelda Fitzgerald', 'z.fitzgerald@corp.local', 'password', 'user');

INSERT INTO users (name, email, password, role) 
VALUES ('Test User', 'test@demo.com', 'password', 'user');

UPDATE users SET password = MD5(password);