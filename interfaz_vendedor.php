<!DOCTYPE html>
<html lang="es">
  <head>
    <link rel="stylesheet" type="text/css" href="css/estilos.css" />
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
        <button class="boton">Hola, vendedor <?php echo $idVendedor; ?></button>
      </div>
    </div>
    <div class="contenedor-botones centrar">
      <button
        class="boton"
        id="consultarProductos"
        onclick="window.location.href='listaProductos.php'"
      >
        Consultar productos
      </button>
      <button class="boton">Nuevo producto</button>
      <button class="boton">Agregar producto existente</button>
    </div>
    <div id="listaProductos"></div>

    <script>
    const correoVendedor = '<?php echo $correoVendedor; ?>';
      document
        .getElementById("consultarProductos")
        .addEventListener("click", function () {
          fetch("gestCatalogo_vendedor.php", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              
              correo: correoVendedor
            }),
          })
            .then((response) => {
              if (!response.ok) {
                throw new Error("Network response was not ok");
              }
              return response.json();
            })
            .then((data) => {
              mostrarProductos(data);
            })
            .catch((error) => {
              console.error("Error:", error);
              alert(
                "Hubo un problema al obtener los productos: " + error.message
              );
            });
        });

      function mostrarProductos(productos) {
        const contenedor = document.getElementById("listaProductos");
        contenedor.innerHTML = "";

        productos.forEach((producto) => {
          const div = document.createElement("div");
          div.classList.add("producto");

          div.innerHTML = `<h3>${producto.nombre}</h3>
                             <p>Precio: ${producto.precio}</p>
                             <p>Descripción: ${producto.descripcion}</p>
                             <p>Stock: ${producto.stock}</p>`;

          contenedor.appendChild(div);
        });
      }
    </script>
  </body>
</html>
