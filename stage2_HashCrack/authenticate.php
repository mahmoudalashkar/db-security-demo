<?php
session_start();
require "db.php";

$email = $_POST["email"] ?? "";
$pass  = $_POST["password"] ?? "";

if ($email === "" || $pass === "") {
  header("Location: login.php?err=1");
  exit;
}


$stmt = $pdo->prepare("SELECT id, email, password, role FROM users WHERE email = ?");

$stmt->execute([$email]);
$user = $stmt->fetch();

$ok = ($user && md5($pass) === $user['password']);


if (!$ok) {
  header("Location: login.php?err=1");
  exit;
}

session_regenerate_id(true);
$_SESSION["email"] = $user["email"];
$_SESSION["role"]  = $user["role"];

if ($user["role"] === "admin") {
  header("Location: admin.php");
} else {
  header("Location: dashboard.php");
}
exit;
