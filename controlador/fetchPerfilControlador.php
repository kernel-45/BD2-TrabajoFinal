<?php

$correo = isset($_GET['correo']) ? $_GET['correo'] : '';


$conn = mysqli_connect("localhost", "root", "", "estimazon") or die("Error en la conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("Error en la conexión con la base de datos");

$consulta = "SELECT nombre, apellido1, apellido2, idPersona, correo FROM controlador WHERE correo = '$correo'";
$resultado = mysqli_query($conn, $consulta);

if ($filaPerfil = mysqli_fetch_assoc($resultado)) {
    echo json_encode($filaPerfil);
} else {
    echo json_encode(['error' => 'No se encontraron datos para el vendedor']);
}

mysqli_close($conn);
?>
