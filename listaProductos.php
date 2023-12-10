<?php
session_start(); 
$correoVendedor = $_SESSION['correoVendedor'] ?? ''; // Obtener el correo del vendedor
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <meta charset="UTF-8">
    <title>Mis Productos - Estimazon</title>
</head>
<body>

    session_start(); 
    $idVendedor = $_SESSION['idUser'] ?? ''; 
    ?>
    <div class="titulo">
      ESTIMAZON
      <div class="botones">
        <button class="boton">Hola, vendedor <?php echo $idVendedor; ?></button>
      </div>
    </div>
    <h1 class="subtitulo">Mis Productos</h1>
    <div id="listaProductos"></div>

    <script>
    const correoVendedor = '<?php echo $correoVendedor; ?>';
    document.addEventListener('DOMContentLoaded', (event) => {
        fetch('gestCatalogo_vendedor.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                correo: correoVendedor
            }),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            mostrarProductos(data);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Hubo un problema al obtener los productos: ' + error.message);
        });

        function mostrarProductos(productos) {
            const contenedor = document.getElementById('listaProductos');
            contenedor.innerHTML = '';

            productos.forEach(producto => {
                const div = document.createElement('div');
                div.classList.add('producto');
                div.innerHTML = `<h3>${producto.nombre}</h3>
                                 <p>Precio: ${producto.precio}</p>
                                 <p>Descripción: ${producto.descripcion}</p>
                                 <p>Stock: ${producto.stock}</p>`;
                contenedor.appendChild(div);
            });
        }
    });
    </script>
</body>
</html>
