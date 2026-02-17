<?php
session_start();

// 1. Kick out anyone who didn't come from authenticate.php
if (!isset($_SESSION['mfa_pending']) || $_SESSION['mfa_pending'] !== true) {
    header("Location: login.php");
    exit;
}

$error = "";

// 2. Process the MFA PIN
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $mfa_code = $_POST['mfa_code'] ?? '';

    // Simulate checking a hardware token
    if ($mfa_code === "123456") {
        
        // SUCCESS: Grant the actual session keys
        $_SESSION['email'] = $_SESSION['pending_email'];
        $_SESSION['role']  = $_SESSION['pending_role'];
        
        $role = $_SESSION['role'];
        
        // Clean up the waiting room tickets
        unset($_SESSION['mfa_pending']);
        unset($_SESSION['pending_email']);
        unset($_SESSION['pending_role']);
        
        // Route them to the correct dashboard
        if ($role === "admin") {
            header("Location: admin.php");
        } else {
            header("Location: dashboard.php");
        }
        exit;
        
    } else {
        $error = "Invalid Authenticator Code. Intruder Alert.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Two-Factor Authentication</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #1e1e1e; color: #fff; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .mfa-box { background: #2d2d2d; padding: 40px; border-radius: 10px; box-shadow: 0 8px 16px rgba(0,0,0,0.5); text-align: center; width: 350px; border-top: 5px solid #007bff; }
        h2 { margin-top: 0; }
        input[type="text"] { padding: 12px; width: 80%; margin: 20px 0; font-size: 24px; text-align: center; letter-spacing: 8px; border: 1px solid #555; background: #1e1e1e; color: #00ffcc; border-radius: 5px; outline: none; }
        input[type="text"]:focus { border-color: #007bff; }
        button { padding: 12px 25px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; font-weight: bold; width: 100%; transition: 0.3s; }
        button:hover { background-color: #0056b3; }
        .error { color: #ff4d4d; font-weight: bold; margin-bottom: 10px; }
        .demo-note { font-size: 12px; color: #888; margin-top: 25px; }
    </style>
</head>
<body>

    <div class="mfa-box">
        <h2>Security Check</h2>
        <p style="color: #bbb;">Please enter the 6-digit code from your authenticator device.</p>
        
        <?php if ($error): ?>
            <div class="error"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>

        <form method="POST" action="mfa.php">
            <input type="text" name="mfa_code" maxlength="6" placeholder="••••••" required autocomplete="off" autofocus>
            <br>
            <button type="submit">Verify Identity</button>
        </form>
        
        <div class="demo-note">
            (Demo Tooltip: The correct hardware token is <strong>123456</strong>)
        </div>
    </div>

</body>
</html>