<!DOCTYPE html>
<?php
// Crear conexión
$conn = new mysqli("localhost", "root", "", "Estimazon");
include ('../comprador/funcionesSeguimiento.php');
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
    <link rel="stylesheet" type="text/css" href="../css/estilosControlador.css">
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
      <div class="subtitulo">Bienvenido, controlador <?php echo $id ?></div>
      <div class="subtitulo">De qué usuario quieres consultar productos?</div>
              <form class="miFormulario">
            <!-- Etiqueta y campo para un input de ejemplo -->
            <label for="ID del usuario">ID:</label>
            <input type="number" id="idUsuarioBuscado" name="isUsuarioBuscado">

            <!-- Etiqueta y campo de selección -->
            <label for="opciones">Opciones:</label>
            <select id="opciones" name="opciones">
                <option value="opcion1">Ver todos los pedidos</option>
                <option value="opcion2">Ver pedidos con mas de 5 dias</option>
                <!-- Más opciones según sea necesario -->
            </select>

            <!-- Botón para enviar el formulario -->
            <button type="submit" class="miFormulario-button">Enviar</button>
        </form>

    <!-- Más elementos aquí -->
    </div>
</body>
</html>