<?php
require "includes/common.php";
session_start();

if (!isset($_SESSION['Customer_customerId'])) {
    // echo "User not logged in.";
    exit();
}

// // Debugging: Output session and GET variables
// echo "Session Customer ID: " . $_SESSION['Customer_customerId'] . "<br>";
// echo "Full URL: " . $_SERVER['REQUEST_URI'] . "<br>";

if (isset($_GET['cartId'])) {
    // echo "GET cartId: " . $_GET['cartId'] . "<br>";
}

// Check if cartId is set and is numeric
if (isset($_GET['cartId']) && is_numeric($_GET['cartId'])) {
    $item_id = $_GET["cartId"];
    $user_id = $_SESSION['Customer_customerId'];

    // Debugging: Verify values before query
    // echo "Deleting cartId: " . $item_id . " for userId: " . $user_id . "<br>";

    // Delete the rows from Cart table where cartId and Customer_customerId match
    $query = "DELETE FROM Cart WHERE cartId='$item_id' AND Customer_customerId='$user_id'";
    $res = mysqli_query($con, $query);

    if ($res) {
        header("location: cart.php");
    } else {
        // echo "Error: " . mysqli_error($con);
    }
} else {
    echo "Invalid cart ID.";
}
?>
