<?php

$data = json_decode(file_get_contents('php://input'), true);
$correo = $data['correo'];

$conn = mysqli_connect("localhost", "root", "") or die("Error en la conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("Error en la conexión con la base de datos");

$consulta = "SELECT nombre, apellido1, apellido2, idPersona, correo, numAvisos FROM vendedores WHERE correo = '$correo'";
$resultado = mysqli_query($conn, $consulta);

$atributos = array();
while($filaPerfil = mysqli_fetch_assoc($resultado)) {
    array_push($atributos, $filaPerfil);
}

// Cerrar la conexión
mysqli_close($conn);
echo json_encode($atributos);
?>
