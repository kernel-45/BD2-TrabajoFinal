<!DOCTYPE html>
<html lang="es">
  <head>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css" />
    <meta charset="UTF-8" />
    <title>Estimazon - Vendedor</title>
  </head>
  <body>
    <?php
    session_start();
    $idVendedor = $_SESSION['idUser'] ?? ''; 
    ?>
    <div class="titulo">
      ESTIMAZON
      <div class="botones">
      <button class="boton">Cerrar sesión</button>
  <button class="boton" id="perfilVendedor" onclick="window.location.href='perfilVendedor.php'">
    <img src="user.png" alt="User" class="icono-user" />Mi perfil 
  </button>
</div>
    </div>
    <h1 class="subtitulo">Hola, vendedor <?php echo $idVendedor; ?></h1>
    <div class="contenedor-central centrar">
      <button
        class="boton"
        id="consultarProductos"
        onclick="window.location.href='listaProductos.php'"
      >
        Consultar productos
      </button>
      <button 
        class="boton"
        id="SubirProducto"
        onclick="window.location.href='subirProducto.php'"
        >
        Nuevo producto
      </button>
      <button 
        class="boton"
        id="restock"
        onclick="window.location.href='modificarProducto.php'"
        >
        Modificar producto
      </button>
    </div>
  </body>
</html>
