/**
 * Elimina todas las cookies guardadas (cierra sesión) y lleva a la pantalla principal con la sesión cerrada.
 * 
 * @param {number} profundidad - La cantidad de carpetas en las que está el fichero que llama la función. La página principal tiene profundidad 0.
 */
function resetAllCookies(profundidad) {
  var cookies = document.cookie.split(";");
  for (var i = 0; i < cookies.length; i++) {
    var cookie = cookies[i];
    var eqPos = cookie.indexOf("=");
    var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
    document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  }
  
  if (profundidad == 0) {
      actualizarBotones();
  } else {
      goPantallaPrincipal(profundidad);
  }
}

/**
 * Lleva a la pantalla principal indicando cuántas carpetas hay entre el fichero que lo llama y la página principal.
 * 
 * @param {number} profundidad - La cantidad de carpetas en las que está el fichero que llama la función.
 */
function goPantallaPrincipal(profundidad) {
  window.location.href = "../".repeat(profundidad) + "estimazon.html";
}

/**
 * Actualiza los botones de la pantalla principal dependiendo de si se ha iniciado sesión como comprador o no
 */
function actualizarBotones() {
  // Realizar una solicitud Ajax al servidor para obtener el tipo de usuario
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
          var tipoUsuario = xhr.responseText;
          // Verificar y ajustar la visibilidad de los elementos según el tipo de usuario
          if (tipoUsuario == 'comprador') {
            document.getElementById('botones-comprador').style.visibility = 'visible';
            document.getElementById('botones-usuario').style.visibility = 'hidden';
          } else {
            document.getElementById('botones-comprador').style.visibility = 'hidden';
            document.getElementById('botones-usuario').style.visibility = 'visible';
          }
      }
  };
  // Realizar la solicitud al archivo PHP que obtiene el tipo de usuario
  xhr.open('GET', 'inicio-sesion/get_tipoUser.php', true);
  xhr.send();
};

/**
 * Añade un listener que una vez se pulse el botón 'enviar' procesa los datos del formulario, los envía
 * al fichero que tenga asociado el formulario y si no ha habido error redirige a la pantalla principal.
 * 
 * @param {number} profundidad - La cantidad de carpetas en las que está el fichero que llama la función.
 */
function procesarFormulario(profundidad){
    document.body.addEventListener('click', function(event) {
        // Delegación de eventos para manejar clics en botones de envío
        if (!event.target.classList.contains('boton-enviar')) {
            return;
        } // si se ha pulsado el botón enviar sigue
        event.preventDefault();
        if (!event.target.form.checkValidity()) { // si no es válido
            event.target.form.classList.add('invalid-form');
            alert('Por favor, completa todos los campos requeridos.');
            return;
        }// si se han completado correctamente envía el formulario
        event.target.form.classList.remove('invalid-form');
        let formulario = event.target.form
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
            if (!response.ok) { // si error de conexión
                throw new Error('Network response was not ok');
            }
            return response.json(); // si no sigue
        })
        .then(data => {
            // si ha ido bien
            if (data.success) {
                // redirige a la pantalla principal
                alert('Operación exitosa');
                goPantallaPrincipal(profundidad);
            } else { // si ha ido mal lo avisa
                alert('Error al enviar el formulario: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error); // si ha ocurrido un error inesperado
            alert('Hubo un problema al procesar la solicitud. Por favor, inténtalo de nuevo más tarde.');
        });
    });
}