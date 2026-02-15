<?php
include('../db.php'); 

// SPEAKER 4 VULNERABILITY: 
// The SELECT * pulls everything, including the secret email and password hash
$sql = "SELECT * FROM users WHERE role = 'admin' LIMIT 1";
$stmt = $pdo->query($sql);
$data = $stmt->fetch();

header('Content-Type: application/json');
echo json_encode($data);
?>