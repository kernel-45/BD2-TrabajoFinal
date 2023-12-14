<?php
session_start();
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST["tarjeta"])) { // si todo bien
        $_SESSION["tarjeta"] = $_POST["tarjeta"];
        echo json_encode(["status" => "success", "message" => "Tarjeta seleccionada correctamente"]);
    } else { // si error
        echo json_encode(["status" => "error", "message" => "Error: Tarjeta no proporcionada"]);
    }
} else { // si error
    echo json_encode(["status" => "error", "message" => "Error: Método de solicitud no permitido"]);
}
?>
