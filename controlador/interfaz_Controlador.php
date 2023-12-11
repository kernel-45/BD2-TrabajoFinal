<!DOCTYPE html>
<?php
// Crear conexión
$conn = new mysqli("localhost", "root", "", "Estimazon");
session_start();
$id = $_SESSION['idUser'];
// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
<html>

<head>
     <script src="../funciones.js"></script>
    <title>Seguimiento del pedido</title>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <link rel="stylesheet" type="text/css" href="../css/estilosControlador.css">
    
</head>

<body>
    <div class="titulo">
        ESTIMAZON
        <div class="botones">
            <button class="boton" onclick=resetAllCookies(1)>Cerrar sesión</button>
            <button class="boton" id="perfilControlador" onclick="window.location.href='perfilControlador.php'">
                <img src="../vendedor/user.png" alt="User" class="icono-user" />Mi perfil
            </button>
        </div>
    </div>
    <div class="contenedor-principal">
        <div class="subtitulo">Bienvenido, controlador
            <?php echo $id ?>
        </div>
        <div class="subtitulo">Qué quieres hacer?</div>
        <div class="contenedor-botones">
            <a href="controlControlador.php" class="boton">Controlar a los vendedores</a>
            <a href="asignarEmpresa.php" class="boton">Asignar empresa distribuidora</a>
        </div>
    </div>


</body>

</html>