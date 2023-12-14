<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Datos</title>
    <script src="../funciones.js"></script>
</head>
<body class="contenedor-estimazon">
<div class="titulo">
    ESTIMAZON
    <div class="botones">
        <button class="boton" onclick=resetAllCookies(1)>Cerrar sesión</button>
        <button class="boton" id="perfil" onclick="window.location.href='../comprador/perfil.html'">
            Volver
        </button>
    </div>
</div>
    <div class="producto">
        <label for="opciones" class="subtitulo">Selecciona un domicilio para la entrega:</label>
        <select class="boton" id="opciones" name="opciones">
        <?php
        /**
         * Gestiona el error de que un valor no sea encontrado
         */
        function error_valor_null($valor) {
            if (!$valor) { ?> <script>
                alert("Ha habido un error accediendo a los domicilios");
                goPantallaPrincipal(1); </script> <?php
                exit;
            } 
        }
        // Conexión a la base de datos
        $conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
        $db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");
        session_start(); 
        
        $consulta_domicilios = // selecciona los domicilios que tenga
        "SELECT r_tienedomicilioen.idZona 
            FROM r_tienedomicilioen 
            WHERE r_tienedomicilioen.idComprador = ".$_SESSION['idUser'];
        $domicilios = mysqli_query($conn, $consulta_domicilios); // ejecuto el query
        error_valor_null($domicilios); // si error
        // mientras queden domicilios por mostrar
        while ($domicilio = mysqli_fetch_array($domicilios)) {
            $consulta_zonas = // consulta que consigue el id del padre y el nombre del actual
            "SELECT zona.idZonaPadre, zona.nombreZona 
                FROM zona 
                WHERE zona.idZona = ".$domicilio['idZona'];
            $zonas = mysqli_query($conn, $consulta_zonas);
            error_valor_null($zonas); // si error
            $zona = mysqli_fetch_array($zonas); // selecciono la fila
            error_valor_null($zona); // si error
            $direccion = $zona['nombreZona']; // nombre de la dirección comienza con el valor de la hoja
            while ($zona['idZonaPadre']) { // mientras haya una zona por procesar en la dirección
                $consulta_zonas = // misma consulta con la zona actual
                "SELECT zona.idZonaPadre, zona.nombreZona 
                    FROM zona 
                    WHERE zona.idZona = ".$zona['idZonaPadre'];
                $zonas = mysqli_query($conn, $consulta_zonas); // ejecuto query
                error_valor_null($zonas); // si error
                $zona = mysqli_fetch_array($zonas); // selecciono la fila
                error_valor_null($zona); // si error
                $direccion = $zona['nombreZona']." ".$direccion; // concateno el nombre de la zona actual a la dirección
            }
            // una vez llega aquí ha procesado todas las zonas de la dirección e imprime la opción para elegirs
            echo '<option class="boton" value="'.$domicilio['idZona'].'">'.$direccion.'</option>';
        }
        // Cerrar la conexión a la base de datos
        mysqli_close($conn);
        ?>
    </select>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function() { // listener para procesar el listado de domicilios
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
                    } else { // si error
                        alert("Error en la solicitud al servidor");
                    }
                }
            };

            xhr.send(data);
        });
    });
</script>

</html>
