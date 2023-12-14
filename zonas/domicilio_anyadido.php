<?php
$data = json_decode(file_get_contents('php://input'), true); // capto los datos json y los decodifico
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
$datos = array_values($datos); // los paso a un array asociativo y me quedo con los valores

// Conexión a la base de datos
$conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");
// la función get_direccion está abajo desarrollada
$id_direccion = get_direccion($conn, $datos); // consigo el idZona de la dirección asociada a los datos, si no hay la creo
session_start(); // inicio sesión
// hago el insert que añade el domicilio al usuario con sesión iniciada
$insert = "INSERT INTO r_tienedomicilioen (idComprador, idZona) VALUES (".$_SESSION['idUser'].", ".$id_direccion.")";
try { // si error salta excepción
    if (!mysqli_query($conn, $insert)) {
        throw new mysqli_sql_exception(mysqli_error($conn));
    } else {
        echo json_encode(['success' => true]); // si todo ha ido bien se lo manda a la función AJAX (servidor -> cliente)
    }
} catch (mysqli_sql_exception $e) {
    // Verificar si el código de error es específico de llave duplicada
    if ($e->getCode() != 1062) {
        echo json_encode(['success' => false, 'message' => 'Error al actualizar datos: ' . $e->getMessage()]);
    } else {
        echo json_encode(['success' => false, 'message' => 'El domicilio que se ha intentado añadir ya está asignado a usted.']);
    }
}
// Cerrar la conexión a la base de datos
mysqli_close($conn);

/**
 * Devuelve el idZona que apunta a la dirección de $datos
 */
function get_direccion($conn, $datos) {
    $anterior = null; // $anterior es el idZonaPadre del idZona, empieza sin padre porque recorre de raíz a hoja
    while (!empty($datos)) { // mientras no lo haya procesado todo y la zona exista
        $value = array_pop($datos); // coge el primer nombreZona (el primero de todos es el CP)
        if ($value == null) { // si es una zona opcional (como piso o puerta)
            continue; // pasa a procesar la siguiente zona, que será hija de la zona que iba a ser padre de esta zona saltada
        }
        if ($anterior == null) { // si es una raíz encuentra el id con su nombre
            $consulta =
            "SELECT zona.idZona 
                FROM zona 
                    WHERE zona.idZonaPadre IS NULL 
                    AND zona.nombreZona = '".$value."'";
        } else { // si es un nodo intermedio u hoja busca el hijo del anterior nodo zona
            $consulta =
            "SELECT zona.idZona 
                FROM zona 
                    WHERE zona.idZonaPadre = ".$anterior.
                    " AND zona.nombreZona = '".$value."'";
        }
        $result = mysqli_query($conn, $consulta); // ejecuto la consulta
        if (!$result) { // si error
            echo "Error en la consulta: ".mysqli_error($conn);
        }
        $n_zonas = mysqli_num_rows($result); // cuento las filas
        if ($n_zonas > 1) { // si varias tienen el mismo nombre error
            echo "Error en la consulta: se han encontrado varias zonas idénticas";
        } elseif ($n_zonas == 0) { // si no existe esa zona sale del bucle para añadirla
            array_push($datos, $value); // vuelve a meterla en el array para poder procesarla
            break;
        }
        $fila = mysqli_fetch_array($result); // capto la fila
        $anterior = $fila['idZona']; // guardo el valor del id para poder acceder a su hijo en la siguiente iteración
    }
    while (!empty($datos)) { // mientras no haya terminado de procesar la dirección va insertando zonas
        $value = array_pop($datos); // proceso la siguiente zona
        if ($value == null) { // si no ha sido indicada paso a la siguiente
            continue;
        }
        if ($anterior == null) { // si la zona no tiene padre no lo añade porque el valor predeterminado es null
            $insert = "INSERT INTO zona (nombreZona) VALUES ('".$value."')";
        } else { // si tiene padre lo añade junto al nombre de la zona, en ambos casos el idZona se genera de forma autoincremental
            $insert = "INSERT INTO zona (nombreZona, idZonaPadre) VALUES ('".$value."', ".$anterior.")";
        }
        if (!mysqli_query($conn, $insert)) { // si error
            echo "Error al insertar datos: ".mysqli_error($conn);
        }
        $anterior = mysqli_insert_id($conn); // capta el valor del identificador de la zona insertada
    }
    return $anterior; // al final devuelve el idZona de la zona hoja, que a partir de ella y su atributo idZonaPadre se podrá conseguir toda la dirección
}
?>
