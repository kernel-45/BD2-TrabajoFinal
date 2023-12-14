<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Datos</title>
    <script src="formulario.js"></script>
    <script src="../funciones.js"></script>
</head>
<body class="contenedor-estimazon">
    <div class="titulo"> Estimazon </div>
    <div class="producto">
        <label for="opciones" class="subtitulo">Selecciona un domicilio:</label>
        <select class="boton" id="opciones" name="opciones">
        <?php
        // Conexión a la base de datos
        $conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
        $db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");
        session_start();    
        $consulta_domicilios =
        "SELECT r_tienedomicilioen.idZona
            FROM r_tienedomicilioen
            WHERE r_tienedomicilioen.idComprador = ".$_SESSION['idUser'];
        $domicilios = mysqli_query($conn, $consulta_domicilios);
        if (!$domicilios) { echo "Ha habido un error"; exit; }
        while ($domicilio = mysqli_fetch_array($domicilios)) {
            $direccion = "";
            $consulta_zonas =
            "SELECT zona.idZonaPadre, zona.nombreZona
                FROM zona
                WHERE zona.idZona = ".$domicilio['idZona'];
            $zonas = mysqli_query($conn, $consulta_zonas);
            if (!$zonas) { echo "Ha habido un error"; exit; }
            while ($zona = mysqli_fetch_array($zonas)) {
                $direccion = $zona['nombreZona']." ".$direccion;
                if (!$zona['idZonaPadre']) { // si es null ya ha llegado al final
                    break;
                }
                $consulta_zonas =
                "SELECT zona.idZonaPadre, zona.nombreZona
                    FROM zona
                    WHERE zona.idZona = ".$zona['idZonaPadre'];
                $zonas = mysqli_query($conn, $consulta_zonas);
            }
            echo '<option class="boton" value="'.$domicilio['idZona'].'">'.$direccion.'</option>';
        }
        // Cerrar la conexión a la base de datos
        mysqli_close($conn);
        ?>
    </select>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const select = document.getElementById("opciones");

        select.addEventListener("change", function() {
            const selectedOption = this.options[this.selectedIndex];
            const idDireccionSeleccionada = selectedOption.getAttribute("value");
            const direccionSeleccionada = selectedOption.text;
            // Enviar la dirección seleccionada al servidor mediante una petición AJAX
            const xhr = new XMLHttpRequest();
            const url = "guardar_domicilio.php"; // Ajusta la URL según tu estructura de archivos
            const data = "direccion=" + encodeURIComponent(direccionSeleccionada) + "&idZona=" + encodeURIComponent(idDireccionSeleccionada);

            xhr.open("POST", url, true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        const response = JSON.parse(xhr.responseText);
                        alert(response.message);
                        goPantallaPrincipal(1);
                    } else {
                        alert("Error en la solicitud al servidor");
                    }
                }
            };

            xhr.send(data);
        });
    });
</script>

</html>
