<?php

session_start();
// conexión a la base de datos
$conn = mysqli_connect("localhost", "root", "", "estimazon") or die("Error en la conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("Error en la conexión con la base de datos");

$consulta = // select que devuelve los datos del usuario
"SELECT nombre, apellido1, apellido2, correo 
FROM ".$_SESSION['tipoUser']." 
    WHERE ".$_SESSION['tipoUser'].".idPersona = ".$_SESSION['idUser'];

$resultado = mysqli_query($conn, $consulta); // se ejecuta la query

if(!$resultado){ // si error
    echo json_encode(['error' => 'Error accediendo a los datos del usuario']);
} else {
    if ($filaPerfil = mysqli_fetch_array($resultado)) {
        echo json_encode($filaPerfil);
    } else { // si error
        echo json_encode(['error' => 'No se encontraron datos para el usuario']);
    }
}
mysqli_close($conn);
?>
