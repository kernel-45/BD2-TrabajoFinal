<?php
session_start();
$_SESSION['previous_page'] = $_SERVER['HTTP_REFERER'];
echo "entro aqui";
error_reporting(E_ALL);
ini_set('display_errors', '1');
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Asegúrate de que los datos necesarios estén presentes en $_POST
    if (isset($_POST['idtemporal']) && isset($_POST['qtt'])) {
        echo "Datos recibidos correctamente.<br>";


        echo "Producto añadido al carrito exitosamente.<br>";
        anadir_carrito();
    } else {
        echo "Error: Datos insuficientes para añadir al carrito.<br>";
    }
} else {
    echo "Error: Método de solicitud no permitido.<br>";
}
function anadir_carrito()
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
    $sql = "SELECT p.idPedido FROM pedido p WHERE p.idComprador = $id";
    $result = mysqli_query($conn, $sql);

    // Verificar si hay resultados (sabemos que solo almacena un ID)
    if ($result) {
        // Verificar si hay filas devueltas por la consulta
        if ($row = mysqli_fetch_assoc($result)) {
            $idPedido = $row['idPedido'];

            // INSERTAMOS EL PRODUCTO

            $sql = "INSERT INTO propiedadesproducto (fechaDeLlegada, idPedido, idProducto, qtt)
                    VALUES (NULL,$idPedido ,$idproducto , $qtt);";
            mysqli_query($conn, $sql);
        } else {
            // No se encontraron resultados
            echo "No se pudo obtener el ID del pedido";
        }
    } else {
        // Error en la consulta SQL
        echo "Error al ejecutar la consulta SQL: " . mysqli_error($conn);
    }

    header("Location: {$_SESSION['previous_page']}");
    exit();
}
?>