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
      <form class="miFormulario" method="POST" action="">
    <!-- Etiqueta y campo para un input de ejemplo -->
    <label for="ID del usuario">ID:</label>
    <input type="number" id="idUsuarioBuscado" name="idUsuarioBuscado">

    <!-- Etiqueta y campo de selección -->
    <label for="opciones">Opciones:</label>
    <select id="opciones" name="opciones">
        <option value="opcion1">Ver todos los pedidos</option>
        <option value="opcion2">Ver pedidos con más de 5 días</option>
        <!-- Más opciones según sea necesario -->
    </select>

    <!-- Botón para enviar el formulario -->
    <button type="button" id="miBoton" class="miFormulario-button">Enviar</button>
</form>

<script>
document.addEventListener("DOMContentLoaded", function() {
    // Selecciona el botón por su ID
    var boton = document.getElementById("miBoton");

    // Agrega un controlador de eventos para el clic del botón
    boton.addEventListener("click", function() {
        // Obtiene el valor del campo de entrada
        var idUsuario = document.getElementById("idUsuarioBuscado").value;

        // Utiliza AJAX para enviar el valor al archivo PHP
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "guardar_id.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // La respuesta del servidor puede ser manejada aquí si es necesario
                alert("ID guardado en sesión con éxito.");
            }
        };
        xhr.send("idUsuario=" + idUsuario);
    });
});
document.addEventListener("DOMContentLoaded", function() {
    // Variables de sesión de JavaScript
    var sesionJS = {
        opcionBusqueda: null
    };

    // Selecciona el botón por su ID
    var boton = document.getElementById("miBoton");

    // Agrega un controlador de eventos para el clic del botón
    boton.addEventListener("click", function() {
        // Obtiene el valor de la opción seleccionada
        var opcionSeleccionada = document.getElementById("opciones").value;

        // Guarda la opción en la variable de sesión de JavaScript
        sesionJS.opcionBusqueda = opcionSeleccionada;

        // Puedes realizar alguna acción o mostrar una alerta como confirmación
        alert("Opción guardada en la variable de sesión de JavaScript con éxito.");
    });
});
</script>


</body>
</html>
