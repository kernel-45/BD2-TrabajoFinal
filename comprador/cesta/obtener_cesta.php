<?php
function obtenercesta($idPersona, $conn) {
$sql = "SELECT pe.idPedido, p.nombre, p.descripcion, p.precio, pp.qtt, p.idProducto
FROM producto p
JOIN propiedadesproducto pp
ON p.idProducto = pp.idProducto 
JOIN pedido pe
ON pe.idComprador= $idPersona AND pe.fechaConfirmacion IS NULL AND pe.idPedido = pp.idPedido;;";
$result = mysqli_query($conn, $sql);
if ($result->num_rows > 0) {
    // Obtener todas las filas como arrays
    $productos = $result->fetch_all(MYSQLI_ASSOC);

} else {
    $productos = array(); // Si no hay resultados, inicializar un array vacío

}
return $productos; 
}
