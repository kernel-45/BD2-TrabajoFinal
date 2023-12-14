<!DOCTYPE html>
<?php
// Crear conexión
$conn = new mysqli("localhost", "root", "", "Estimazon");
session_start();
$id = $_SESSION['idUser'];
// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
<html>

<head>
    <title>Seguimiento del pedido</title>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <link rel="stylesheet" type="text/css" href="../css/estilosControlador.css">
    <style>
        table {
            border: 1px solid black;
            width: 100%;
            padding: 5%;
        }

        th,
        td {
            border: 1px solid black;
            text-align: left;
            padding: 8px;
        }
    </style>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['asignarEmpresa'])) {
        $idPedido = $_POST['idPedido'];
        $idEmpresaSeleccionada = $_POST['opcionSeleccionada'];
        // Query para actualizar la base de datos
        $sqlInsert = "UPDATE pedido
                        SET idRepartidor = ( SELECT repartidor.idPersona 
                                                FROM repartidor JOIN empresadistribuidora 
                                                ON repartidor.idEmpresa = empresadistribuidora.idEmpresa
                                                WHERE empresadistribuidora.nombreEmpresa = '$idEmpresaSeleccionada'
                                                ORDER BY RAND()
                                                LIMIT 1)
                         WHERE idPedido = $idPedido;";

        if ($conn->query($sqlInsert) === TRUE) {
            echo "Empresa asignada con éxito";
        } else {
            echo "Error: " . $sqlInsert . "<br>" . $conn->error;
        }

    }
    ?>
</head>

<body>
    <div class="titulo">
        ESTIMAZON
        <div class="botones">
            <button class="boton" onclick=resetAllCookies(1)>Cerrar sesión</button>
            <button class="boton" id="perfilControlador" onclick="window.location.href='perfilControlador.php'">
                <img src="../vendedor/user.png" alt="User" class="icono-user" />Mi perfil
            </button>
        </div>
    </div>
    <div class="contenedor-principal">
        <div class="subtitulo">Bienvenido, controlador
            <?php echo $id ?>
        </div>
        <div class="subtitulo">Aquí están todos los pedidos que no tienen empresa distribuidora asignada</div>
        <?php
        $sql = "SELECT idPedido, nombreZona FROM 
		                pedido JOIN zona 
                        ON idRepartidor IS NULL 
                        AND pedido.idZona = zona.idZona";
        $result = mysqli_query($conn, $sql);
        if ($result->num_rows > 0) {
            ?>
            <table>
                <tr>
                    <td>ID pedido </td>
                    <td>Nombre de la zona </td>
                    <td>Asignar empresa</td>
                </tr>
                <!-- vuelve a abrir php -->
                <?php
                // Procesar cada fila de resultado
                $queryEmpresas = "SELECT nombreEmpresa FROM empresadistribuidora";
                while ($row = mysqli_fetch_array($result)) {
                    $resultadoSelect = mysqli_query($conn, $queryEmpresas);
                    $idPedido = $row["idPedido"];
                    $nombreZona = $row["nombreZona"];
                    echo "<tr>";
                    echo "<td> $idPedido</td>";
                    echo "<td> $nombreZona</td>";
                    echo "<td>";
                    echo "<form method='post'>";  
                    echo "<select name='opcionSeleccionada' style='width: 200px;'>";
                    while ($fila = mysqli_fetch_assoc($resultadoSelect)) {
                        echo "<option value='" . $fila['nombreEmpresa'] . "'>" . $fila['nombreEmpresa'] . "</option>";
                    }
                    echo "</select>";
                    echo "<input type='hidden' name='idPedido' value='" . $idPedido . "'>";
                    echo "<button type='submit' name='asignarEmpresa'>Asignar</button>";
                    echo "</form>";
                    echo "</td>";
                    echo "</tr>";
                }
        }
        ?>

    </div>

</body>

</html>