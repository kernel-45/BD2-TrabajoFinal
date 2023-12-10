<?php
$data = json_decode(file_get_contents('php://input'), true);
$datos = array(
    "tarjeta" => $data["tjc"],
    "fecha" => $data["fcad"],
    "cvc" => $data["cvc"]
);
$insert = "INSERT INTO tarjetacredito (numTarjeta, CVC, fechaCad) VALUES (".$datos['tarjeta'].", ".$datos['cvc'].", ".$datos['fecha'].")";
// Conexión a la base de datos

$conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");
try {
    if (!mysqli_query($conn, $insert)) {
        throw new mysqli_sql_exception(mysqli_error($conn));
    }
    session_start();
    $id_comprador = $_SESSION['idUser'];
    $insert = "INSERT INTO r_comprador_tarjetadecredito (idComprador, numTarjeta) VALUES (".$id_comprador.", ".$datos['tarjeta'].")";
    if (!mysqli_query($conn, $insert)) {
        echo json_encode(['success' => false, 'message' => 'Error al insertar datos: ' . mysqli_error($conn)]);
    } else {
        echo json_encode(['success' => true]);
    }
} catch (mysqli_sql_exception $e) {
    // Verificar si el código de error es específico de llave duplicada
    if ($e->getCode() != 1062) {
        echo json_encode(['success' => false, 'message' => 'Error al insertar datos: ' . $e->getMessage()]);
    } else {
        echo json_encode(['success' => false, 'message' => 'La tarjeta que se ha intentado añadir ya está en la base de datos.']);
    }
}
// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>