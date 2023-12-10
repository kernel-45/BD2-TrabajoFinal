<?php
include("direccion.php");

$datos = get_datos(file_get_contents('php://input'));

// Conexión a la base de datos
$conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");

$id_direccion = get_direccion($conn, $datos);
$id_pedido = $_SESSION['idCarrito'];
// supongo que el id del carrito es 1, cuando simó (creo que le tocaba a él)
// tenga lo del carrito cogeré el valor que haya
$update = "UPDATE pedido SET pedido.idZona = ".$id_direccion." WHERE pedido.idPedido = ".$id_pedido;
if (!mysqli_query($conn, $update)) {
    echo json_encode(['success' => false, 'message' => 'Error al actualizar datos: '.mysqli_error($conn)]);
} else {
    // Redirigir a otra página
    echo json_encode(['success' => true]);
}
// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>
