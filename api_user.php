<?php
session_start();
require "db.php";

if (!isset($_SESSION["email"])) {
  http_response_code(401);
  echo json_encode(["error" => "unauthorized"]);
  exit;
}

// Good practice: return only what is needed (no SELECT *)
$stmt = $pdo->prepare("SELECT email, role FROM users WHERE email = ?");
$stmt->execute([$_SESSION["email"]]);
$me = $stmt->fetch();

header("Content-Type: application/json; charset=utf-8");
echo json_encode($me);
