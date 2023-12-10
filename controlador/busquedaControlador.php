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
    <?php
    if ($tipoBusqueda == "ult5d") {
        $sql = "SELECT * FROM tuTabla WHERE idUser = ? AND tipoBusqueda = ?";
    } elseif ($tipoBusqueda == "siempre") {
        $sql = "SELECT * FROM tuTabla WHERE idUser = ? AND tipoBusqueda = ?";
    }
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