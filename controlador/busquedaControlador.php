<?php
// Conectar a la base de datos
// Asegúrate de reemplazar con tus propios detalles de conexión
$conexion = new mysqli('host', 'usuario', 'contraseña', 'nombreBaseDeDatos');

// Verificar la conexión
if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}

$idUser = $_POST['idUser'];
$tipoBusqueda = $_POST['tipoBusqueda'];

// Tu consulta SQL
// Asegúrate de usar declaraciones preparadas para prevenir inyecciones SQL
$sql = "SELECT * FROM tuTabla WHERE idUser = ? AND tipoBusqueda = ?";
$stmt = $conexion->prepare($sql);
$stmt->bind_param("ss", $idUser, $tipoBusqueda);
$stmt->execute();
$result = $stmt->get_result();

// Enviar los resultados de vuelta al cliente
echo json_encode($result->fetch_all(MYSQLI_ASSOC));

$conexion->close();
?>
