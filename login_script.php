<?php
require "includes/common.php";
session_start();

// Collect and sanitize inputs
$email = mysqli_real_escape_string($con, $_POST['lemail']);
$password = mysqli_real_escape_string($con, $_POST['lpassword']);
$password = md5($password); // Hash the input password for comparison

// Query the Customer table for login credentials
$query = "SELECT CustomerID, Email, FirstName, LastName, Phone, City FROM Customer WHERE Email='$email' AND Password='$password'";
$result = mysqli_query($con, $query);
$num = mysqli_num_rows($result);

if ($num == 0) {
    // Redirect back with an error message if credentials don't match
    $m = "Invalid E-mail or Password.";
    header('location: index.php?errorl=' . $m);
    exit();
} else {
    // Fetch the user data
    $row = mysqli_fetch_array($result);

    // Set session variables
    $_SESSION['email'] = $row['Email'];
    $_SESSION['Customer_customerId'] = $row['CustomerID'];
    $_SESSION['name'] = $row['FirstName'] . ' ' . $row['LastName'];
    $_SESSION['phone'] = $row['Phone'];
    $_SESSION['city'] = $row['City'];

    // Redirect to the products page
    header('location:products.php');
    exit();
}
?>
