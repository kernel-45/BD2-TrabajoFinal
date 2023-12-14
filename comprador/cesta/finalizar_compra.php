<?php
session_start();
$_SESSION['previous_page'] = $_SERVER['HTTP_REFERER'];
finaliza_compra();

function finaliza_compra()
{
    $iddir = $_SESSION['idZona'];
    $id = $_SESSION['idUser'];
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "estimazon";

    $conn = new mysqli($servername, $username, $password, $dbname);
    $idproducto = $_POST['idtemporal'];
    $qtt = $_POST['qtt'];
    // Verificar la conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    // Saco el ID del pedido
    $sql = "SELECT p.idPedido FROM pedido p WHERE p.idComprador = $id AND p.fechaConfirmacion IS NULL";
    $result = mysqli_query($conn, $sql);

    // Verificar si hay resultados (sabemos que solo almacena un ID)
    if ($result) {
        // Verificar si hay filas devueltas por la consulta
        if ($row = mysqli_fetch_assoc($result)) {
            $idPedido = $row['idPedido'];
            if (isset($_POST['accion']) && $_POST['accion'] == 'vaciarCesta') {
             //ELIMINA PRODUCTOS ASOCIADOS AL PEDIDO
             $sql = "DELETE FROM propiedadesproducto WHERE idPedido = $idPedido;";
             mysqli_query($conn, $sql);
            } else {
            //COLOCA LA FECHA DE CONFIRMACIÓN, EL IDZona Y EL ESTADO
            $sql = "UPDATE pedido SET fechaConfirmacion = CURRENT_DATE, idZona = $iddir, estado = 'pagado' WHERE idPedido = $idPedido;";
            mysqli_query($conn, $sql);
            //CREA UN NUEVO CARRITO PARA EL USUARIO
            $sql = "INSERT INTO pedido(fechaConfirmacion, idZona, idComprador, idRepartidor, estado) VALUES (NULL, NULL, $id, NULL, 'Carrito');";
            mysqli_query($conn, $sql);
            echo json_encode(["status" => "success", "message" => "Compra realizada!"]);
        }
        } else {
            // No se encontraron resultados
            echo "No se pudo obtener el ID del carrito";
        }
    } else {
        // Error en la consulta SQL
        echo "Error al ejecutar la consulta SQL: " . mysqli_error($conn);
    }

    header("Location: {$_SESSION['previous_page']}");
    exit();
}
?>