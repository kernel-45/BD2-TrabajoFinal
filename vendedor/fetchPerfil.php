<?php
// fetchPerfil.php
session_start();

// Asegúrate de que el usuario está logueado
if (!isset($_SESSION['correoUser'])) {
    echo json_encode(['error' => 'Usuario no autenticado']);
    exit;
}

$correo = $_SESSION['correoUser'];

// Conexión a la base de datos
$conn = new mysqli("localhost", "root", "", "estimazon");

// Verificar la conexión
if ($conn->connect_error) {
    die("Error en la conexión: " . $conn->connect_error);
}

// Consulta a la base de datos
$sql = "SELECT nombre, apellido1, apellido2, idPersona, correo, numAvisos FROM vendedores WHERE correo = '$correo'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Enviar los datos del vendedor
    echo json_encode($result->fetch_assoc());
} else {
    // No se encontraron datos
    echo json_encode(['error' => 'No se encontraron datos del vendedor']);
}

$conn->close();
?>
