<?php
require "includes/common.php";
session_start();
if (!isset($_SESSION['email'])) {
    header('location: index.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Planet Shopify | Online Shopping Site for Men</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Delius+Swash+Caps' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Andika' rel='stylesheet'>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<?php
include 'includes/header_menu.php';
?>
<div class="d-flex justify-content-center">
    <div class="col-md-6 my-5 table-responsive p-5">
        <table class="table table-striped table-bordered table-hover">
            <?php
            $sum = 0;
            $user_id = $_SESSION['Customer_customerId'];

            $query = "SELECT Cart.cartId, Product.MRP AS Price, Product.productId, Product.ProductName AS Name 
                      FROM Cart 
                      JOIN Product ON Cart.item_id = Product.productId 
                      WHERE Cart.Customer_customerId='$user_id' 
                      AND Cart.status='Added to cart'";

            $result = mysqli_query($con, $query);
            
            if ($result) {
                echo "Number of rows: " . mysqli_num_rows($result);
            } else {
                echo "Query error: " . mysqli_error($con);
            }

            if (mysqli_num_rows($result) >= 1) {
                ?>
                <thead>
                    <tr>
                        <th>Item Number</th>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while ($row = mysqli_fetch_array($result)) {
                        $sum += $row["Price"];
                        echo "<tr><td>#".$row["productId"]."</td><td>".$row["Name"]."</td><td>Rs ".$row["Price"]."</td><td><a href='cart-remove.php?cartId={$row['cartId']}' class='remove_item_link'>Remove</a></td></tr>";
                    }
                    echo "<tr><td></td><td>Total</td><td>Rs ".$sum."</td><td><a href='success.php' class='btn btn-primary'>Confirm Order</a></td></tr>";
                    ?>
                </tbody>
                <?php
            } else {
                echo "<div><img src='images/emptycart.png' class='image-fluid' height='150' width='150'></div><br/>";
                echo "<div class='text-bold h5'>Add items to the cart first!</div>";
            }
            ?>
        </table>
    </div>
</div>
<!--footer -->
<?php include 'includes/footer.php' ?>
<!--footer end-->
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
  $('[data-toggle="popover"]').popover();
});
$(document).ready(function() {
  if(window.location.href.indexOf('#login') != -1) {
    $('#login').modal('show');
  }
});
</script>
<?php if (isset($_GET['error'])) {
    $z = $_GET['error'];
    echo "<script type='text/javascript'>
    $(document).ready(function(){
        $('#signup').modal('show');
    });
    </script>";
    echo "<script type='text/javascript'>alert('" . $z . "')</script>";
} ?>
<?php if (isset($_GET['errorl'])) {
    $z = $_GET['errorl'];
    echo "<script type='text/javascript'>
    $(document).ready(function(){
        $('#login').modal('show');
    });
    </script>";
    echo "<script type='text/javascript'>alert('" . $z . "')</script>";
} ?>
</html>
