<?php
session_start();
$idVendedor = isset($_SESSION['idUser']) ? intval($_SESSION['idUser']) : 0;
if ($idVendedor <= 0) {
    echo json_encode(["success" => false, "message" => "Error: Vendedor no identificado."]);
    exit;
}

$conn = mysqli_connect("localhost", "root", "", "estimazon");
if (!$conn) {
    echo json_encode(["success" => false, "message" => "Error en la conexión: " . mysqli_connect_error()]);
    exit;
}

$nombreProducto = mysqli_real_escape_string($conn, $_POST['nombreProducto'] ?? '');
$precioProducto = isset($_POST['precioProducto']) ? intval($_POST['precioProducto']) : null;
$descripcionProducto = isset($_POST['descripcionProducto']) ? mysqli_real_escape_string($conn, $_POST['descripcionProducto']) : null;
$stockProducto = isset($_POST['stockProducto']) ? intval($_POST['stockProducto']) : null;

if (empty($nombreProducto)) {
    echo json_encode(["success" => false, "message" => "Por favor, proporciona el nombre del producto."]);
    exit;
}

$query = "SELECT idProducto FROM producto WHERE idVendedor = $idVendedor AND nombre = '$nombreProducto'";
$resultado = mysqli_query($conn, $query);

if (mysqli_num_rows($resultado) > 0) {
    $fila = mysqli_fetch_assoc($resultado);
    $updates = [];
    
    if ($descripcionProducto !== null) {
        $updates[] = "descripcion = '$descripcionProducto'";
    }
    if ($precioProducto !== null) {
        $updates[] = "precio = $precioProducto";
    }
    if ($stockProducto !== null) {
        $updates[] = "stock = $stockProducto";
    }

    if (count($updates) > 0) {
        $updateQuery = "UPDATE producto SET " . implode(', ', $updates) . " WHERE idProducto = " . $fila['idProducto'];

        if (!mysqli_query($conn, $updateQuery)) {
            echo json_encode(["success" => false, "message" => "Error al actualizar el producto: " . mysqli_error($conn)]);
        } else {
            echo json_encode(["success" => true, "message" => "Producto actualizado con éxito"]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "No hay datos para actualizar"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Producto no encontrado o no pertenece al vendedor"]);
}

mysqli_close($conn);
exit;
?>
