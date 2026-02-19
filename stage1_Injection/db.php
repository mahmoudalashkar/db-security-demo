<?php
$host = "localhost"; // FIX: Forces the direct internal socket connection
$db   = "u657373697_stage1";
$user = "u657373697_yasser";
$pass = "A?vDpZ|w1="; 

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database Connection Failed: " . $e->getMessage());
}
?>