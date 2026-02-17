<?php
session_start();
if (!isset($_SESSION["email"])) { header("Location: login.php"); exit; }
?>
<!doctype html>
<html>
<body>
  <h2>Dashboard</h2>
  <p>Logged in as: <?= htmlspecialchars($_SESSION["email"]) ?></p>
  <p>Role: <?= htmlspecialchars($_SESSION["role"]) ?></p>

  <form method="post" action="logout.php">
    <button type="submit">Logout</button>
  </form>
</body>
</html>