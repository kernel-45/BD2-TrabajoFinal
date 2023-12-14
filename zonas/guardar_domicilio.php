<?php
session_start();
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST["direccion"])) { // si todo bien
        $_SESSION["direccion"] = $_POST["direccion"];
        $_SESSION["idZona"] = $_POST["idZona"];
        echo json_encode(["status" => "success", "message" => "Dirección seleccionada correctamente"]);
    } else { // si error
        echo json_encode(["status" => "error", "message" => "Error: Dirección no proporcionada"]);
    }
} else { // si error
    echo json_encode(["status" => "error", "message" => "Error: Método de solicitud no permitido"]);
}
?>
