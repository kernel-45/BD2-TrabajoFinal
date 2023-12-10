<?php
$data = json_decode(file_get_contents('php://input'), true);
$datos = array(
    "tarjeta" => $data["tjc"],
    "fecha" => $data["fcad"],
    "cvc" => $data["cvc"]
);
$datos = array_values($datos);

// Conexión a la base de datos
$conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");

session_start();
$id_comprador = $_SESSION['idUser'];

// INSERT IGNORE intenta insertar, si se encuentra claves duplicadas no salta un error, simplemente no hace nada
$insert = "INSERT INTO tarjetacredito (numTarjeta, CVC, fechaCad) VALUES (".$datos['tarjeta'].", ".$datos['cvc'].", ".$datos['fecha'].")";
try {
    if (!mysqli_query($conn, $insert)) {
        throw new mysqli_sql_exception(mysqli_error($conn));
    } else {
        echo json_encode(['success' => true]);
    }
} catch (mysqli_sql_exception $e) {
    // Verificar si el código de error es específico de llave duplicada
    if ($e->getCode() != 1062) {
        echo json_encode(['success' => false, 'message' => 'Error al actualizar datos: ' . $e->getMessage()]);
    } else {
        echo json_encode(['success' => false, 'message' => 'El domicilio que se ha intentado añadir ya está en la base de datos.']);
    }
}
// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>
