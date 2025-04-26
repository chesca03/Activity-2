<?php
$host = "localhost";
$db = "user_auth";
$user = "root";
$pass = ""; // default XAMPP password

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if (empty($email) || empty($password)) {
  echo "Please fill in all fields.";
  exit();
}

// Check failed attempts in the last 5 minutes
$checkAttempts = $conn->prepare("SELECT COUNT(*) FROM login_attempts WHERE email = ? AND attempt = 'failed' AND attempt_time > (NOW() - INTERVAL 5 MINUTE)");
$checkAttempts->bind_param("s", $email);
$checkAttempts->execute();
$checkAttempts->bind_result($attempts);
$checkAttempts->fetch();
$checkAttempts->close();

if ($attempts >= 5) {
  echo "Too many login attempts. Please try again after 5 minutes.";
  exit();
}

// Look for the user in the database
$stmt = $conn->prepare("SELECT password FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows === 1) {
  $stmt->bind_result($hashedPassword);
  $stmt->fetch();

  if (password_verify($password, $hashedPassword)) {
    echo "Login successful!";

    // Log successful login
    $logSuccess = $conn->prepare("INSERT INTO login_attempts (email, attempt_time, attempt) VALUES (?, NOW(), 'success')");
    $logSuccess->bind_param("s", $email);
    $logSuccess->execute();
    $logSuccess->close();

    // Optional: delete failed attempts on success
    $deleteAttempts = $conn->prepare("DELETE FROM login_attempts WHERE email = ? AND attempt = 'failed'");
    $deleteAttempts->bind_param("s", $email);
    $deleteAttempts->execute();
    $deleteAttempts->close();

  } else {
    // Wrong password — log failed attempt
    $logFailed = $conn->prepare("INSERT INTO login_attempts (email, attempt_time, attempt) VALUES (?, NOW(), 'failed')");
    $logFailed->bind_param("s", $email);
    $logFailed->execute();
    $logFailed->close();

    echo "Incorrect password.";
  }

} else {
  // User not found — log failed attempt
  $logNoUser = $conn->prepare("INSERT INTO login_attempts (email, attempt_time, attempt) VALUES (?, NOW(), 'failed')");
  $logNoUser->bind_param("s", $email);
  $logNoUser->execute();
  $logNoUser->close();

  echo "No user found with that email.";
}

$stmt->close();
$conn->close();
?>
