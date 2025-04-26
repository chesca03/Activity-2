<?php
$host = "localhost";
$db = "user_auth";
$user = "root";
$pass = ""; // default XAMPP password

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get form data
$fullName = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$confirmPassword = $_POST['confirm-password'] ?? '';

// Simple validation
if ($password !== $confirmPassword) {
  die("Passwords do not match.");
}

if (empty($fullName) || empty($email) || empty($password)) {
  die("Please fill in all fields.");
}

// Hash password
$hashedPassword = password_hash($password, PASSWORD_BCRYPT);

// Insert into DB
$stmt = $conn->prepare("INSERT INTO users (full_name, email, password) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $fullName, $email, $hashedPassword);

if ($stmt->execute()) {
  echo "Account created successfully. <a href='login.html'>Login here</a>";
} else {
  echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
