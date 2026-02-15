<?php
// stage4_ApiLeak/api/team.php
header('Content-Type: application/json');

// Include your PDO database connection
require_once('../db.php'); 

try {
    // Fetch all users using PDO
    $stmt = $pdo->query("SELECT id, email, password_hash, role FROM users");
    $users = $stmt->fetchAll();
    
    // Output the data as clean JSON for MATLAB
    echo json_encode($users);

} catch (PDOException $e) {
    // If the database fails, send a JSON error so MATLAB doesn't crash
    echo json_encode([["error" => "Database connection failed", "details" => $e->getMessage()]]);
}
?>