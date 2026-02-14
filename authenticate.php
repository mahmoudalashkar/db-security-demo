<?php
session_start();
require "db.php";

$email = $_POST["email"] ?? "";
$pass  = $_POST["password"] ?? "";

$stmt = $pdo->prepare("SELECT email, password_hash, role FROM users WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch();

if (!$user || !password_verify($pass, $user["password_hash"])) {
  header("Location: login.php?err=1");
  exit;
}

session_regenerate_id(true);
$_SESSION["email"] = $user["email"];
$_SESSION["role"]  = $user["role"];

header("Location: dashboard.php");
exit;
