$(document).ready(function () {
  /* Funcion para Ingresar Solo los Numeros en el Input de Telefono */
  $(function () {
    $("input[name='clientPhone']").on("input", function (e) {
      $(this).val(
        $(this)
          .val()
          .replace(/[^0-9]/g, "")
      );
    });
  });
  /* Accion para Guardar o Actualizar Informacion del Cliente en la Base de Datos */
  $('#formClient').submit(function (e) { 
    e.preventDefault();
    sfdni = $('#clientDni').val(); // Numero de DNI Sin Formatear
    sfphone = $('#clientPhone').val(); // Numero de Telefono Sin Formatear
    fc = sfdni.charAt(0); // Primer Caracter del DNI
    if (!fc.match(/[a-zA-Z]/)) { // Si el Primer Caracter del DNI no es una Letra Arroja Mensaje de Error
      $('#m_client_cont').removeClass('d-none');
      $('#m_client_text').addClass('text-danger font-weight-bold text-center');
      $('#m_client_text').text('Primer Caracter debe ser una Letra del Alfabeto Indicando la Naturalidad del DNI (V E J G etc)');
      setTimeout(() => {
        $('#m_client_cont').addClass('d-none');
      }, 2000);
      return false;
    }
    if (sfphone.length<10) { // Si el Numero de Telefono no tiene 10 Digitos Arroja Mensaje de Error
      $('#m_client_cont').removeClass('d-none');
      $('#m_client_text').addClass('text-danger font-weight-bold text-center');
      $('#m_client_text').text('El Numero de Telefono debe tener 10 Digitos');
      setTimeout(() => {
        $('#m_client_cont').addClass('d-none');
      }, 2000);
      return false;
    }
    if (sfphone.length == 10) { // Si el Numero de Telefono tiene 10 Digitos Le Agrega el 58 al Comienzo
      sfphone = '58' + sfphone;
    }
    id = $('#clientId').val();
    name = $('#clientName').val();
    nfdni = sfdni.charAt(0) + '-' + sfdni.substring(1); // Numero de DNI Formato Previo
    dni = nfdni.toUpperCase(); // Numero de DNI Formateado
    phone = sfphone.replace(/(\d{2})(\d{3})(\d{3})(\d{4})/, '+($1) $2-$3-$4'); // Numero de Telefono Formateado
    phonealt = $('#clientPhoneAlt').val();
    email = $('#clientEmail').val();    
    dato = new FormData();
    dato.append('id', id);
    dato.append('name', name);
    dato.append('dni', dni);
    dato.append('phone', phone);
    dato.append('phone', phone);
    dato.append('phonealt', phonealt);
    dato.append('email', email);    
    $.ajax({
      url: 'clientes_controller.php?op=new_client',
      method: 'POST',
      dataType: "json",
      data: dato,
      contentType: false,
      processData: false,
      success: function (response) {
        if (response.status == true) {
          Swal.fire({
            icon: "success",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
          $('#client_table').DataTable().ajax.reload();
          $('#formUser')[0].reset();
          $('#newClientModal').modal('hide');
        } else {
          Swal.fire({
            icon: "error",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
        }
        
      }
    });
    
  });
});