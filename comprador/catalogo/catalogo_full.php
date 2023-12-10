<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "estimazon-3";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Seleccionas los productos
$sql = "SELECT nombre, descripcion, precio, stock FROM producto";
$result = $conn->query($sql);

// Verificar si hay resultados
if ($result->num_rows > 0) {
    // Obtener todas las filas como arrays asociativos
    $productos = $result->fetch_all(MYSQLI_ASSOC);
} else {
    $productos = array(); // Si no hay resultados, inicializar un array vacío
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../../css/estilos.css">
    <meta charset="UTF-8">
    <title>Estimazon</title>
</head>
<body>
<div class="titulo">
      <div class="botones-ocultos" id="botones-comprador">
        <button class="boton" onclick=resetAllCookies()>Cerrar sesión</button>
        <button class="boton" onclick="location.href='zonas/anyadir_domicilio.html'">Añadir domicilio</button>
        <button class="boton" onclick="location.href='zonas/indicar_entrega.html'">Indicar zona de entrega</button>
        <button class="boton" onclick="location.href='mis_pedidos.html'">Mis pedidos</button>
      </div>
      ESTIMAZON-CATÁLOGO
      <div class="botones">
        <button class="boton" onclick="location.href='inicio-sesion/iniciar_sesion.html'">Identifícate</button>
        <button class="boton">
          <img src="carrito.png" alt="Carrito" class="icono-carrito" />Cesta
        </button>
      </div>
    </div>
    <h1>Estimazon - Catálogo</h1>

    <ul>
        <?php foreach ($productos as $producto): ?>
            <li>
                <h3><?php echo $producto['nombre']; ?></h3>
                <p><strong>Descripción:</strong> <?php echo $producto['descripcion']; ?></p>
                <p><strong>Precio:</strong> $<?php echo $producto['precio']; ?></p>
                <p><strong>Stock:</strong> <?php echo $producto['stock']; ?></p>
                <!-- Botón "Añadir al Carrito" -->
                <button onclick=>Añadir al Carrito</button>
            </li>
        <?php endforeach; ?>
    </ul>

    <a href="estimazon.html">Volver al Inicio</a>

    <?php $conn->close(); ?>
</body>
</html>