<?php
$data = json_decode(file_get_contents('php://input'), true); // decodifica lo introducido en el formulario
$datos = array( // crea un array
    "tarjeta" => $data["tjc"],
    "fecha" => $data["fcad"],
    "cvc" => $data["cvc"]
);

// Conexión a la base de datos
$conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");

$insert = // crea el insert
"INSERT INTO tarjetacredito (numTarjeta, CVC, fechaCad) VALUES
    (".$datos['tarjeta'].", ".$datos['cvc'].", ".$datos['fecha'].")";
try {
    if (!mysqli_query($conn, $insert)) { // si error
        throw new mysqli_sql_exception(mysqli_error($conn));
    }
} catch (mysqli_sql_exception $e) {
    // Verificar si el código de error es específico de llave duplicada
    if ($e->getCode() != 1062) {
        echo json_encode(['success' => false, 'message' => 'Error al insertar datos: ' . $e->getMessage()]);
        exit;
    } // si la tarjeta está duplicada no da error, solo se asigna al usuario
}

session_start(); // si no ha habido error coge el didentificador del usuario y añade la tarjeta
$id_comprador = $_SESSION['idUser'];
$insert =
"INSERT INTO r_comprador_tarjetadecredito (idComprador, numTarjeta)
    VALUES (".$id_comprador.", ".$datos['tarjeta'].")";
if (!mysqli_query($conn, $insert)) { // si error
    echo json_encode(['success' => false, 'message' => 'Error al insertar datos: ' . mysqli_error($conn)]);
} else {
    $_SESSION['tarjeta'] = $datos['tarjeta']
    echo json_encode(['success' => true]);
}
// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>
