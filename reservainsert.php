<?php
$h = $_GET['hotel'];
$r = $_GET['regim'];
$t = $_GET['tipus'];
$e = $_GET['entrada'];
$s = $_GET['sortida'];
echo $h//insert into reserva set hotel ="Badia",regim ="SA",tipus ="IND", entrada = "2023,,,",sortida = "2023/12/12"
$cad = 'insert into reserva set hotel="';
$cad = $cad.$h;
$cad = $cad.'",regim ="';
$cad = $cad.$r;
$cad = $cad.'",tipus ="';
$cad = $cad.$t;
$cad = $cad.'", entrada = "';
$cad = $cad.$e;
$cad = $cad.'",sortida = "';
$cad = $cad.$s;
echo $cad;
?>