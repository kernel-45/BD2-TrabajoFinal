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
        <label for="opciones" class="subtitulo">Selecciona una tarjeta de crédito para la compra:</label>
        <select class="boton" id="opciones" name="opciones">
        <option class="boton" value="default">Tarjeta de crédito</option>;
        <?php
        /**
         * Gestiona el error de que un valor no sea encontrado
         */
        function error_valor_null($valor) {
            if (!$valor) { ?> <script>
                alert("Ha habido un error accediendo a las tarjetas de crédito");
                goPantallaPrincipal(1); </script> <?php
                exit;
            } 
        }
        // Conexión a la base de datos
        $conn = mysqli_connect("localhost","root","") or die("error a conexió amb servidor");
        $db = mysqli_select_db($conn, "estimazon") or die("error a conexió amb bd");
        session_start(); 
        
        $consulta_tarjetas = // selecciona los tarjetas que tenga
        "SELECT r_comprador_tarjetadecredito.numTarjeta 
            FROM r_comprador_tarjetadecredito 
            WHERE r_comprador_tarjetadecredito.idComprador = ".$_SESSION['idUser'];
        $tarjetas = mysqli_query($conn, $consulta_tarjetas); // ejecuto el query
        error_valor_null($tarjetas); // si error
        // mientras queden tarjetas por mostrar
        while ($tarjeta = mysqli_fetch_array($tarjetas)) { // imprime todos las tarjetas
            echo '<option class="boton" value="'.$tarjeta['numTarjeta'].'">'.$tarjeta['numTarjeta'].'</option>';
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
            const idTarjetaSeleccionada = selectedOption.getAttribute("value");
            if (idTarjetaSeleccionada == 'default') {
                return;
            }
            // Enviar la dirección seleccionada al servidor mediante una petición AJAX
            const xhr = new XMLHttpRequest();
            const url = "tarjeta_credito_indicada.php"; // Ajusta la URL según tu estructura de archivos
            const data = "tarjeta=" + encodeURIComponent(idTarjetaSeleccionada);

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
