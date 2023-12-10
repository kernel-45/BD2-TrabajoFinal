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

// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Capturar los valores del formulario
    session_start();
    $idUsuarioBuscado = $_POST['idUsuarioBuscado'];
    $opciones = $_POST['opciones'];

    // Ahora puedes utilizar $idUsuarioBuscado y $opciones en tu lógica de PHP
    // Por ejemplo, puedes procesar los datos o realizar consultas a la base de datos.
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
    <script>
        document.getElementById('formBuscarPedidos').addEventListener('submit', function(e) {
            e.preventDefault(); // Evita el envío normal del formulario

            // Recoger los datos del formulario
            var formData = new FormData(this);

            // Realizar la solicitud AJAX
            fetch('interfaz_controlador_2.php', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('La respuesta de la red no fue ok');
                }
                return response.json();
            })
            .then(data => {
    if (data.success) {
        window.location.href = 'interfaz_controlador_2.php';
    } else {
        alert('Error: ' + data.message);
    }
})
            .catch(error => {
                console.error('Error:', error);
                alert('Hubo un problema al procesar la solicitud: ' + error.message);
            });
        });
    </script>
     </body>
</html>
