<?php
session_start();
require "db.php";

if (!isset($_SESSION["email"]) || $_SESSION["role"] !== "admin") {
    header("Location: login.php");
    exit;
}

// Fetch all users
$stmt = $pdo->query("SELECT id, email, role FROM users");
$users = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
</head>
<body>
    <h2>Admin Panel - Registered Users</h2>
    <p>Logged in as: <?php echo htmlspecialchars($_SESSION["email"]); ?></p>

    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Role</th>
        </tr>
        <?php foreach ($users as $user): ?>
        <tr>
            <td><?php echo $user["id"]; ?></td>
            <td><?php echo htmlspecialchars($user["email"]); ?></td>
            <td><?php echo $user["role"]; ?></td>
        </tr>
        <?php endforeach; ?>
    </table>

    <br>
    <a href="logout.php">Logout</a>
</body>
</html>
