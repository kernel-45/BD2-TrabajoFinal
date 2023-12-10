
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <meta charset="UTF-8">
    <title>Subir Producto - Estimazon</title>
</head>
<body>
<?php
session_start(); 
$idVendedor = $_SESSION['idUser'] ?? ''; 
?>
<div class="titulo">
  ESTIMAZON
  <div class="botones">
    <button class="boton" id="perfilVendedor" onclick="window.location.href='perfilVendedor.php'"><img src="user.png" alt="User" class="icono-user" />Mi perfil </button>
  </div>
</div>
    <h1 class="subtitulo">Subir Producto</h1>
    <div class="centrar">
        <div id="formularioSubirProducto">
             <form id="formSubirProducto" action="procesarProducto.php" method="POST">
                <p>
                    <label for="nombreProducto">Nombre del Producto:</label>
                    <input type="text" id="nombreProducto" name="nombreProducto" required>
                </p>
                <p>
                    <label for="precioProducto">Precio:</label>
                    <input type="number" id="precioProducto" name="precioProducto" required>
                </p>
                <p>
                    <label for="descripcionProducto">Descripción:</label>
                    <textarea id="descripcionProducto" name="descripcionProducto" required></textarea>
                </p>
                <p>
                    <label for="stockProducto">Stock:</label>
                    <input type="number" id="stockProducto" name="stockProducto" required>
                </p>
                <p>
                    <label for="nombreCategoria">Categoría:</label>
                    <select id="nombreCategoria" name="nombreCategoria" required>
                        <option value="">Seleccione una categoría</option>
                        <option value="Alimentos">Alimentos</option>
                        <option value="Arte y manualidades">Arte y Manualidades</option>
                        <option value="Artículos para el hogar">Hogar</option>
                        <option value="Electrónica">Electrónica</option>
                        <option value="Instrumentos musicales">Instrumentos Musicales</option>
                        <option value="Juguetes">Juguetes</option>
                        <option value="Libros">Libros</option>
                        <option value="Oficina y papelería">Oficina y Papelería</option>
                    </select>
                </p>
                <p>
                    <input type="submit" value="Subir Producto">
                </p>
            </form>
        </div>
    </div>
    <script>
        document.getElementById('formSubirProducto').addEventListener('submit', function(e) {
            e.preventDefault(); // Evita el envío normal del formulario

            // Recoger los datos del formulario
            var formData = new FormData(this);

            // Realizar la solicitud AJAX
            fetch('procesarProducto.php', {
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
        window.location.href = 'interfaz_vendedor.php';
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
