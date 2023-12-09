<?php
include("funciones_zona.php");
// Conexión a la base de datos
$conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");

$id_direccion = get_direccion($conn);
$id_comprador = 90;
// supongo que el id del comprador es 90, cuando arturo (creo que le tocaba a él)
// tenga lo del comprador cogeré el valor que haya

// INSERT IGNORE intenta insertar, si se encuentra claves duplicadas no salta un error, simplemente no hace nada
$insert = "INSERT INTO r_tienedomicilioen (idComprador, idZona) VALUES (".$id_comprador.", ".$id_direccion.")";
try {
    if (!mysqli_query($conn, $insert)) {
        throw new mysqli_sql_exception(mysqli_error($conn));
    } else {
        ?> <script>
            alert('Domicilio añadido con éxito.');
            window.location.href = '../estimazon.html';
        </script> <?php
    }
} catch (mysqli_sql_exception $e) {
    // Verificar si el código de error es específico de llave duplicada
    if ($e->getCode() != 1062) {
        echo '<script>
                alert("Error al actualizar datos: ' . $e->getMessage() . '");
              </script>';
    } else {
        ?> <script>
            alert('El domicilio que se ha intentado añadir ya está en la base de datos.');
            window.location.href = 'anyadir_domicilio.php';
        </script> <?php
    }
}
// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>
