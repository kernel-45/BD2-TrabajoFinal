<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <link rel="stylesheet" type="text/css" href="../css/estilosControlador.css">
    <?php
    // Conectar a la base de datos
    $conn = new mysqli("localhost", "root", "", "Estimazon");
    // Verificar la conexión
    if (isset($_POST['idUser']) && isset($_POST['tipoBusqueda'])) {
        $idUser = $_POST['idUser'];
        $tipoBusqueda = $_POST['tipoBusqueda'];
    } else {
        // Manejar el caso en que los datos no estén presentes
        echo "Datos necesarios no recibidos.";
    }
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['ponerAviso'])) {
        $idVendedor = $_POST['idVendedor'];
        $sql2 = "UPDATE vendedor SET numAvisos = numAvisos + 1 WHERE idPersona = $idVendedor";

        if ($conn->query($sql2) === TRUE) {
            echo "Aviso actualizado correctamente.";
            header('Location: interfaz_Controlador.php');
            exit();
        } else {
            echo "Error al actualizar el aviso: " . $conn->error;
        }
    }
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['marcarRecibido'])) {
        $idPedido = $_POST['idPedido'];
        $sql3 = "UPDATE propiedadesProducto SET fechaDeLlegada = CURDATE() WHERE propiedadesProducto.idPedido = $idPedido";

        mysqli_query($conn, $sql3);
        if ($conn->query($sql3) === TRUE) {
            echo "Aviso actualizado correctamente.";
            header('Location: interfaz_Controlador.php');
            exit();
        } else {
            echo "Error al actualizar el aviso: " . $conn->error;
        }
    }
    
    ?>
   
    <style>
        table {
            border: 1px solid black;
            width: 100%;
            padding: 5%;
        }

        th,
        td {
            border: 1px solid black;
            text-align: left;
            padding: 8px;
        }
    </style>
</head>
<div class="titulo">
    ESTIMAZON
</div>

<body>
    <div class="contenedor-principal">
        <div class="subtitulo">Bienvenido al seguimiento de los pedidos del cliente
            <?php echo $idUser ?>
        </div>
        <div class="subtitulo">
            <?php $idUser ?>
        </div>
        <?php
        $sqlP = "SELECT * FROM comprador WHERE idPersona = $idUser";
        $resultP = $conn->query($sqlP);
        if ($resultP->num_rows == 0) {
            echo "No existe ese comprador";
        } elseif ($tipoBusqueda == "ult5d") {
            $sql = "SELECT pedido.idPedido, vendedor.idPersona, pedido.fechaConfirmacion, producto.nombre, propiedadesproducto.fechaDeLlegada FROM 
        (vendedor JOIN
            (producto JOIN
                (propiedadesproducto JOIN
                    (comprador JOIN pedido
                    ON pedido.idComprador = $idUser
                    AND comprador.idPersona = $idUser)
                ON pedido.idPedido = propiedadesproducto.idPedido)
            ON propiedadesproducto.idProducto = producto.idProducto)
        ON vendedor.idPersona = producto.idVendedor)
    WHERE (DATEDIFF(CURDATE(), pedido.fechaConfirmacion) >= 5 AND propiedadesproducto.fechaDeLlegada IS NULL AND pedido.fechaConfirmacion IS NOT NULL);";

        } elseif ($tipoBusqueda == "siempre") {
            $sql = "SELECT pedido.idPedido, vendedor.idPersona, pedido.fechaConfirmacion, producto.nombre, propiedadesproducto.fechaDeLlegada FROM 
            vendedor JOIN
                (producto JOIN
                    (propiedadesproducto JOIN
                        (comprador JOIN pedido
                        ON comprador.idPersona = $idUser
                        AND pedido.idComprador = $idUser)
                    ON pedido.idPedido = propiedadesproducto.idPedido)
                ON propiedadesproducto.idProducto = producto.idProducto)
            ON vendedor.idPersona = producto.idVendedor
            WHERE pedido.fechaConfirmacion IS NOT NULL";
        }
        $result = mysqli_query($conn, $sql);
        if ($result->num_rows > 0) {
            //acaba php
            ?>
            <!-- pongo lo de la tabla de jaume -->
            <table>
                <tr>
                    <td>id pedido </td>
                    <td>ID vendedor </td>
                    <td>Fecha confirmacion pedido </td>
                    <td>Nombre producto </td>
                    <td>Estado vendedor </td>
                    <td>Opciones</td>
                </tr>
                <!-- vuelve a abrir php -->
                <?php
                // Procesar cada fila de resultado
                while ($row = mysqli_fetch_array($result)) {
                    // Acceder a los atributos individuales
                    $idPedido = $row["idPedido"];
                    $idVendedor = $row["idPersona"];
                    $fechaConfirmacion = $row["fechaConfirmacion"];
                    $nombreProducto = $row["nombre"];
                    $fechaDeLlegada = $row["fechaDeLlegada"];
                    $sql_estado_vendedor = "SELECT obtener_estado($idVendedor)"; 
                    $estado = mysqli_query($conn, $sql_estado_vendedor);
                    if($col = mysqli_fetch_array($estado)){
                        $estadoV = $col["obtener_estado($idVendedor)"]; 
                    }
                    // Hacer algo con estos datos
                    echo "<tr>";
                    echo "<td> $idPedido</td>";
                    echo "<td> $idVendedor</td>";
                    echo "<td> $fechaConfirmacion</td>";
                    echo "<td> $nombreProducto</td>";
                    echo "<td> $estadoV</td>"; 
                    echo "<td>";

                    if ($fechaDeLlegada == null) {
                        echo "<form method='post'>";
                        echo "<input type='hidden' name='idVendedor' value='" . $idVendedor . "'>";
                        echo "<button type='submit' name='ponerAviso'>Poner Aviso</button>";
                        echo "</form>";
                        echo "<form method='post'>";
                        echo "<input type='hidden' name='idPedido' value='" . $idPedido . "'>";
                        echo "<button type='submit' name='marcarRecibido'>Marcar como recibido</button>";
                        echo "</form>";
                    } else {
                        echo "recibido";
                    }
                    echo "</td>";
                    echo "</tr>";
                    
                }
                ?>
            </table>
            <?php
        } else {
            if($tipoBusqueda == "siempre"){
            echo "<div class='subtitulo'>";
            echo "<br><br><br><br>El usuario no ha hecho ningún pedido todavía. <br><br> 
              Cuando empiece a pedir productos de Estimazon sus productos aparecerán aquí";
            echo "</div>";
            } else {
                echo "<div class='subtitulo'>";
                echo "<br><br><br><br>El usuario no tiene pedidos no entregados en los ultimos 5 dias. <br><br> 
                  Cuando realice pedidos que no le hayan llegado al cabo de 5 días aparecerán aquí";
                echo "</div>";
            }
        }



        ?>
    </div>
    </div>

    <body>

</html>