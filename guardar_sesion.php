<?php

// Obtener datos del cuerpo de la solicitud
$data = json_decode(file_get_contents('php://input'), true);
$correo = $data['correo'];
$contraseña = $data['contraseña'];
$tipo = $data['tipo'];

if ($tipo != "vendedor" && $tipo != "comprador" && $tipo != "controlador") {
    echo json_encode(['success' => false, 'message' => 'Tipo de usuario no válido.']);
}

// Conexión a la base de datos
$conn = mysqli_connect("localhost", "root", "") or die("error a conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexión con la base de datos");
$consulta = "SELECT " . $tipo . ".idPersona, " . $tipo . ".contraseña FROM " . $tipo . " WHERE " . $tipo . ".correo = '$correo'";
$result = mysqli_query($conn, $consulta);
echo json_encode(['success' => false, 'message' => $consulta]);
/*
if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Error en la consulta: ' . mysqli_error($conn)]);
}

$fila = mysqli_fetch_array($result);

if (!$fila) {
    echo json_encode(['success' => false, 'message' => 'No se encontró ningún usuario con ese correo electrónico y tipo.']);
}

if ($fila[$tipo . '.contraseña'] != $contraseña) {
    echo json_encode(['success' => false, 'message' => 'Contraseña incorrecta.']);
}

// Iniciar sesión
session_start();
$_SESSION['idUser'] = $fila[$tipo . '.idPersona'];
$_SESSION['tipoUser'] = $tipo;
session_write_close()
// Enviar respuesta al cliente
echo json_encode(['success' => true]);
mysqli_close($conn);//*/
?>
