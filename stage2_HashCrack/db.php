<?php
$host = "localhost"; // FIX: Forces the direct internal socket connection
$port = "3307";
$db   = "db_stage2";
$user = "root";
$pass = ""; // blank

$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4";
$pdo = new PDO($dsn, $user, $pass, [
  
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
]);
?>