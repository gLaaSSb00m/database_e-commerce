<?php
require "includes/common.php";
session_start();

// Collect and sanitize inputs
$email = mysqli_real_escape_string($con, $_POST['eMail']);
$pass = mysqli_real_escape_string($con, $_POST['password']);
$confirm_pass = mysqli_real_escape_string($con, $_POST['confirm_password']);
$first = mysqli_real_escape_string($con, $_POST['firstName']);
$last = mysqli_real_escape_string($con, $_POST['lastName']);
$dob = mysqli_real_escape_string($con, $_POST['dateOfBirth']);
$phone = mysqli_real_escape_string($con, $_POST['phone']);

// Validate that passwords match
if ($pass !== $confirm_pass) {
    $m = "Passwords do not match";
    header('location: index.php?error=' . $m);
    exit();
}

// Hash the password
$hashed_pass = md5($pass);

// Calculate age from DateOfBirth
$dob_date = new DateTime($dob);
$current_date = new DateTime();
$age = $dob_date->diff($current_date)->y;

// Check if the email already exists
$query = "SELECT * FROM Customer WHERE Email='$email'";
$result = mysqli_query($con, $query);
$num = mysqli_num_rows($result);

if ($num != 0) {
    $m = "Email Already Exists";
    header('location: index.php?error=' . $m);
    exit();
} else {
    // Insert the new customer into the database
    $quer = "INSERT INTO Customer (FirstName, LastName, Email, DateOfBirth, Phone, Age) 
             VALUES ('$first', '$last', '$email', '$dob', '$phone', $age)";
    mysqli_query($con, $quer);

    // Fetch the new customer's ID and set session variables
    $customer_id = mysqli_insert_id($con);
    $_SESSION['email'] = $email;
    $_SESSION['customer_id'] = $customer_id;

    // Redirect to the products page
    header('location:products.php');
    exit();
}
?>
