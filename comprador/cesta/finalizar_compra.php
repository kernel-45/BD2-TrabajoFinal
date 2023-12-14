<?php
session_start();
$_SESSION['previous_page'] = $_SERVER['HTTP_REFERER'];
finaliza_compra();

function finaliza_compra()
{
    //COMPROBAMOS QUE EL USUARIO TENGA SELECCIONADA UNA TARJETA Y UNA ZONA
    if (isset($_SESSION['idZona']) && isset($_SESSION['tarjeta'])) {
        $iddir = $_SESSION['idZona'];
    } else {
        $_SESSION['mensaje'] = 'Debes seleccionar una dirección y una tarjeta en tu perfil';
        echo "<script>
            alert('{$_SESSION['mensaje']}');
            window.location.href = '{$_SESSION['previous_page']}';          
          </script>";

        exit();
    }

    $id = $_SESSION['idUser'];
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "estimazon";

    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verificar la conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }




    // Saco el ID del pedido carrito
    $sql = "SELECT p.idPedido FROM pedido p WHERE p.idComprador = $id AND p.fechaConfirmacion IS NULL";
    $result = mysqli_query($conn, $sql);

    //COMPROBAMOS QUE EL USUARIO TENGA ITEMS EN EL CARRITO
    $sql = "SELECT idProducto FROM propiedadesproducto JOIN pedido ON pedido.idPedido = 8 AND propiedadesproducto.idPedido = pedido.idPedido;";
    $result = mysqli_query($conn, $sql);
    if ($result && mysqli_num_rows($result) < 1) {
        // Si no hay filas le decimos que debe tener productos en el carrito
        $_SESSION['mensaje'] = 'Debes añadir productos a la cesta';
        echo "<script>
            alert('{$_SESSION['mensaje']}');
            window.location.href = '{$_SESSION['previous_page']}';          
          </script>";

        exit();
    } 
    // Verificar si hay resultados (sabemos que solo almacena un ID)
    if ($result) {
        // Verificar si hay filas devueltas por la consulta
        if ($row = mysqli_fetch_assoc($result)) {
            $idPedido = $row['idPedido'];
            //OPCION VACIAR CESTA
            if (isset($_POST['accion']) && $_POST['accion'] == 'vaciarCesta') {
                //ELIMINA PRODUCTOS ASOCIADOS AL PEDIDO
                $sql = "DELETE FROM propiedadesproducto WHERE idPedido = $idPedido;";
                mysqli_query($conn, $sql);
            //OPCION FINALIZAR COMPRA
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