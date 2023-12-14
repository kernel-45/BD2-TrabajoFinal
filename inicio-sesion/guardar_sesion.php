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

if ($tipo != "vendedor" && $tipo != "comprador" && $tipo != "controlador") { // si no se ha pulsado ningún botón
    echo json_encode(['success' => false, 'message' => 'Tipo de usuario no válido.']);
    exit;
}

// Conexión a la base de datos
$conn = mysqli_connect("localhost", "root", "") or die("error a conexión con el servidor");
$db = mysqli_select_db($conn, "estimazon") or die("error a conexión con la base de datos");

$consulta = // busca la persona
"SELECT ".$tipo.".idPersona, ".$tipo.".contraseña 
FROM ".$tipo." 
    WHERE ".$tipo.".correo = '$correo'";
$result = mysqli_query($conn, $consulta); // ejecuta la query

if (!$result) { // si error
    echo json_encode(['success' => false, 'message' => 'Error en la consulta: ' . mysqli_error($conn)]);
    exit;
}

$fila = mysqli_fetch_array($result);

if ($registro) { // si se está registrando
    if ($fila) { // si error
        echo json_encode(['success' => false, 'message' => 'Ya hay un usuario con ese correo electrónico y tipo.']);
        exit;
    }
    $insert = // inserta la persona
    "INSERT INTO ".$tipo." (nombre, apellido1, apellido2, correo, contraseña)
        VALUES ('".$nombre."', '".$apellido1."', '".$apellido2."', '".$correo."', '".$contraseña."')";
    $result = mysqli_query($conn, $insert); // ejecuta la query
    if (!$result) { // si error
        echo json_encode(['success' => false, 'message' => "Error en la consulta: ".mysqli_error($conn)]);
        exit;
    }
    $idPersona = mysqli_insert_id($conn); // guarda el identificador de la persona insertada
} else { // si está iniciando sesión
    if (!$fila) { // si error
        echo json_encode(['success' => false, 'message' => 'No se encontró ningún usuario con ese correo electrónico y tipo.']);
        exit;
    }
    if ($fila['contraseña'] != $contraseña) { // si error
        echo json_encode(['success' => false, 'message' => 'Contraseña incorrecta.']);
        exit;
    }
    $idPersona = $fila['idPersona']; // guarda el id en la variable
}

session_start(); // se guardan los datos en cookies
$_SESSION['idUser'] = $idPersona;
$_SESSION['tipoUser'] = $tipo;
$_SESSION['correoUser'] = $correo;

if ($tipo != "comprador") { // si no es comprador no hace falta seguir procesando, no se añade un carrito a él
    echo json_encode(['success' => true]);
    mysqli_close($conn);
    exit;
}
$consulta = // select del carrito, el que tiene fechaConfirmacion a NULL
"SELECT pedido.idPedido 
FROM pedido 
    WHERE pedido.idComprador = ".$idPersona.
        " AND pedido.fechaConfirmacion IS NULL";
$result = mysqli_query($conn, $consulta);
if (!$result) { // si error
    echo json_encode(['success' => false, 'message' => "Error en la consulta: ".mysqli_error($conn)]);
    exit;
}
$n_pedidos = mysqli_num_rows($result);
if ($n_pedidos > 1) { // si tiene varios carritos error
    echo json_encode(['success' => false, 'message' => 'Error en la consulta: se han encontrado varios carritos']);
    exit;
} elseif ($n_pedidos == 1) { // si ya tiene carrito
    $fila = mysqli_fetch_array($result);
    $_SESSION['idCarrito'] = $fila['idPedido']; // se guarda en la cookie
} else { // si no tiene carrito se crea
    $insert = "INSERT INTO pedido (idComprador, estado) VALUES (".$idPersona.", 'carrito')"; // se crea el carrito
    // se ejecuta la query
    if (!mysqli_query($conn, $insert)) { // si error
        echo json_encode(['success' => false, 'message' => "Error en la consulta: ".mysqli_error($conn)]);
        exit;
    }
    $_SESSION['idCarrito'] = mysqli_insert_id($conn); // se guarda el identificador del carrito creado
}
// Enviar respuesta al cliente
mysqli_close($conn);
echo json_encode(['success' => true]);
?>