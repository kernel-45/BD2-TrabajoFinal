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

$idPersonaBusqueda = intval($conn, $_POST['nombreProducto'] ?? 0);
$tipoBusqueda = mysqli_real_escape_string($conn, $_POST['nombreCategoria'] ?? '');

if (empty($nombreProducto) || empty($descripcionProducto) || $precioProducto <= 0 || $stockProducto <= 0 || empty($nombreCategoria)) {
    echo json_encode(["success" => false, "message" => "Por favor, completa todos los campos correctamente."]);
    exit;
}

$query = "SELECT idProducto, stock FROM producto WHERE idVendedor = $idVendedor AND nombre = '$nombreProducto'";
$resultado = mysqli_query($conn, $query);

if (mysqli_num_rows($resultado) > 0) {
    // insertar producto existente
    $fila = mysqli_fetch_assoc($resultado);
    $nuevoStock = $fila['stock'] + $stockProducto;
    $updateQuery = "UPDATE producto SET stock = $nuevoStock WHERE idProducto = ".$fila['idProducto'];
    if (!mysqli_query($conn, $updateQuery)) {
        echo json_encode(["success" => false, "message" => "Error al actualizar el stock: " . mysqli_error($conn)]);
    } else {
        echo json_encode(["success" => true, "message" => "Stock actualizado con éxito"]);
    }
} else {
    // nuevo producto
    $insertQuery = "INSERT INTO producto (nombre, precio, descripcion, stock, idVendedor, nombreCategoria) VALUES ('$nombreProducto', $precioProducto, '$descripcionProducto', $stockProducto, $idVendedor, '$nombreCategoria')";
    if (!mysqli_query($conn, $insertQuery)) {
        echo json_encode(["success" => false, "message" => "Error al insertar el producto: " . mysqli_error($conn)]);
    } else {
        echo json_encode(["success" => true, "message" => "Producto insertado con éxito"]);
    }
}

mysqli_close($conn);
exit;
?>
