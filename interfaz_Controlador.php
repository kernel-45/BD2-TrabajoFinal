<!DOCTYPE html>
<?php
// Crear conexión
$conn = new mysqli("localhost", "root", "", "Estimazon");
include ('funcionesSeguimiento.php');
session_start(); 
$id = $_SESSION['idUser']; 
// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
<html>
<head>
    <title>Seguimiento del pedido</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <link rel="stylesheet" type="text/css" href="css/estilosControlador.css">
</head>
<body>
    <div class="titulo">
      ESTIMAZON
      <div class="botones">
        <button class="boton">
          <img src="carrito.png" alt="Carrito" class="icono-carrito" />Cesta
        </button>
      </div>
    </div>
    <div class="contenedor-principal">
      <div class="subtitulo">Bienvenido, controlador <?php echo $id ?></div>
      <div class="subtitulo">De qué usuario quieres consultar productos?</div>
    <!-- Más elementos aquí -->
    </div>
</body>
</html>