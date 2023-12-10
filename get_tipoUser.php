<?php
session_start();
echo isset($_SESSION['tipoUser']) ? $_SESSION['tipoUser'] : '';
?>
