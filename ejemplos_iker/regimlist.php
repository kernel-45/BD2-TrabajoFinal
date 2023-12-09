<?php
$con = mysqli_connect("localhost","root","root","HOTEL",8888) 
    or die("Error localhost");
$db = mysqli_select_db($con,"hotel") 
    or die("Error database");
echo "Funciona";
?>