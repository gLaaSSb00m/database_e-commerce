<?php
// Start the session at the beginning of the script
// session_start();

// Function to check if the product is added to cart
function check_if_added_to_cart($item_id) {
    // Check if session variable is set
    if (isset($_SESSION['Customer_customerId'])) {
        $user_id = $_SESSION['Customer_customerId'];
    } else {
        // Handle the case where the session variable is not set
        return 0; // or you can handle this according to your application logic
    }

    // Include the common.php file
    require("common.php");

    // Query to check if the item is added to cart
    $query = "SELECT * FROM Cart WHERE item_id='$item_id' AND Customer_customerId='$user_id' AND status='Added to cart'";
    $result = mysqli_query($con, $query);

    // Return the result based on the query
    if (mysqli_num_rows($result) >= 1) {
        return 1;
    } else {
        return 0;
    }
}
?>
