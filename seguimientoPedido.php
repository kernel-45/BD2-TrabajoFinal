<!DOCTYPE html>
<?php
// Crear conexión
$conn = new mysqli("localhost", "root", "", "Estimazon");

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
<html>
<head>
    <title>Seguimiento del pedido</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <link rel="stylesheet" type="text/css" href="css/estilosSeguimiento.css">

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
      <div class="subtitulo">Bienvenido al seguimiento de tus pedidos</div>
        <div class="pedido">
          <div class="estado-pedido">en proceso</div>
          <div class="id-pedido">2131</div>
          <div class="nombre-producto">pepino</div>
          <div class="descripcion-producto">delicioso pepino rebozado en nutella</div>
        </div>
    <!-- Más elementos aquí -->
    </div>
</body>
</html>
