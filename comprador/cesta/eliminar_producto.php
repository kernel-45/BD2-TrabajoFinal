<?php
session_start();
$_SESSION['previous_page'] = $_SERVER['HTTP_REFERER'];
eliminar_producto();

function eliminar_producto()
{
    $id = $_SESSION['idUser'];
    $qtt_actual = $_POST['qtt_actual'];
    $qtt_resta =$_POST['qtt_resta'];
    $idProducto = $_POST['idProducto'];
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "estimazon";
    //CALCULO DEL PRECIO FINAL AL ELIMINAR EL PRODUCTO
    $qtt_final = $qtt_actual - $qtt_resta;
    $conn = new mysqli($servername, $username, $password, $dbname);
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
            $idPedido = $row['idPedido']; //Lo colocamos en la variable idPedido
            if ($qtt_final<1) {//Si hay un solo pedido eliminamos el produto del carro
                $sql = "DELETE FROM propiedadesproducto WHERE idPedido = $idPedido AND idProducto = $idProducto AND qtt = $qtt_actual;";
                $result = mysqli_query($conn, $sql);
            } else {
                //Si hay más de un producto simplemente cambiamos la cantidad del producto
                $sql = "UPDATE propiedadesproducto SET qtt = $qtt_final WHERE idProducto = $idProducto AND idPedido = $idPedido;";
                $result = mysqli_query($conn, $sql);      
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