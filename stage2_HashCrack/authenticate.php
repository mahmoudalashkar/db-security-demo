<?php
session_start();
require "db.php";

$email = $_POST["email"] ?? "";
$pass  = $_POST["password"] ?? "";
$ip    = $_SERVER["REMOTE_ADDR"] ?? "unknown";

if ($email === "" || $pass === "") {
  header("Location: login.php?err=1");
  exit;
}

// --- Rate limit config ---
$MAX_FAILS = 5;
$LOCK_MIN  = 2; // lock duration (minutes)

// 1) Check lock status
$check = $pdo->prepare("SELECT fails, locked_until FROM login_attempts WHERE email=? AND ip=?");
$check->execute([$email, $ip]);
$row = $check->fetch();

if ($row && $row["locked_until"] !== null) {
  $lockedUntil = strtotime($row["locked_until"]);
  if ($lockedUntil !== false && $lockedUntil > time()) {
    http_response_code(429);
    echo "Too many attempts. Try again later.";
    exit;
  }
}

// 2) Fetch user securely (blocks SQL injection)
$stmt = $pdo->prepare("SELECT id, email, password_hash, role FROM users WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch();

$ok = ($user && password_verify($pass, $user["password_hash"]));

if (!$ok) {
  // Upsert attempt row
  $pdo->prepare("
    INSERT INTO login_attempts(email, ip, fails, locked_until)
    VALUES(?, ?, 1, NULL)
    ON DUPLICATE KEY UPDATE fails = fails + 1
  ")->execute([$email, $ip]);

  // Re-read fails
  $check->execute([$email, $ip]);
  $row = $check->fetch();

  if ($row && (int)$row["fails"] >= $MAX_FAILS) {
    $pdo->prepare("
      UPDATE login_attempts
      SET locked_until = DATE_ADD(NOW(), INTERVAL ? MINUTE)
      WHERE email=? AND ip=?
    ")->execute([$LOCK_MIN, $email, $ip]);
  }

  header("Location: login.php?err=1");
  exit;
}

// 3) Success: clear attempts
$pdo->prepare("DELETE FROM login_attempts WHERE email=? AND ip=?")->execute([$email, $ip]);

// 4) Login session
session_regenerate_id(true);
$_SESSION["email"] = $user["email"];
$_SESSION["role"]  = $user["role"];

if ($user["role"] === "admin") {
    header("Location: admin.php");
} else {
    header("Location: dashboard.php");
}
exit;

