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

// Decodificar los datos JSON recibidos
$data = json_decode(file_get_contents('php://input'), true);
$idProducto = isset($data['idProducto']) ? intval($data['idProducto']) : null;

if ($idProducto === null) {
    // Consulta para obtener los productos del vendedor
    $query = "SELECT * FROM producto WHERE idVendedor = $idVendedor";
    $resultado = mysqli_query($conn, $query);
    $productos = [];

    while ($fila = mysqli_fetch_assoc($resultado)) {
        $productos[] = $fila;
    }

    echo json_encode($productos);
    exit;
}

$nombreProducto = mysqli_real_escape_string($conn, $data['nombreProducto'] ?? '');
$precioProducto = isset($data['precioProducto']) ? intval($data['precioProducto']) : null;
$descripcionProducto = isset($data['descripcionProducto']) ? mysqli_real_escape_string($conn, $data['descripcionProducto']) : null;
$stockProducto = isset($data['stockProducto']) ? intval($data['stockProducto']) : null;
$nombreCategoria = isset($data['nombreCategoria']) ? mysqli_real_escape_string($conn, $data['nombreCategoria']) : null;

$query = "SELECT idProducto FROM producto WHERE idVendedor = $idVendedor AND idProducto = $idProducto";
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
    if ($nombreCategoria !== null) {
        $updates[] = "nombreCategoria = '$nombreCategoria'";
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
