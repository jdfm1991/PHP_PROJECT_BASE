$(document).ready(function () {
  /* Funcion para Ingresar Solo los Numeros en el Input de Telefono */
  $(function () {
    $("input[name='exchangeRate']").on("input", function (e) {
      $(this).val(
        $(this)
          .val()
          .replace(/[^0-9.]/g, "")
      );
    });
  });
  /* Funcion para Cargar Select de los Tipos de Cambio */
  const loadSelectExchangeRatesDB = async () => {
    try {
      const response = await fetch('tasacambiaria_controller.php?op=get_exchange_rate_types');
      const data = await response.json();
      const container = document.getElementById('exchange_rate');
      container.innerHTML = '';
      data.forEach((opt, idx) => {
        const option = document.createElement('option');
        option.setAttribute('value', opt.id);
        option.innerHTML = `${opt.acr}`;
        container.appendChild(option);
      })
    } catch (error) {
      console.log('Error', error);
    }
  };
  /* Arrow Function Que se Encarga de Cargar los Datos de todas las Tasas en la Tabla */
  const loadDataTableRates = async () => {
    const table = $('#rate_table').DataTable({
      responsive: true,
      scrollX: true,
      autoWidth: false,
      paging: true,
      lengthChange: true,
      searching: true,
      ordering: true,
      displayLength: 10,
      lengthMenu: [10, 25, 50, 100],
      pageLength: 10,
      info: true,
      language: {
        lengthMenu: "Mostrar _MENU_ registros por pagina",
        zeroRecords: "No se encontraron registros",
        info: "Mostrando pagina _PAGE_ de _PAGES_",
        infoEmpty: "No hay registros disponibles",
        infoFiltered: "(filtrado de _MAX_ registros totales)",
        search: "Buscar:",
        paginate: {
          first: "Primero",
          last: "Ultimo",
          next: "Siguiente",
          previous: "Anterior"
        },
        loadingRecords: "Cargando...",
        processing: "Procesando..."
      },
      ajax: {
        url: "tasacambiaria_controller.php?op=get_list_rates",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "date" },
        { data: "exchange" },
        { data: "type" },
        {
          data: "id", render: (data, _, __, meta) =>
            `<button id="b_edit_client" class="btn btn-outline-primary btn-sm" data-value="${data}"><i class="fa fa-edit"></i></button>
          <button id="b_delete_client" class="btn btn-outline-danger btn-sm" data-value="${data}"><i class="fa fa-trash"></i></button>`, className: "text-center"
        }
      ]
    });

  }
  $('#newRate').click(function (e) {
    e.preventDefault();
    loadSelectExchangeRatesDB();
  });
  /* Accion para Guardar o Actualizar Informacion del Cliente en la Base de Datos */
  $('#formNewRate').submit(function (e) {
    e.preventDefault();   
    id = $('#idRate').val();
    rate = $('#exchangeRate').val();
    date = $('#dateRate').val();
    type = $('#exchange_rate').val();
    dato = new FormData();
    dato.append('id', id);
    dato.append('rate', rate);
    dato.append('date', date);
    dato.append('type', type);
    $.ajax({
      url: 'tasacambiaria_controller.php?op=new_rate',
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
  /* Accion para Eliminar Usuario de la Lista de usuario Visibles */
  $(document).on('click', '#b_edit_client', function () {
    var id = $(this).data('value');
    $.ajax({
      url: 'clientes_controller.php?op=get_data_client',
      method: 'POST',
      dataType: 'json',
      data: { id: id },
      success: function (response) {
        $.each(response, function (idx, opt) {
          $('#clientId').val(opt.id);
          $('#clientName').val(opt.name);
          $('#clientDni').val(opt.dni);
          $('#clientPhone').val(opt.phone);
          $('#clientPhoneAlt').val(opt.phonealt);
          $('#clientEmail').val(opt.email);
        });
        $('.modal-title').text('Editar Informacion del Cliente');
        $('#newClientModal').modal('show');
      }
    });
  })
  /* Accion para Eliminar Usuario de la Lista de usuario Visibles */
  $(document).on('click', '#b_delete_client', function () {
    var id = $(this).data('value');
    Swal.fire({
      title: 'Estas seguro de eliminar el cliente?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, Eliminar!'
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: 'clientes_controller.php?op=delete_client',
          method: 'POST',
          dataType: 'json',
          data: { id: id },
          success: function (response) {
            if (response.status == true) {
              Swal.fire({
                icon: "success",
                title: response.message,
                showConfirmButton: false,
                timer: 1500
              });
              $('#client_table').DataTable().ajax.reload();
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
      }
    })

  })
  loadDataTableRates();
});