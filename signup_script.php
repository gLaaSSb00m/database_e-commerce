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
$city = mysqli_real_escape_string($con, $_POST['city']);

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

// Check if the email already exists in the main Customer table
$query = "SELECT * FROM Customer WHERE Email='$email'";
$result = mysqli_query($con, $query);
$num = mysqli_num_rows($result);

if ($num != 0) {
    $m = "Email Already Exists";
    header('location: index.php?error=' . $m);
    exit();
}

// Determine the carrier based on phone number prefix
$carrier_table = null;

if (strpos($phone, '019') === 0) {
    $carrier_table = "Banglalink";
} elseif (strpos($phone, '018') === 0) {
    $carrier_table = "Robi";
} elseif (strpos($phone, '016') === 0) {
    $carrier_table = "Airtel";
} elseif (strpos($phone, '017') === 0) {
    $carrier_table = "Grameenphone";
} else {
    $carrier_table = "Other";
}

// Create carrier-specific table if it doesn't exist
$create_carrier_table_query = "
    CREATE TABLE IF NOT EXISTS $carrier_table (
        ID INT AUTO_INCREMENT PRIMARY KEY,
        Email VARCHAR(100) UNIQUE,
        Phone VARCHAR(15),
        City VARCHAR(50)
    )";
mysqli_query($con, $create_carrier_table_query);

// Insert data into the carrier-specific table
$insert_carrier_query = "
    INSERT INTO $carrier_table (Email, Phone, City) 
    VALUES ('$email', '$phone', '$city')";
mysqli_query($con, $insert_carrier_query);




// Create a city-specific table if it doesn't exist
$city_table = "Customer_" . $city; // Table name, e.g., Customer_Sylhet
$create_table_query = "
    CREATE TABLE IF NOT EXISTS $city_table (
        CustomerID INT AUTO_INCREMENT PRIMARY KEY,
        FirstName VARCHAR(100),
        LastName VARCHAR(100),
        Email VARCHAR(100) UNIQUE,
        Password VARCHAR(255),
        DateOfBirth DATE,
        Phone VARCHAR(15),
        Age INT,
        City VARCHAR(50)
    )";
mysqli_query($con, $create_table_query);

// Insert data into the city-specific table
$insert_query = "
    INSERT INTO $city_table (FirstName, LastName, Email, Password, DateOfBirth, Phone, Age, City) 
    VALUES ('$first', '$last', '$email', '$hashed_pass', '$dob', '$phone', $age, '$city')";
mysqli_query($con, $insert_query);

// Insert data into the main Customer table
$main_table_query = "
    INSERT INTO Customer (FirstName, LastName, Email, DateOfBirth, Phone, Age, City, Password) 
    VALUES ('$first', '$last', '$email', '$dob', '$phone', $age, '$city', '$hashed_pass')";
mysqli_query($con, $main_table_query);

// Fetch the new customer's ID and set session variables
$customer_id = mysqli_insert_id($con);
$_SESSION['email'] = $row['Email'];
$_SESSION['Customer_customerId'] = $row['CustomerID'];
$_SESSION['name'] = $row['FirstName'] . ' ' . $row['LastName'];

// Redirect to the products page
header('location:products.php');
exit();
?>
