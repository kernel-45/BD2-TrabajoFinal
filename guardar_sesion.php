<?php

// Obtener datos del cuerpo de la solicitud
$data = json_decode(file_get_contents('php://input'), true);
$correo = $data['correo'];
$contraseña = $data['contrasenya'];
$tipo = $data['tipo'];

if ($tipo != "vendedor" && $tipo != "comprador" && $tipo != "controlador") {
    echo json_encode(['success' => false, 'message' => 'Tipo de usuario no válido.']);
    exit;
}

// Conexión a la base de datos
$conn = mysqli_connect("localhost", "root", "") or die("error a conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexión con la base de datos");

$consulta = "SELECT " . $tipo . ".idPersona, " . $tipo . ".contraseña FROM " . $tipo . " WHERE " . $tipo . ".correo = '$correo'";

$result = mysqli_query($conn, $consulta);


if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Error en la consulta: ' . mysqli_error($conn)]);
    exit;
}
mysqli_close($conn);
$fila = mysqli_fetch_array($result);

if (!$fila) {
    echo json_encode(['success' => false, 'message' => 'No se encontró ningún usuario con ese correo electrónico y tipo.']);
    exit;
}

if ($fila['contraseña'] != $contraseña) {
    echo json_encode(['success' => false, 'message' => 'Contraseña incorrecta.']);
    exit;
}

// Iniciar sesión
session_start();
$_SESSION['idUser'] = $fila['idPersona'];
$_SESSION['tipoUser'] = $tipo;

if ($tipo == "vendedor") {
    $_SESSION['correoVendedor'] = $correo;
}
// session_write_close() <----------------------- si lo descomento da error
// Enviar respuesta al cliente

echo json_encode(['success' => true]);
?>
