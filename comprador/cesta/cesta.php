<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "estimazon";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
include ('obtener_cesta.php');
session_start(); 
$id = $_SESSION['idUser']; 
// Obtienes los productos de la cesta
$productosEnCesta = obtenercesta($id, $conn);
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
    <div class="botones" id="botones-comprador">
        <button class="boton" onclick=resetAllCookies()>Cerrar sesión</button>
        <button class="boton" onclick="location.href='../perfil.html'">Perfil</button>
    </div>
      CESTA
      <div class="botones">
        <button class="boton" onclick="location.href='../../inicio-sesion/iniciar_sesion.html'">Identifícate</button>
        <button class="boton">
          <img src="../../carrito.png" alt="Carrito" class="icono-carrito" />Cesta
        </button>
      </div>
    </div>
    <h1>Cesta</h1>
    <ul class="propiedadesproducto" id="listacarrito">
        <?php foreach ($productosEnCesta as $producto): ?>
            <li>
                <h3><?php echo $producto['idPedido']; ?></h3>
                <p><strong>Stock:</strong> <?php echo $producto['nombre']; ?></p>
                <p><strong>Descripción:</strong> <?php echo $producto['descripcion']; ?></p>
                <p><strong>Precio:</strong> $<?php echo $producto['precio']; ?></p>
                <p><strong>Cantidad:</strong> <?php echo $producto['qtt']; ?></p>
            </li>
        <?php endforeach; ?>
        </ul>



</body>
</html>