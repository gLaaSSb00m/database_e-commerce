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
    $user_email = $_SESSION['email'];
    $user_name = $_SESSION['name'];
    $user_phone = $_SESSION['phone'];
    $user_city = $_SESSION['city'];

    // Sanitize city name to create a valid table name (remove special characters)
    $table_name = preg_replace('/[^a-zA-Z0-9_]/', '_', $user_city);

    // Create user-specific table if it doesn't exist, including Customer_customerId
    $create_table_query = "
        CREATE TABLE IF NOT EXISTS $table_name (
            cartId INT AUTO_INCREMENT PRIMARY KEY,
            Customer_customerId INT,
            status VARCHAR(50),
            item_id INT,
            user_name VARCHAR(100),
            user_phone VARCHAR(15),
            city VARCHAR(50),
            email VARCHAR(100)
        )";
    mysqli_query($con, $create_table_query) or die(mysqli_error($con));

    // Insert data into the user-specific table, including Customer_customerId
    $insert_query = "
        INSERT INTO $table_name (Customer_customerId, status, item_id, user_name, user_phone, city, email)
        VALUES ('$user_id', 'Added to cart', '$item_id', '$user_name', '$user_phone', '$user_city', '$user_email')";
    mysqli_query($con, $insert_query) or die(mysqli_error($con));

    // Also insert into the main Cart table
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
