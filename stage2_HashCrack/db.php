<?php
$host = "localhost"; // FIX: Forces the direct internal socket connection
$db   = "u657373697_stage2";
$user = "u657373697_jad";
$pass = "RYh4hoO;"; 

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database Connection Failed: " . $e->getMessage());
}
?>