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
    Email: <input type="text" name="email"><br><br>
    Password: <input type="text" name="password"><br><br>
    <button type="submit">Login</button>
</form>

  <p style="color: gray;">Test: test@demo.com / 123456</p>
  <p style="color: gray; font-size: 0.8em;">Note: DB uses Plaintext storage.</p>
  
</body>
</html>
