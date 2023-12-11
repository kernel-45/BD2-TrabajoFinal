<?php
session_start(); 
$correoVendedor = $_SESSION['correoUser'] ?? ''; // Obtener el correo del vendedor
$idVendedor = $_SESSION['idUser'] ?? ''; 
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <script src="../funciones.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <meta charset="UTF-8">
    <title>Mis Productos - Estimazon</title>
</head>

<body>

    <div class="titulo">
        ESTIMAZON
        <div class="botones">
            <button class="boton" onclick=resetAllCookies(1)>Cerrar sesión</button>
            <button class="boton" id="perfilVendedor" onclick="window.location.href='perfilVendedor.php'"><img
                    src="user.png" alt="User" class="icono-user" />Mi perfil </button>
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
                                 <p>Stock: ${producto.stock}</p>
                                 <p>Categoria: ${producto.nombreCategoria}</p>`;

                contenedor.appendChild(div);
            });
        }
    });
    </script>
</body>

</html>