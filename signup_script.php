<?php
require "includes/common.php";
session_start();

$email = mysqli_real_escape_string($con, $_POST['eMail']);
$pass = mysqli_real_escape_string($con, $_POST['password']);
$confirm_pass = mysqli_real_escape_string($con, $_POST['confirm_password']);
$first = mysqli_real_escape_string($con, $_POST['firstName']);
$last = mysqli_real_escape_string($con, $_POST['lastName']);
$dob = mysqli_real_escape_string($con, $_POST['dateOfBirth']);
$phone = mysqli_real_escape_string($con, $_POST['phone']);
$city = mysqli_real_escape_string($con, $_POST['city']);


if ($pass !== $confirm_pass) {
    $m = "Passwords do not match";
    header('location: index.php?error=' . $m);
    exit();
}


$hashed_pass = md5($pass);


$dob_date = new DateTime($dob);
$current_date = new DateTime();
$age = $dob_date->diff($current_date)->y;


mysqli_select_db($con, 'shopeease');
$query = "SELECT * FROM Customers WHERE Email='$email'";
$result = mysqli_query($con, $query);

if (mysqli_num_rows($result) != 0) {
    $m = "Email Already Exists";
    header('location: index.php?error=' . $m);
    exit();
}

$insert_customer_query = "
    INSERT INTO Customers (FirstName, LastName, Email, Password, DateOfBirth, Phone, Age, City) 
    VALUES ('$first', '$last', '$email', '$hashed_pass', '$dob', '$phone', $age, '$city')";
mysqli_query($con, $insert_customer_query);


$city_db = "CustomerDB_" . strtolower($city); 
$create_city_db_query = "CREATE DATABASE IF NOT EXISTS $city_db";
mysqli_query($con, $create_city_db_query);


mysqli_select_db($con, $city_db);
$create_city_table_query = "
    CREATE TABLE IF NOT EXISTS Customers (
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
mysqli_query($con, $create_city_table_query);


$insert_city_customer_query = "
    INSERT INTO Customers (FirstName, LastName, Email, Password, DateOfBirth, Phone, Age, City) 
    VALUES ('$first', '$last', '$email', '$hashed_pass', '$dob', '$phone', $age, '$city')";
mysqli_query($con, $insert_city_customer_query);


mysqli_select_db($con, 'shopeease');
$customer_id = mysqli_insert_id($con);
$query = "SELECT CustomerID, Email, FirstName, LastName, Phone, City FROM Customers WHERE CustomerID='$customer_id'";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_assoc($result);

$_SESSION['email'] = $row['Email'];
$_SESSION['Customer_customerId'] = $row['CustomerID'];
$_SESSION['name'] = $row['FirstName'] . ' ' . $row['LastName'];
$_SESSION['phone'] = $row['Phone'];
$_SESSION['city'] = $row['City'];

header('location: products.php');
exit();
?>
