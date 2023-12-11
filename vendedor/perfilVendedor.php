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
  <button class="boton" id="perfilVendedor" onclick="window.location.href='perfilVendedor.php'">
    <img src="user.png" alt="User" class="icono-user" />Mi perfil 
  </button>
</div>
    </div>
    <h1 class="subtitulo">Mi perfil</h1>
    <div id="perfilVendedor"></div>
     
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
            <img src="usuarioAnon.jpeg" alt="User" class="icono-user" />
            <p>Nombre: ${vendedor.nombre}</p>
            <p>Apellido1: ${vendedor.apellido1}</p>
            <p>Apellido2: ${vendedor.apellido2}</p>
            <p>ID Persona: ${vendedor.idPersona}</p>
            <p>Correo: ${vendedor.correo}</p>
            <p>Num Avisos: ${vendedor.numAvisos}</p>`;
    }
});
    </script>
  </body>
</html>
