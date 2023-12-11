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

function goPantallaPrincipal(profundidad) {
  window.location.href = "../".repeat(profundidad) + "estimazon.html";
}

function actualizarBotones() {
  // Realizar una solicitud Ajax al servidor para obtener el tipo de usuario
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {console.log("maiu");
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
  xhr.open('GET', 'get_tipoUser.php', true);
  xhr.send();
};

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