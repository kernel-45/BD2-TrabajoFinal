<?php
session_start();
$idVendedor = isset($_SESSION['idUser']) ? intval($_SESSION['idUser']) : 0;
$conn = mysqli_connect("localhost", "root", "", "estimazon");
if (!$conn) {
    echo json_encode(["success" => false, "message" => "Error en la conexión a la base de datos"]);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);
$idProducto = $data['idProducto'] ?? 0;
echo "Recibido ID de producto para eliminar: " . $idProducto;

if ($idProducto > 0) {
    $query = "DELETE FROM producto WHERE idProducto = $idProducto";
    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => true, "message" => "Producto eliminado"]);
    } else {
        echo json_encode(["success" => false, "message" => "Error al eliminar el producto"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "ID del producto no válido"]);
}

mysqli_close($conn);
?>
