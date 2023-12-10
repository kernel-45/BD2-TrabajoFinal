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
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <link rel="stylesheet" type="text/css" href="../css/estilosSeguimiento.css">
</head>
<body>
    <div class="titulo">
      ESTIMAZON
      <div class="botones">
        <button class="boton">
          <img src="carrito.png" alt="Carrito" class="../icono-carrito" />Cesta
        </button>
      </div>
    </div>
    <div class="contenedor-principal">
      <div class="subtitulo">Bienvenido al seguimiento de tus pedidos</div>
      <?php
            $result = obtenerPedidos($id, $conn);
            if ($result->num_rows > 0) {
              // Procesar cada fila de resultado
              while ($row = mysqli_fetch_array($result)) {
                  // Acceder a los atributos individuales
                  $idPedido = $row["idPedido"];
                  $estado = $row["estado"];
                  $nombre = $row["nombre"];
                  $descripcion = $row["descripcion"];
                
                  // Hacer algo con estos datos
                  echo "<div class=subtitulo>"; 
                  echo "<div class='pedido'>"; 
                  echo "<div class='estado-pedido'>$estado</div>"; 
                  echo "<div class='id-pedido'>$idPedido</div>"; 
                  echo "<div class='nombre-producto'>$nombre</div>"; 
                  echo "<div class='descripcion-producto'>$descripcion</div>"; 
                  echo "</div>";
                  echo "</div>"; 
              }
          } else {
              echo "<div class='subtituloS'>"; 
              echo "<br><br><br><br>No has hecho ningún pedido todavía. <br><br> 
                    Cuando empieces a pedir productos de Estimazon tus productos aparecerán aquí";
              echo "</div>"; 
          }
          ?>  
    <!-- Más elementos aquí -->
    </div>
</body>
</html>
