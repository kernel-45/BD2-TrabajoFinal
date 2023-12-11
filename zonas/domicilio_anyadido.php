<?php
$data = json_decode(file_get_contents('php://input'), true);
$datos = array(
    "puerta" => $data["puerta"],
    "piso" => $data["piso"],
    "escalera" => $data["escalera"],
    "portal" => $data["portal"],
    "numero" => $data["numero"],
    "via" => $data["via"],
    "tipo_via" => $data["tipo_via"],
    "localidad" => $data["localidad"],
    "cp" => $data["cp"]
);
$datos = array_values($datos);

// Conexión a la base de datos
$conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");

$id_direccion = get_direccion($conn, $datos);
session_start();
$id_comprador = $_SESSION['idUser'];

// INSERT IGNORE intenta insertar, si se encuentra claves duplicadas no salta un error, simplemente no hace nada
$insert = "INSERT INTO r_tienedomicilioen (idComprador, idZona) VALUES (".$id_comprador.", ".$id_direccion.")";
try {
    if (!mysqli_query($conn, $insert)) {
        throw new mysqli_sql_exception(mysqli_error($conn));
    } else {
        echo json_encode(['success' => true]);
    }
} catch (mysqli_sql_exception $e) {
    // Verificar si el código de error es específico de llave duplicada
    if ($e->getCode() != 1062) {
        echo json_encode(['success' => false, 'message' => 'Error al actualizar datos: ' . $e->getMessage()]);
    } else {
        echo json_encode(['success' => false, 'message' => 'El domicilio que se ha intentado añadir ya está en la base de datos.']);
    }
}
// Cerrar la conexión a la base de datos
mysqli_close($conn);

function get_direccion($conn, $datos) {
    $anterior = null;
    while (!empty($datos)) {
        $value = array_pop($datos);
        if ($value == null) {
            continue;
        }
        if ($anterior == null) {
            $consulta = "SELECT zona.idZona, COUNT(*) AS total FROM zona WHERE zona.idZonaPadre IS NULL AND zona.nombreZona = '".$value."'";
        } else {
            $consulta = "SELECT zona.idZona, COUNT(*) AS total FROM zona WHERE zona.idZonaPadre = ".$anterior." AND zona.nombreZona = '".$value."'";
        }
        $result = mysqli_query($conn, $consulta);
        if (!$result) {
            echo "Error en la consulta: ".mysqli_error($conn);
        }
        $fila = mysqli_fetch_array($result);
        $n_zonas = $fila['total'];
        if ($n_zonas > 1) {
            echo "Error en la consulta: se han encontrado varias zonas idénticas";
        } elseif ($n_zonas == 0) {
            array_push($datos, $value);
            break;
        }
        $anterior = $fila['idZona'];
    }
    while (!empty($datos)) {
        $value = array_pop($datos);
        if ($value == null) {
            continue;
        }
        if ($anterior == null) {
            $insert = "INSERT INTO zona (nombreZona) VALUES ('".$value."')";
        } else {
            $insert = "INSERT INTO zona (nombreZona, idZonaPadre) VALUES ('".$value."', ".$anterior.")";
        }
        if (!mysqli_query($conn, $insert)) {
            echo "Error al insertar datos: ".mysqli_error($conn);
        }
        $anterior = mysqli_insert_id($conn);
    }
    return $anterior;
}
?>
