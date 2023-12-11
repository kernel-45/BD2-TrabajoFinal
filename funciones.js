function goPantallaPrincipal(profundidad) {
  window.location.href = "../".repeat(profundidad) + "estimazon.html";
}

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

function procesarFormulario(profundidad){
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
        enviarFormulario(profundidad, event.target.form);
    }
});


function enviarFormulario(profundidad, formulario) {
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
            goPantallaPrincipal(profundidad);
        } else {
            alert('Error al enviar el formulario: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Hubo un problema al procesar la solicitud. Por favor, inténtalo de nuevo más tarde.');
    });
}
}