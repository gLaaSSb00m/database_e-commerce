<?php
$con=mysqli_connect("localhost","root","","shopeease");
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
