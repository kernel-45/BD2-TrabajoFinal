<?php

session_start();

// Verificar si el usuario está autenticado
if (!isset($_SESSION['idUser'])) {
    echo json_encode(['success' => false, 'message' => 'Usuario no autenticado.']);
    exit;
}

// Conexión a la base de datos
$conn = mysqli_connect("localhost", "root", "") or die("error a conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexión con la base de datos");

// Eliminar el usuario de la tabla correspondiente (reemplaza "comprador" con el tipo adecuado)
$deleteQuery = "DELETE FROM ".$_SESSION['tipoUser']." WHERE idPersona = ".$_SESSION['idUser'];
$result = mysqli_query($conn, $deleteQuery); // ------------------------------------------------ codigo no funcional porque tengo que eliminar todas las claves foraneas que apuntan a él

if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Error al eliminar el usuario: ' . mysqli_error($conn)]);
    exit;
}

// Cerrar la sesión y la conexión a la base de datos
session_destroy();
mysqli_close($conn);

echo json_encode(['success' => true, 'message' => 'Usuario eliminado correctamente.']);//*/
?>
