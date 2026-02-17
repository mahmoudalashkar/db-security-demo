<?php
session_start();
require "db.php";

$email = $_POST["email"] ?? "";
$pass  = $_POST["password"] ?? "";

if ($email === "" || $pass === "") {
    header("Location: login.php?err=1");
    exit;
}

// ---------------------------------------------------------
// VULNERABLE SQL QUERY (Do NOT use prepare() in Stage 1!)
// This directly concatenates the user input into the string,
// making it vulnerable to ' OR '1'='1
// ---------------------------------------------------------

$sql = "SELECT * FROM users WHERE email = '$email' AND password = MD5('$pass')";

try {
    $stmt = $pdo->query($sql);
    $user = $stmt->fetch();

    if ($user) {
        // Success: Login worked (or SQL Injection bypassed it!)
        session_regenerate_id(true);
        $_SESSION["email"] = $user["email"];
        $_SESSION["role"]  = $user["role"];
        header("Location: dashboard.php");
        exit;
    } else {
        // Failed login
        header("Location: login.php?err=1");
        exit;
    }
} catch (PDOException $e) {
    // If the SQL injection is typed wrong, show the error for the demo
    die("Database Error (Great for showing the class how the query broke!): " . $e->getMessage());
}
?>