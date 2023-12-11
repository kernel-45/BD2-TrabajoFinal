<?php
function obtenerPedidos($idPersona, $conn) {
$sql = "SELECT pedido.idPedido, pedido.estado, producto.nombre, producto.descripcion FROM
            producto JOIN 
                (propiedadesProducto JOIN pedido 
                    ON pedido.idComprador = $idPersona
                    AND pedido.idPedido = propiedadesProducto.idPedido)
            ON propiedadesProducto.idProducto = producto.idProducto;";
$result = mysqli_query($conn, $sql);
return $result; 
}
?>