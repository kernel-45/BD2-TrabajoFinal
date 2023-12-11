<?php
function obtenercesta($idPersona, $conn) {
$sql = "SELECT pedido.idPedido, producto.nombre, producto.descripcion, producto.precio, producto.stock
        FROM producto 
        JOIN propiedadesproducto 
        ON producto.idProducto = propiedadesproducto.idProducto 
        JOIN pedido 
        ON pedido.idComprador= $idPersona AND pedido.fechaConfirmacion IS NULL AND pedido.idPedido = propiedadesproducto.idPedido;";
$result = mysqli_query($conn, $sql);
if ($result->num_rows > 0) {
    // Obtener todas las filas como arrays asociativos
    $productos = $result->fetch_all(MYSQLI_ASSOC);

} else {
    $productos = array(); // Si no hay resultados, inicializar un array vacío

}
return $productos; 
}
