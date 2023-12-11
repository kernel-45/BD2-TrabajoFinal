<?php ?>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <link rel="stylesheet" type="text/css" href="../css/estilosControlador.css">
    <?php
    // Conectar a la base de datos
// Asegúrate de reemplazar con tus propios detalles de conexión
    $conn = new mysqli("localhost", "root", "", "Estimazon");

    // Verificar la conexión
    if ($conexion->connect_error) {
        die("Conexión fallida: " . $conexion->connect_error);
    }

    $idUser = $_POST['idUser'];
    $tipoBusqueda = $_POST['tipoBusqueda'];
    ?>
</head>
<div class="titulo">
    ESTIMAZON
</div>

<body>
    <div class="contenedor-principal">
        <div class="subtitulo">Bienvenido al seguimiento de tus pedidos</div>
        <?php
        if ($tipoBusqueda == "ult5d") {
            $sql = "SELECT pedido.idPedido, vendedor.idPersona, pedido.fechaConfirmacion FROM 
        (vendedor JOIN
            (producto JOIN
                (propiedadesproducto JOIN
                    (comprador JOIN pedido
                    ON idComprador = 111)
                ON pedido.idPedido = propiedadesproducto.idPedido)
            ON propiedadesproducto.idFichaProducto = pedido.idPedido)
        ON vendedor.idPersona = producto.idVendedor)
    WHERE (DATEDIFF(CURDATE(), pedido.fechaConfirmacion) >= 5 AND propiedadesproducto.fechaDeLlegada IS NULL);";

        } elseif ($tipoBusqueda == "siempre") {
            $sql = "SELECT pedido.idPedido, vendedor.idPersona, pedido.fechaConfirmacion FROM 
                    vendedor JOIN
                        (producto JOIN
                            (propiedadesproducto JOIN
                                (comprador JOIN pedido
                                ON idComprador = $idUser)
                            ON pedido.idPedido = propiedadesproducto.idPedido)
                        ON propiedadesproducto.idFichaProducto = pedido.idPedido)
                    ON vendedor.idPersona = producto.idVendedor";
        }
        $result = mysqli_query($conn, $sql);
        if ($result->num_rows > 0) {
            // Procesar cada fila de resultado
            while ($row = mysqli_fetch_array($result)) {
                // Acceder a los atributos individuales
                $idPedido = $row["idPedido"];
                $idVendedor = $row["idPersona"];
                $fechaConfirmacion = $row["fechaConfirmacion"];

                // Hacer algo con estos datos
                echo "<div class=subtitulo>";
                echo "<div class='pedido'>";
                echo "<div class='estado-pedido'>$estado</div>";
                echo "<div class='id-pedido'>$idPedido</div>";
                echo "<div class='nombre-producto'>$nombre</div>";
                echo "<div class='descripcion-producto'>$descripcion</div>";
                echo "</div>";
                echo "</div>";
            }
        } else {
            echo "<div class='subtituloS'>";
            echo "<br><br><br><br>El usuario no ha hecho ningún pedido todavía. <br><br> 
              Cuando empiece a pedir productos de Estimazon sus productos aparecerán aquí";
            echo "</div>";
        }


        ?>
    </div>
    </div>

    <body>

</html>
