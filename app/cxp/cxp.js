$(document).ready(function () {
  const DateNow = new Date();
  let remaining = 0;
  const datalist = document.getElementById('listrefer');
  /* Arrow Function Que se Encarga de Cargar los Datos del Cliente en la Tabla */
  const loadDataTableAccountsPayable = async () => {
    const table = $('#cxp_table').DataTable({
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
        url: "cxp_controller.php?op=get_list_accounts_payable",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "date" },
        { data: "suplier" },
        { data: "expense" },
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
      url: 'cxp_controller.php?op=get_data_expense',
      method: 'POST',
      dataType: 'json',
      data: { id: id },
      success: function (response) {
        const fecha = new Date(response.date + 'T00:00:00');
        const opciones = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        const date = fecha.toLocaleDateString('es-VE', opciones);
        $('#idcx').val(response.id);
        $('#t_date').text(date);
        $('#t_suplier').text(response.suplier);
        $('#t_account').text(response.account);
        $('#t_detail').text(response.expense);
        $('#t_balance').val(response.balance);
        $('#cxpPayModal').modal('show');
      }
    });
  })
  $('#refercxc').keyup(function (e) {
    refer = $(this).val();
    $.ajax({
      url: URI + 'banco/banco_controller.php?op=get_banking_movement_expenses',
      method: 'POST',
      dataType: 'json',
      data: { refer: refer },
      success: function (response) {
        $("#listrefer").empty();
        $.each(response, function (idx, opt) {
          $("#listrefer").append(`<option value="${opt.refer}">`);
        });
      }
    });
  });
  /* Accion para marcar la casilla de los gastos fijos */
  $("#dollarpay").change(function () {
    if ($(this).is(":checked")) {
      $("#dollarpay").prop('checked', true);
      $('#amountpaycxcd').attr('disabled', false);
      $('#refercxc').attr('disabled', true);
      $('#refercxc').val('DIVISA');
      $('#ratepaycxc').val(0.00);
      $('#amountpaycxc').val('');
    } else {
      $("#dollarpay").prop('checked', false);
      $('#amountpaycxcd').attr('disabled', true);
      $('#refercxc').attr('disabled', false);
      $('#refercxc').val('');
      $('#datepaycxc').val('');
      $('#amountpaycxcd').val('');
      $('#ratepaycxc').val('');
    }
  });
  $('.x').click(function (e) {
    e.preventDefault();
    $('#formExpensePay')[0].reset();
  });
  $('#refercxc').click(function (e) {
    e.preventDefault();
    refer = $(this).val();
    if (refer == '') {
      return false;
    }
    $.ajax({
      url: URI + 'banco/banco_controller.php?op=get_banking_movement_expenses',
      method: 'POST',
      dataType: 'json',
      data: { refer: refer },
      success: function (response) {
        balance = $('#t_balance').val();
        $.each(response, function (idx, opt) {
          $('#idrefer').val(opt.id);
          $('#refercxc').val(opt.refer);
          $('#datepaycxc').val(opt.date);
          $('#amountpaycxc').val(opt.amount);
          $('#ratepaycxc').val(opt.rate);
          $('#amountpaycxcd').val(opt.dollar);
          remaining = (balance - opt.dollar).toFixed(2)
        });
        if (remaining > 0) {
          $('#notecxc').text('Despues Del Pago Quedara Un Saldo Pendiente de :' + remaining + '$ ');
        } else {
          $('#notecxc').text('Despues Del Pago Quedara Un Saldo A Favor de :' + (remaining * -1) + '$ ');
        }
      }
    });
  });
  $('#amountpaycxcd').keyup(function (e) {
    payd = $(this).val();
    $('#amountpaycxcd').val(payd);
    balance = $('#t_balance').val();
    remaining = (balance - payd).toFixed(2)
    if (remaining > 0) {
      $('#notecxc').text('Despues Del Pago Quedara Un Saldo Pendiente de :' + remaining + '$ ');
    } else {
      $('#notecxc').text('Despues Del Pago Quedara Un Saldo A Favor de :' + (remaining * -1) + '$ ');
    }
  });
  /* Accion para Guardar o Actualizar Informacion del Cliente en la Base de Datos */
  $('#formExpensePay').submit(function (e) {
    e.preventDefault();
    account = $('#idcx').val();
    date = DateNow.getFullYear() + '-' + String(DateNow.getMonth() + 1).padStart(2, '0') + '-' + String(DateNow.getDate()).padStart(2, '0');
    idrefer = $('#idrefer').val();
    refer = $('#refercxc').val();
    rate = $('#ratepaycxc').val();
    payd = $('#amountpaycxcd').val();
    balance = $('#t_balance').val();
    check = $('#dollarpay').is(':checked');
    dato = new FormData();
    dato.append('account', account);
    dato.append('date', date);
    dato.append('idrefer', idrefer);
    dato.append('refer', refer);
    dato.append('rate', rate);
    dato.append('payd', payd);
    dato.append('balance', balance);
    dato.append('remaining', remaining);
    dato.append('check', check);
    $.ajax({
      url: 'cxp_controller.php?op=new_pay_ar',
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
          $('#cxp_table').DataTable().ajax.reload();
          $('#formExpensePay')[0].reset();
          $('#notecxc').text('');
          $('#cxpPayModal').modal('hide');
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




  loadDataTableAccountsPayable();
});