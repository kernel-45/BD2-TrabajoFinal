<!DOCTYPE html>
<html lang="es">

<head>
    <script src="../funciones.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css" />
    <meta charset="UTF-8" />
    <title>Estimazon - Mi perfil</title>
</head>

<body>
    <?php
    session_start();
    $idControlador = $_SESSION['idUser'] ?? ''; 
    $correoControlador = $_SESSION['correoUser'] ?? ''; 
    
    ?>
    <div class="titulo">
        ESTIMAZON
        <div class="botones">
            <button class="boton" onclick=resetAllCookies(1)>Cerrar sesión</button>
            <button class="boton" id="perfil" onclick="window.location.href='interfaz_Controlador.php'">
                Volver
            </button>
        </div>
    </div>
    <h1 class="subtitulo">Mi perfil</h1>
    <div class="centrar">
        <div class="perfil-vendedor" id="perfilVendedor"></div>
    </div>
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const correoVendedor = '<?php echo $correoControlador; ?>';

        fetch('fetchPerfilControlador.php?correo=' + encodeURIComponent(correoVendedor))
            .then(response => response.json())
            .then(vendedor => {
                mostrarPerfil(vendedor);
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Hubo un problema al obtener los datos del vendedor: ' + error.message);
            });

        function mostrarPerfil(vendedor) {
            const contenedor = document.getElementById('perfilVendedor');
            contenedor.innerHTML = `

            <img src="../vendedor/usuarioAnon.jpeg" alt="User" class="img-userAnon"\n />
            <p>Nombre: ${vendedor.nombre}\n</p>
            <p>Apellido1: ${vendedor.apellido1}\n</p>
            <p>Apellido2: ${vendedor.apellido2}\n</p>
            <p>ID Persona: ${vendedor.idPersona}\n</p>
            <p>Correo: ${vendedor.correo}\n</p>`;

        }
    });
    </script>
</body>

</html>