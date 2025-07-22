$(document).ready(function () {
  /* Arrow Function Que se Encarga de Cargar los Datos de las Cuentas por Cobrar en la Tabla */
  const loadDataTableAccountsReceivable = async () => {
    const table = $('#cxc_table').DataTable({
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
        url: "cxc_controller.php?op=get_list_accounts_receivable",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "date" },
        { data: "expiration" },
        { data: "number" },
        { data: "name" },
        { data: "balance" },
        {
          data: "id", render: (data, _, __, meta) =>
            `<button id="b_reg_payment" class="btn btn-outline-primary btn-sm" data-value="${data}"><i class="bi bi-credit-card-2-back"></i></button>`, className: "text-center"
        }
      ]
    });
  }
  /* Accion para Eliminar Usuario de la Lista de usuario Visibles */
  $(document).on('click', '#b_reg_payment', function () {
    var id = $(this).data('value');
    $.ajax({
      url: 'cxc_controller.php?op=get_data_account_receivable',
      method: 'POST',
      dataType: 'json',
      data: { id: id },
      success: function (response) {
        const DateNow = new Date();
        const opciones = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        const date = DateNow.toLocaleDateString('es-VE', opciones);
        $('#idcx').val(response.id);
        $('.modal-title').text('Datos de Cuentas');
        $('#l_date').text('Fecha de pago: ');
        $('#t_date').text(date);
        $('#l_name').text('Nombre de Inquilino: ');
        $('#t_name').text(response.name);
        $('#l_account').text('Concepto: ');
        $('#t_account').text(response.concept + ' Recibo N°: ' + response.number);
        $('#l_detail').text('Fecha de Vencimiento: ');
        $('#t_detail').text(response.expiration);
        $('#cont_amunt_cxp').hide();
        $('#cont_amunt_cxc').removeClass('d-none');
        $('#t_balance').val(response.balance);
        $('#cxpPayModal').modal('show');
      }
    });
  })
  $('#refercxc').keyup(function (e) {
    refer = $(this).val();
    $.ajax({
      url: URI + 'banco/banco_controller.php?op=get_banking_movement',
      method: 'POST',
      dataType: 'json',
      data: { refer: refer },
      success: function (response) {
        $("#listrefer").empty();
        $.each(response, function (idx, opt) {
          $("#listrefer").append(`<option value="${opt.refer}">${opt.amount} - ${opt.date}`);
        });
      }
    });
  });

  $('#refercxc').click(function (e) {
    e.preventDefault();
    refer = $(this).val();
    if (refer == '') {
      return false;
    }
    $.ajax({
      url: URI + 'banco/banco_controller.php?op=get_banking_movement',
      method: 'POST',
      dataType: 'json',
      data: { refer: refer },
      success: function (response) {
        $.each(response, function (idx, opt) {
          $('#refercxc').val(opt.refer);
          $('#datepaycxc').val(opt.date);
          $('#amountpaycxc').val(opt.amount);
          $('#ratepaycxc').val(opt.rate);
          $('#amountpaycxcd').val(opt.amountd);
        });
      }
    });
  });

  /* Accion para Guardar o Actualizar Informacion del Cliente en la Base de Datos */
  $('#formExpensePay').submit(function (e) {
    e.preventDefault();
    id = $('#idSuplier').val();
    name = $('#nameSuplier').val();
    link = $('#selectClient').val();
    dato = new FormData();
    dato.append('id', id);
    dato.append('name', name);
    dato.append('link', link);
    $.ajax({
      url: 'proveedores_controller.php?op=new_supplier',
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
          $('#supplier_table').DataTable().ajax.reload();
          $('#formNewSuplier')[0].reset();
          $('#newSuplierModal').modal('hide');
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

  loadDataTableAccountsReceivable();
});