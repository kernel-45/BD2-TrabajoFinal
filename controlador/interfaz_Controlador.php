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
  </div>
  <div class="contenedor-principal">
    <div class="subtitulo">Bienvenido, controlador
      <?php echo $id ?>
    </div>
    <div class="subtitulo">De qué usuario quieres consultar productos?</div>
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
  <script>
    document.getElementById('formBuscarPedidos').addEventListener('submit', function (event) {
      event.preventDefault();

      var idUser = document.getElementById('idUser').value;
      var tipoBusqueda = document.getElementById('tipoBusqueda').value;

      fetch('busquedaControlador.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'idUser=' + idUser + '&tipoBusqueda=' + tipoBusqueda
      })
        .then(response => response.json())
        .then(data => {
          console.log(data); // Aquí manejas los datos devueltos por el servidor
        })
        // .catch(error => console.error('Error:', error));
    });
    </script>
     </body >
</html >