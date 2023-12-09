<?php
function mostrar_formulario($scriptejecutable) {
    ?>
    <form method="post" action="<?php echo $scriptejecutable; ?>">
    CP: <input type="text" name="cp" required><br>
    Localidad: <input type="text" name="localidad" required><br>
    Vía:
    <select name="tipo_via" required>
        <option value="Calle">Calle</option>
        <option value="Avenida">Avenida</option>
        <option value="Plaza">Plaza</option>
        <option value="Carretera">Carretera</option>
        <option value="Camino">Camino</option>
        <option value="Paseo">Paseo</option>
        <option value="Glorieta">Glorieta</option>
        <option value="Bulevar">Bulevar</option>
        <option value="Travesía">Travesía</option>
        <option value="Rambla">Rambla</option>
        <option value="Paseo Marítimo">Paseo Marítimo</option>
        <option value="Carrera">Carrera</option>
        <option value="Alameda">Alameda</option>
        <option value="Ronda">Ronda</option>
        <option value="Cuesta">Cuesta</option>
        <option value="Plazoleta">Plazoleta</option>
        <option value="Pasaje">Pasaje</option>
    </select>
    <input type="text" name="via" required><br>
    Número: <input type="text" name="numero" required><br>
    Portal: <input type="text" name="portal"><br>
    Escalera: <input type="text" name="escalera"><br>
    Piso: <input type="text" name="piso"><br>
    Puerta: <input type="text" name="puerta"><br>
    <input type="submit" value="Enviar">
    </form>
    <?php
}

function get_direccion($conn) {
    // Procesar el formulario al enviar
    if ($_SERVER["REQUEST_METHOD"] != "POST") {
        return null;
    }
    // Recoger los datos del formulario en forma de array
    $datos = array(
        "puerta" => $_POST["puerta"],
        "piso" => $_POST["piso"],
        "escalera" => $_POST["escalera"],
        "portal" => $_POST["portal"],
        "numero" => $_POST["numero"],
        "via" => $_POST["via"],
        "tipo_via" => $_POST["tipo_via"],
        "localidad" => $_POST["localidad"],
        "cp" => $_POST["cp"]
    );
    $datos = array_values($datos);
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
?>