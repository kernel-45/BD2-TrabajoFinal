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
    <link rel="stylesheet" type="text/css" href="css/estilosSeguimiento.css">
    <?php
    include 'funcionesSeguimiento.php';
    $id = $_SESSION['idUser']; 
    ?>
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
      <?php
            $result = obtenerPedidos($id, $conn);
            if ($result->num_rows > 0) {
              // Procesar cada fila de resultado
              while ($row = $result->fetch_assoc()) {
                  // Acceder a los atributos individuales
                  $idPedido = $row["idPedido"];
                  $estado = $row["estado"];
                  $nombre = $row["nombre"];
                  $descripcion = $row["descripcion"];
          
                  // Hacer algo con estos datos
                  echo "<div class='pedido'>"; 
                  echo "<div class='estado-pedido'>'$estado'</div>"; 
                  echo "<div class='id-pedido'>'$idPedido'</div>"; 
                  echo "<div class='nombre-produco'>'$nombre'</div>"; 
                  echo "<div class='descripcion-producto'>'$descripcion'</div>"; 
                  echo "</div>"; 
              }
          } else {
              echo "<div class='pedido'>"; 
              echo "No has hecho ningún pedido todavía";
              echo "</div>"; 
          }
          ?>  
    <!-- Más elementos aquí -->
    </div>
</body>
</html>
