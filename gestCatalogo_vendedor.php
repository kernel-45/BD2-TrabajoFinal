<?php

$data = json_decode(file_get_contents('php://input'), true);
$correo = $data['correo'];

$conn = mysqli_connect("localhost", "root", "") or die("Error en la conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("Error en la conexión con la base de datos");

$consultaVendedor = "SELECT idPersona FROM vendedor WHERE correo = '$correo'";
$resultadoVendedor = mysqli_query($conn, $consultaVendedor);
$fila = mysqli_fetch_assoc($resultadoVendedor);
$idVendedor = $fila['idPersona'];

$consultaProductos = "SELECT * FROM producto WHERE idVendedor = '$idVendedor'";
$resultadoProductos = mysqli_query($conn, $consultaProductos);

$productos = array();
while($filaProducto = mysqli_fetch_assoc($resultadoProductos)) {
    array_push($productos, $filaProducto);
}

// Cerrar la conexión
mysqli_close($conn);
,
// Enviar los productos como respuesta en JSON
echo json_encode($productos);
?>
