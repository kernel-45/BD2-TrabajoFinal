function mostrarFormulario(scriptEjecutable) {
    const formHTML = `
        <style>
            /* Estilo general para el formulario */
            #miFormulario {
                background-color: rgb(141, 112, 112);
                color: black;
                padding: 20px;
                max-width: 400px;
                margin: auto; /* Centra el formulario horizontalmente */
                margin-top: 20px; /* Añade un margen en la parte superior para separarlo del elemento anterior */
                margin-bottom: 20px; /* Añade un margen en la parte inferior para separarlo del siguiente elemento */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            #miFormulario label {
                display: block;
                margin-bottom: 5px;
            }
            
            #miFormulario input,
            #miFormulario select {
                width: calc(100% - 20px); /* Ancho del 100% con un ajuste para el relleno */
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box; /* Incluye el relleno en el ancho total */
            }
            
            #miFormulario button {
                background-color: rgb(161, 132, 132);
                color: black;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            
            #miFormulario button:hover {
                background-color: rgb(141, 112, 112);
            }
            
            /* Estilo para resaltar campos requeridos no completados */
            #miFormulario.invalid-form [required]:invalid {
                border: 1px solid red;
            }
        </style>
        <form id="miFormulario" method="post" action="${scriptEjecutable}">
            CP: <input type="text" name="cp" required pattern="[0-9]{5}" placeholder="Escriba un número de 5 dígitos"><br>
            Localidad: <input type="text" name="localidad" required><br>
            Tipo vía: <select name="tipo_via" required>
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
            Vía: <input type="text" name="via" required><br>
            Número: <input type="number" name="numero" required min="0" placeholder="Escriba un número natural"><br>
            Portal: <input type="text" name="portal"><br>
            Escalera: <input type="text" name="escalera"><br>
            Piso: <input type="number" name="piso" min="0" placeholder="Escriba un número natural"><br>
            Puerta: <input type="text" name="puerta"><br>
            <button class="boton-enviar">Enviar</button>
        </form>
    `;

    document.body.insertAdjacentHTML('beforeend', formHTML);

    document.body.addEventListener('click', function(event) {
        // Delegación de eventos para manejar clics en botones de envío
        if (!event.target.classList.contains('boton-enviar')) {
            return;
        }
        event.preventDefault();
        if (!event.target.form.checkValidity()) {
            event.target.form.classList.add('invalid-form');
            alert('Por favor, completa todos los campos requeridos.');
        } else {
            event.target.form.classList.remove('invalid-form');
            enviarFormulario(event.target.form);
        }
    });
}

function enviarFormulario(formulario) {
    // Obtener los valores del formulario
    const formData = new FormData(formulario);

    // Realizar la solicitud AJAX
    fetch(formulario.action, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(Object.fromEntries(formData)),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // Manejar la respuesta del servidor aquí
        if (data.success) {
            // Redirigir o realizar otras acciones según sea necesario
            alert('Operación exitosa');
            window.location.href = '../estimazon.html';
        } else {
            alert('Error al enviar el formulario: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Hubo un problema al procesar la solicitud. Por favor, inténtalo de nuevo más tarde.');
    });
}