Here is a clean, professional README text you can copy and paste:

---

# Database Security – Attack & Defense Demonstration

This project demonstrates common database-related vulnerabilities in web applications and their corresponding security defenses. The goal is to illustrate how improper input handling, weak authentication mechanisms, and insecure data access can compromise a system, and how proper security practices effectively mitigate these risks.

## Technologies Used

* PHP (running on Apache via XAMPP)
* MySQL (MariaDB)
* HeidiSQL
* Git & GitHub

## Project Structure

* **main** → Secure baseline implementation
* **vulnerable** → Intentionally insecure version for academic demonstration

The vulnerable branch contains modified code used to demonstrate attacks such as SQL injection, weak password hashing, brute-force authentication, and excessive data exposure.

## Setup Instructions

1. Install XAMPP and start Apache and MySQL.
2. Import `schema.sql` into MySQL to create the database structure.
3. Place the project folder inside `C:\xampp\htdocs\`.
4. Open `http://localhost/login-demo/login.php` in your browser.

## Disclaimer

The vulnerable branch contains intentionally insecure code for educational purposes only and should not be deployed in a production environment.

---
