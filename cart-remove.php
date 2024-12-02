<?php
require "includes/common.php";
session_start();

if (!isset($_SESSION['Customer_customerId'])) {
    exit(); // Ensure user is logged in
}

if (isset($_GET['cartId']) && is_numeric($_GET['cartId'])) {
    $item_id = $_GET["cartId"];
    $user_id = $_SESSION['Customer_customerId'];
    $user_city = $_SESSION['city'];

    // Sanitize city name to match the table name
    $table_name = preg_replace('/[^a-zA-Z0-9_]/', '_', $user_city);

    // Debugging output
    echo "Item ID: $item_id<br>";
    echo "User ID: $user_id<br>";
    echo "Table Name: $table_name<br>";

    // Delete from Cart table
    $query = "DELETE FROM Cart WHERE cartId='$item_id' AND Customer_customerId='$user_id'";
    $res = mysqli_query($con, $query);

    $delete_city_table_query = "DELETE FROM `$table_name` WHERE cartId='$item_id' AND Customer_customerId='$user_id'";
        
    $res_city = mysqli_query($con, $delete_city_table_query);
               // Only redirect after completing all tasks
        header("location: cart.php");
    
} else {
    echo "Invalid cart ID.";
}
