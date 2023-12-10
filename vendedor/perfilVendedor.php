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
    <div class="contenedor-central centrar">
     
    </div>
  </body>
</html>
