<!DOCTYPE html>
<html lang="es">

<head>
    <script src="../funciones.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <meta charset="UTF-8">
    <title>Modificar Producto - Estimazon</title>
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
    <h1 class="subtitulo">Modificar producto</h1>


    <div class="container">
        <div class="seleccion-y-detalles">
            <select id="seleccionProducto">
                <option value="">Seleccione un producto</option>
            </select>
            <div id="detalleProducto">
                <p>Producto: <input type="text" value="" id="nombreProducto"></p>
                <p>Precio: <input type="number" value="" id="precioProducto"></p>
                <p>Descripción: <textarea id="descripcionProducto"></textarea></p>
                <p>Stock: <input type="number" value="" id="stockProducto"></p>
                <p>Categoria: <input type="text" value="" id="nombreCategoria"></p>
                <button onclick="actualizarProducto()">Actualizar</button>
            </div>
        </div>
    </div>
    <script>
    document.addEventListener('DOMContentLoaded', (event) => {
        // Obtener los productos del servidor
        fetch('updateProducto.php')
            .then(response => response.json())
            .then(productos => {
                const selectProducto = document.getElementById('seleccionProducto');
                selectProducto.innerHTML = productos.map(producto =>
                    `<option value="${producto.idProducto}">${producto.nombre}</option>`
                ).join('');

                if (productos.length > 0) {
                    mostrarDetalleProducto(productos[0]);
                    selectProducto.value = productos[0].idProducto;
                }

                selectProducto.onchange = () => {
                    const productoSeleccionado = productos.find(p => p.idProducto == selectProducto
                        .value);
                    if (productoSeleccionado) {
                        mostrarDetalleProducto(productoSeleccionado);
                    }
                };
            })
            .catch(error => console.error('Error:', error));
    });

    function mostrarDetalleProducto(producto) {
        document.getElementById('nombreProducto').value = producto.nombre;
        document.getElementById('precioProducto').value = producto.precio;
        document.getElementById('descripcionProducto').value = producto.descripcion;
        document.getElementById('stockProducto').value = producto.stock;
        document.getElementById('nombreCategoria').value = producto.nombreCategoria;
    }

    function actualizarProducto() {
        const idProducto = document.getElementById('seleccionProducto').value;
        const nombreProducto = document.getElementById('nombreProducto').value;
        const precioProducto = document.getElementById('precioProducto').value;
        const descripcionProducto = document.getElementById('descripcionProducto').value;
        const stockProducto = document.getElementById('stockProducto').value;
        const nombreCategoria = document.getElementById('nombreCategoria').value;

        fetch('updateProducto.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    idProducto,
                    nombreProducto,
                    precioProducto,
                    descripcionProducto,
                    stockProducto,
                    nombreCategoria
                }),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Producto actualizado con éxito');
                } else {
                    alert('Error al actualizar el producto: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Hubo un problema al actualizar el producto: ' + error.message);
            });
    }
    </script>
</body>

</html>