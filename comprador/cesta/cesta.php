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
$costoTotal = 0;
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
    CESTA
    <div class="botones">
        <div id="botones-comprador" style="display: inline-block;">
          <button class="boton" onclick=resetAllCookies(0)> Cerrar sesión</button>
          <button class="boton" onclick="location.href='comprador/perfil.html'">Perfil</button>
        </div>
      <div class="botones" id="botones-usuario" style="margin-right: 100px;">
          <button class="boton" onclick="location.href='inicio-sesion/iniciar_sesion.html'">Identifícate</button>
        </div>
        <button class="boton" onclick="location.href='cesta.php'">
          <img src="../../carrito.png" alt="Carrito" class="icono-carrito" />Cesta
        </button>
      </div>
      </div>
    </div>
    <h1>Cesta</h1>
    <ul class="cesta" id="listacarrito">
        
        <?php foreach ($productosEnCesta as $producto): ?>
            <li class="productoc"   >
                <p><strong>Nombre:</strong> <?php echo $producto['nombre']; ?></p>
                <p><strong>Descripción:</strong> <?php echo $producto['descripcion']; ?></p>
                <p><strong>Precio:</strong> $<?php echo $producto['precio']; ?></p>
                <p><strong>Cantidad:</strong> <?php echo $producto['qtt']; ?></p>
                <?php
                // Sumar el precio de cada producto al costo total
                $costoTotal += $producto['precio'] * $producto['qtt'];
                ?>
            </li>
            
        <?php endforeach; ?>
        </ul>



</body>
</html>