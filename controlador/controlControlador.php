<!DOCTYPE html>
<?php
// Crear conexión
$conn = new mysqli("localhost", "root", "", "Estimazon");
include('../comprador/funcionesSeguimiento.php');
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
            <button class="boton" onclick=resetAllCookies(1)>Cerrar sesión</button>
            <button class="boton" id="perfilControlador" onclick="window.location.href='perfilControlador.php'">
                <img src="../vendedor/user.png" alt="User" class="icono-user" />Mi perfil
            </button>
        </div>
  </div>
  <div class="contenedor-principal">
    <div class="subtitulo">Bienvenido, controlador
      <?php echo $id ?>
    </div>
    <div class="subtitulo">De qué usuario quieres consultar pedidos?</div>
    <div class="miFormulario">
      <form id="formBuscarPedidos" action="busquedaControlador.php" method="POST">
        <p>
          <label for="IDUser">ID usuario:</label>
          <input type="number" id="idUser" name="idUser" required>
        </p>
        <p>
          <label for="tipoBusqueda">¿Qué tipo de busqueda deseas realizar?:</label>
          <select id="tipoBusqueda" name="tipoBusqueda" required>
            <option value="">Selecciona busqueda</option>
            <option value="siempre">Todos los pedidos</option>
            <option value="ult5d">Pedidos no llegados en 5 dias</option>
          </select>
        </p>
        <p>
          <input type="submit" value="Realizar búsqueda">


        </p>
      </form>
    </div>
  </div>
  </div>
  </div>

     </body >
</html >