<?php

// Capturar el cuerpo de la solicitud
$categoria = $_GET['categoria'];
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "estimazon";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Seleccionas los productos
if ($categoria == "Catálogo") {
    $sql = "SELECT p.nombre as nprod, p.descripcion, p.precio, p.stock, v.nombre, v.apellido1 FROM producto p JOIN vendedor v ON v.idPersona = p.idVendedor";
} else {
    $sql = "SELECT p.nombre as nprod, p.descripcion, p.precio, p.stock, v.nombre, v.apellido1 FROM producto p JOIN vendedor v ON v.idPersona = p.idVendedor AND nombreCategoria = '".$categoria."'";
}

echo $sql;
$result = $conn->query($sql);

// Verificar si hay resultados
if ($result->num_rows > 0) {
    // Obtener todas las filas como arrays asociativos
    $productos = $result->fetch_all(MYSQLI_ASSOC);
} else {
    $productos = array(); // Si no hay resultados, inicializar un array vacío
}

$conn->close();

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <script src="../funciones.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <meta charset="UTF-8">
    <title>Estimazon</title>
</head>

<body>
    <div class="titulo">

        <?php echo strtoupper($categoria); ?>
        <div class="botones">
            <button class="boton" onclick="location.href='perfil.html'">Perfil</button>
            <button class="boton" onclick=resetAllCookies(1)>Cerrar sesión</button>
            <button class="boton" onclick="location.href='cesta/cesta.php'">
                <img src="../carrito.png" alt="Carrito" class="icono-carrito" />Cesta
            </button>
        </div>
    </div>
    <h1 class="derecha">
        
            <button class="boton-volver" onclick="location.href='../estimazon.html'">Volver</button>
       
    </h1>

    <ul>
        <?php foreach ($productos as $producto): ?>
        <li>
            <h3><?php echo $producto['nprod']; ?></h3>
            <p><strong>Descripción:</strong> <?php echo $producto['descripcion']; ?></p>
            <p><strong>Precio:</strong> $<?php echo $producto['precio']; ?></p>
            <p><strong>Stock:</strong> <?php echo $producto['stock']; ?></p>
            <p><strong>Vendedor:</strong> <?php echo $producto['nombre']; ?> <?php echo $producto['apellido1']; ?>
            </p>
            </p>
            <!-- Botón "Añadir al Carrito" -->
            <button onclick=>Añadir al Carrito</button>
        </li>
        <?php endforeach; ?>
    </ul>

    <a href="../estimazon.html" id="volverButton">Volver a la lista de categorías</a>

</body>

</html>