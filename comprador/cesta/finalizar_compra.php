<?php
session_start();
$_SESSION['previous_page'] = $_SERVER['HTTP_REFERER'];
error_reporting(E_ALL);
ini_set('display_errors', '1');
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Asegúrate de que los datos necesarios estén presentes en $_POST
    if (isset($_POST['zona'])) {
        echo "Datos recibidos correctamente.<br>";


        echo "Producto añadido al carrito exitosamente.<br>";
        finaliza_compra();
    } else {
        echo "Error: Datos insuficientes para añadir al carrito.<br>";
    }
} else {
    echo "Error: Método de solicitud no permitido.<br>";
}
function finaliza_compra()
{
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

            // ELIMINA PRODUCTOS ASOCIADOS AL PEDIDO
            // $sql = "DELETE FROM propiedadesproducto WHERE idPedido = $idPedido;";
            // mysqli_query($conn, $sql);
            //COLOCA LA FECHA DE CONFIRMACIÓN Y EL IDZona
            $sql = "UPDATE pedido SET fechaConfirmacion = CURRENT_DATE, estado = 'pagado' WHERE idPedido = $idPedido;";
            mysqli_query($conn, $sql);
            //CREA UN NUEVO CARRITO PARA EL USUARIO
            $sql = "INSERT INTO pedido(fechaConfirmacion, idZona, idComprador, idRepartidor, estado) VALUES (NULL, NULL, $id, NULL, 'Carrito');";
            mysqli_query($conn, $sql);
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