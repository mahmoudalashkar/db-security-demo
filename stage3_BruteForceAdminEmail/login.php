<?php
session_start();
if (isset($_SESSION["email"])) { header("Location: dashboard.php"); exit; }
$err = isset($_GET["err"]);
?>
<!doctype html>
<html>
<body>
  <h2>Login</h2>
  <?php if ($err) echo "<p style='color:red'>Invalid email or password</p>"; ?>

  <form method="post" action="authenticate.php">
    <input type="email" name="email" placeholder="email" required><br><br>
    <input type="password" name="password" placeholder="password" required><br><br>
    <button type="submit">Login</button>
  </form>

  <p style="color: gray;">Test: test@demo.com / password</p>
  <p style="color: gray; font-size: 0.8em;">Note: DB uses Bcrypt hashing.</p></body>

  </html>
