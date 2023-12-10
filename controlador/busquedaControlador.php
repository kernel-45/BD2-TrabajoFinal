<html>

<head>
    <?php
    // Conectar a la base de datos
// Asegúrate de reemplazar con tus propios detalles de conexión
    $conn = new mysqli("localhost", "root", "", "Estimazon");

    // Verificar la conexión
    if ($conexion->connect_error) {
        die("Conexión fallida: " . $conexion->connect_error);
    }

    echo $idUser = $_POST['idUser'];
    echo $tipoBusqueda = $_POST['tipoBusqueda'];
    ?>
</head>

<body>
    <?php
    // Tu consulta SQL
// Asegúrate de usar declaraciones preparadas para prevenir inyecciones SQL
    $sql = "SELECT * FROM tuTabla WHERE idUser = ? AND tipoBusqueda = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("ss", $idUser, $tipoBusqueda);
    $stmt->execute();
    $result = $stmt->get_result();

    // Enviar los resultados de vuelta al cliente
    echo json_encode($result->fetch_all(MYSQLI_ASSOC));

    $conexion->close();
    ?>
    <?php
    function obtenerPedidos($idPersona, $conn)
    {
        $sql = "SELECT pedido.idPedido, pedido.estado, producto.nombre, producto.descripcion FROM
            producto JOIN 
                (propiedadesProducto JOIN pedido 
                    ON pedido.idComprador = $idPersona
                    AND pedido.idPedido = propiedadesProducto.idPedido)
            ON propiedadesProducto.idFichaProducto = producto.idProducto;";
        $result = mysqli_query($conn, $sql);
        return $result;
    }
    ?>

    <body>

</html>