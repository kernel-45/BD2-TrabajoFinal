<?php

// Obtener datos del cuerpo de la solicitud
$data = json_decode(file_get_contents('php://input'), true);
$correo = $data['correo'];
$contraseña = $data['contrasenya'];
$tipo = $data['tipo'];
$nombre = $data['nombre'];
$apellido1 = $data['apellido1'];
$apellido2 = $data['apellido2'];
$registro = $data['nombre'] != '';

if ($tipo != "vendedor" && $tipo != "comprador" && $tipo != "controlador") {
    echo json_encode(['success' => false, 'message' => 'Tipo de usuario no válido.']);
    exit;
}

// Conexión a la base de datos
$conn = mysqli_connect("localhost", "root", "") or die("error a conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexión con la base de datos");

$consulta = "SELECT " . $tipo . ".idPersona, " . $tipo . ".contraseña FROM " . $tipo . " WHERE " . $tipo . ".correo = '$correo'";
$result = mysqli_query($conn, $consulta);

if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Error en la consulta: ' . mysqli_error($conn)]);
    exit;
}

$fila = mysqli_fetch_array($result);

if ($registro) {
    if ($fila) {
        echo json_encode(['success' => false, 'message' => 'Ya hay un usuario con ese correo electrónico y tipo.']);
        exit;
    }
    $insert = "INSERT INTO ".$tipo." (nombre, apellido1, apellido2, correo, contraseña) VALUES ('".$nombre."', '".$apellido1."', '".$apellido2."', '".$correo."', '".$contraseña."')";
    $result = mysqli_query($conn, $insert);
    if (!$result) {
        echo json_encode(['success' => false, 'message' => "Error en la consulta: ".mysqli_error($conn)]);
        exit;
    }
    $idPersona = mysqli_insert_id($conn);
} else {
    if (!$fila) {
        echo json_encode(['success' => false, 'message' => 'No se encontró ningún usuario con ese correo electrónico y tipo.']);
        exit;
    }
    if ($fila['contraseña'] != $contraseña) {
        echo json_encode(['success' => false, 'message' => 'Contraseña incorrecta.']);
        exit;
    }
    $idPersona = $fila['idPersona'];
}

// Iniciar sesión
session_start();
$_SESSION['idUser'] = $idPersona;
$_SESSION['tipoUser'] = $tipo;
$_SESSION['correoUser'] = $correo;

if ($tipo != "comprador") {
    echo json_encode(['success' => true]);
    mysqli_close($conn);
    exit;
}
$consulta = "SELECT pedido.idPedido FROM pedido WHERE pedido.idComprador = ".$idPersona." AND pedido.fechaConfirmacion IS NULL";
$result = mysqli_query($conn, $consulta);
if (!$result) {
    echo json_encode(['success' => false, 'message' => "Error en la consulta: ".mysqli_error($conn)]);
    exit;
}
$n_pedidos = mysqli_num_rows($result);
if ($n_pedidos > 1) {
    echo json_encode(['success' => false, 'message' => 'Error en la consulta: se han encontrado varios carritos']);
    exit;
} elseif ($n_pedidos == 1) {
    $fila = mysqli_fetch_array($result);
    $_SESSION['idCarrito'] = $fila['idPedido'];
} else {
    
    $insert = "INSERT INTO pedido (idComprador) VALUES (".$idPersona.")";
    if (!mysqli_query($conn, $insert)) {
        echo json_encode(['success' => false, 'message' => "Error en la consulta: ".mysqli_error($conn)]);
        exit;
    }
    $_SESSION['idCarrito'] = mysqli_insert_id($conn);
}
// Enviar respuesta al cliente
mysqli_close($conn);
echo json_encode(['success' => true]);//*/
?>