<?php
session_start(); 
$correoVendedor = $_SESSION['correoUser'] ?? ''; // Obtener el correo del vendedor
$idVendedor = $_SESSION['idUser'] ?? ''; 
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <meta charset="UTF-8">
    <title>Mis Productos - Estimazon</title>
</head>
<body>

    <div class="titulo">
      ESTIMAZON
      <div class="botones">
        <button class="boton" id="perfilVendedor" onclick="window.location.href='perfilVendedor.php'"><img src="user.png" alt="User" class="icono-user" />Mi perfil </button>
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
                                 <p>Categoria: ${producto.nombreCategoria}</p>
                                 <button onclick="eliminarProducto(${producto.idProducto})">Eliminar</button>`;
                contenedor.appendChild(div);
            });
        }
        function eliminarProducto(idProducto) {
            console.log("Eliminar producto con ID:", idProducto);
            fetch('eliminarProducto.php', {
                method: 'POST',
                headers: {
                'Content-Type': 'application/json',
                 },
                 body: JSON.stringify({ idProducto })
             })
              .then(response => {
                 if (!response.ok) {
                     throw new Error('Error en la respuesta del servidor');
                 }
                 return response.json();
                })
             .then(data => {
                 if(data.success) {
                    window.location.href = 'interfaz_vendedor.php';
                 } else {
                      alert('No se pudo eliminar el producto: ' + data.message);
                 }
              })
            .catch(error => {
                console.error('Error:', error);
             });
        }
    });
    </script>
</body>
</html>
