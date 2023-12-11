<!DOCTYPE html>
<html lang="es">

<head>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css" />
    <meta charset="UTF-8" />
    <title>Estimazon - Mi perfil</title>
</head>

<body>
    <?php
    session_start();
    $idVendedor = $_SESSION['idUser'] ?? ''; 
    $correoVendedor = $_SESSION['correoUser'] ?? ''; 
    
    ?>
    <div class="titulo">
        ESTIMAZON
        <div class="botones">
            <button class="boton">Cerrar sesión</button>
            <button class="boton" id="perfil" onclick="window.location.href='interfaz_vendedor.php'">
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
        const correoVendedor = '<?php echo $correoVendedor; ?>';

        fetch('fetchPerfil.php?correo=' + encodeURIComponent(correoVendedor))
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

            <img src="usuarioAnon.jpeg" alt="User" class="img-userAnon"\n />
            <p>Nombre: ${vendedor.nombre}\n</p>
            <p>Apellido1: ${vendedor.apellido1}\n</p>
            <p>Apellido2: ${vendedor.apellido2}\n</p>
            <p>ID Persona: ${vendedor.idPersona}\n</p>
            <p>Correo: ${vendedor.correo}\n</p>
            <p>Num Avisos: ${vendedor.numAvisos}\n</p>`;

        }
    });
    </script>
</body>

</html>