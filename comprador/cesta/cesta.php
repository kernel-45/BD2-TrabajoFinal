<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "estimazon";
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
include('obtener_cesta.php');
session_start();
$categoria = $_GET['categoria'];
if (empty($_SESSION['idUser'])) {
    header('Location: ../../inicio-sesion/iniciar_sesion.html');
} else {
    $id = $_SESSION['idUser'];
}

if (isset($_SESSION['tarjeta'])) {
    $tarjeta = $_SESSION['tarjeta'];
    // Resto del código que utiliza $direccion
} else {
    // La clave 'direccion' no está definida en $_SESSION, le asignamos '' para poder gestionarlo
    $tarjeta = '';
}
if (isset($_SESSION['direccion'])) {
    $direccion = $_SESSION['direccion'];
    // Resto del código que utiliza $direccion
} else {
    // La clave 'direccion' no está definida en $_SESSION, le asignamos '' para poder gestionarlo
    $direccion = '';
}
// Obtienes los productos de la cesta
$productosEnCesta = obtenercesta($id, $conn);
$costoTotal = 0;
?>
<!DOCTYPE html>
<html lang="es">
<head> 
    <link rel="stylesheet" type="text/css" href="../../css/estilos.css">
    <meta charset="UTF-8">
    <title>Estimazon</title>
    <script src="../../funciones.js"></script>
</head>

<body>
    <div class="titulo">
        CESTA
        <?php echo strtoupper($categoria); ?>
        <div class="botones">
            <button class="boton" onclick="resetCookiesAndRedirect()">Cerrar sesión</button>
            <button class="boton" onclick="location.href='../perfil.html'">Perfil</button>
            <button class="boton" onclick="location.href='cesta.php'">
                <img src="../../carrito.png" alt="Carrito" class="icono-carrito" />Cesta
            </button>
        </div>
    </div>
    <script>
        function resetCookiesAndRedirect() {
            resetAllCookies(1);

            // Redirección a la página deseada
            location.href = '../../estimazon.html';
        }
    </script>
    <h1 class="derecha">

        <button class="boton-volver" onclick="location.href='../../estimazon.html'">Volver</button>

    </h1>
    <ul class="cesta" id="listacarrito">

        <?php foreach ($productosEnCesta as $producto): ?>
            <li class="productoc">
                <p><strong>Nombre:</strong>
                    <?php echo $producto['nombre']; ?>
                </p>
                <p><strong>Descripción:</strong>
                    <?php echo $producto['descripcion']; ?>
                </p>
                <p><strong>Precio:</strong> $
                    <?php echo $producto['precio']; ?>
                </p>
                <p><strong>Cantidad:</strong>
                    <?php echo $producto['qtt']; ?>
                </p>
                <?php
                // Sumar el precio de cada producto al costo total
                $costoTotal += $producto['precio'] * $producto['qtt'];
                ?>
                <form action="eliminar_producto.php" method="post">
                    <input type="hidden" name="idProducto" value="<?php echo $producto['idProducto']; ?>">
                    <input type="hidden" name="qtt_actual" value="<?php echo $producto['qtt']; ?>">
                    <input type="text" name="qtt_resta" placeholder="Cantidad">
                    <input type="submit" value="Eliminar producto">
                </form>
            </li>

        <?php endforeach; ?>
    </ul>

    <ul class="resumen" id="resumen">
        <form action="finalizar_compra.php" method="post">

            <p><strong>Dirección seleccionada:</strong>
                <?php
                if (!$direccion == '') {
                    echo "<p><strong>Dirección:</strong> $direccion</p>";
                } else {
                    echo "<p><strong>Aviso:</strong> Debes seleccionar una dirección en tu perfil.</p>";
                }
                ?>
            <p><strong>Tarjeta seleccionada:</strong>
                <?php
                if (!$tarjeta == '') {
                    echo "<p><strong>Tarjeta:</strong> $tarjeta</p>";
                } else {
                    echo "<p><strong>Aviso:</strong> Debes seleccionar una tarjeta en tu perfil.</p>";
                }
                ?>
                <!-- Mostrar el costo total -->
            <p><strong>Costo Total:</strong> $
                <?php echo $costoTotal; ?>
            </p>

            <input type="submit" value="Finalizar compra" class="boton_alargado">
        </form>
        <form action="finalizar_compra.php" method="post">
            <!--   Valor oculto para indicar que se vacía la cesta -->
            <input type="hidden" name="accion" value="vaciarCesta">
            <input type="submit" value="Vaciar cesta">
        </form>

    </ul>


</body>

</html>