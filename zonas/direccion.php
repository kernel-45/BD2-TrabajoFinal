<?php
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
        $fila = mysqli_fetch_array(mysqli_query($conn, $consulta));
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

function get_datos($json) {
    $data = json_decode($json, true);
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
    return array_values($datos);
}
?>