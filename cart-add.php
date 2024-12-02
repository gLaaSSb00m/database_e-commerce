<?php
// Include the common file for database connection
require("includes/common.php");

// Start the session
session_start();

// Check if user is logged in
if (!isset($_SESSION['Customer_customerId'])) {
    echo "User not logged in.";
    exit();
}

// Check if cartId is set and is numeric
if (isset($_GET['cartId']) && is_numeric($_GET['cartId'])) {
    $item_id = $_GET['cartId'];
    $user_id = $_SESSION['Customer_customerId'];

    // Prepare and execute the query
    $query = "INSERT INTO Cart(Customer_customerId, item_id, status) VALUES('$user_id', '$item_id', 'Added to cart')";
    if (mysqli_query($con, $query)) {
        header('location: products.php');
    } else {
        echo "Error: " . mysqli_error($con);
    }
} else {
    echo "Invalid item ID.";
}
?>
