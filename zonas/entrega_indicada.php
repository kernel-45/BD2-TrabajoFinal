<?php
include("funciones_zona.php");
// Conexión a la base de datos
$conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");

$id_direccion = get_direccion($conn);
$id_pedido = 1;
// supongo que el id del carrito es 1, cuando simó (creo que le tocaba a él)
// tenga lo del carrito cogeré el valor que haya
$update = "UPDATE pedido SET pedido.idZona = ".$id_direccion." WHERE pedido.idPedido = ".$id_pedido;
if (!mysqli_query($conn, $update)) {
    echo '<script>
            alert("Error al actualizar datos: '.mysqli_error($conn).'");
            </script>';
} else {
    // Redirigir a otra página
    ?> <script>
        alert('Zona indicada con éxito.');
        window.location.href = '../estimazon.html';
    </script> <?php
}
// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>
