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
              

    <!-- Más elementos aquí -->
    </div>
</body>
<script>function enviarFormulario(formulario) {
    // Obtener los valores del formulario
    const formData = new FormData(formulario);

    // Realizar la solicitud AJAX
    fetch(formulario.action, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(Object.fromEntries(formData)),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // Manejar la respuesta del servidor aquí
        if (data.success) {
            // Redirigir o realizar otras acciones según sea necesario
            alert('Operación exitosa');
            window.location.href = 'busquedaControlador.php';
        } else {
            alert('Error al enviar el formulario: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Hubo un problema al procesar la solicitud. Por favor, inténtalo de nuevo más tarde.!!!!!');
    });
}
</script>
</html>
