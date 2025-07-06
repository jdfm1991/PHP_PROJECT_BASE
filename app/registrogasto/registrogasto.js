$(document).ready(function () {
  $('#quota_content').hide();
  /* Funcion para Cargar Select de los proveedores */
  const loadDataSelectSupplier = async (id) => {
    try {
      const response = await fetch(URI + 'proveedores/proveedores_controller.php?op=get_list_suppliers');
      const data = await response.json();
      const container = document.getElementById('suplierExpense');
      container.innerHTML = '';
      const defaultOption = document.createElement('option');
      defaultOption.setAttribute('value', '');
      defaultOption.innerHTML = 'Proveedor...';
      container.appendChild(defaultOption);

      data.forEach((opt, idx) => {

        const option = document.createElement('option');
        if (id == opt.id) {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.name}`;
          option.setAttribute('selected', 'selected');
          container.appendChild(option);
        } else {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.name}`;
          container.appendChild(option);
        }
      })
    } catch (error) {
      console.log('Error', error);
    }
  }
  /* Funcion para Cargar Select de las cuentas de gastos */
  const loadDataSelectExpenseAccounts = async (id) => {
    try {
      const response = await fetch(URI + 'cuentagasto/cuentagasto_controller.php?op=get_list_expense_accounts');
      const data = await response.json();
      const container = document.getElementById('accountExpense');
      container.innerHTML = '';
      const defaultOption = document.createElement('option');
      defaultOption.setAttribute('value', '');
      defaultOption.innerHTML = 'Cuentas de Gastos...';
      container.appendChild(defaultOption);
      data.forEach((opt, idx) => {
        const option = document.createElement('option');
        if (id == opt.id) {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.type}`;
          option.setAttribute('selected', 'selected');
          container.appendChild(option);
        } else {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.type}`;
          container.appendChild(option);
        }
      })
    } catch (error) {
      console.log('Error', error);
    }
  }
  /* Funcion para listar todos los unidades departamentales existentes en la base de datos */
  const LoadDataTableExpenseAccount = async () => {
    const table = $('#expense_account_table').DataTable({
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
        url: "cuentagasto_controller.php?op=get_list_expense_accounts",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "type" },
        { data: "code" },
        { data: "fixed" },
        { data: "expense" },
        {
          data: "id", render: (data, _, __, meta) =>
            `<button id="b_edit_expense_account" class="btn btn-outline-primary btn-sm" data-value="${data}"><i class="fa fa-edit"></i></button>
            <button id="b_trash_expense_account" class="btn btn-outline-danger btn-sm" data-value="${data}"><i class="bi bi-trash3"></i></button>`, className: "text-center"
        }
      ]
    });
  }
  /* Accion para Guardar o Actualizar Informacion de los Gastos en la Base de Datos */
  $('#formExpense').submit(function (e) {
    e.preventDefault();
    id = $('#idExpense').val();
    typed = $('#typeExpense').val();
    code = $('#codeExpense').val();
    fixed = $('#fixedExpense').is(':checked');
    expense = $('#nameExpense').val();
    dato = new FormData();
    dato.append('id', id);
    dato.append('type', typed);
    dato.append('code', code);
    dato.append('fixed', fixed);
    dato.append('expense', expense);
    $.ajax({
      url: 'registrogasto_controller.php?op=new_expense',
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
          $('#expense_account_table').DataTable().ajax.reload();
          $('#formNewExpense')[0].reset();
          $('#newExpenseModal').modal('hide');
        } else {
          if (response.error === '400') {
            console.log(response);
            $('#messegecont').removeClass('d-none');
            $('#messegetext').text(response.message);
            setTimeout(function () {
              $('#messegecont').addClass('d-none');
            }, 3000);
          } else {
            Swal.fire({
              icon: "error",
              title: response.message,
              showConfirmButton: false,
              timer: 1500
            });

          }
        }
      }
    });
  });
  /* Funcion Para Cargar El Contenido del Selectores del Modal "newExpenseModal" */
  $('#newExpense').click(function (e) {
    e.preventDefault();
    $('.modal-title').text('Nuevo Gasto');
    loadDataSelectSupplier();
    loadDataSelectExpenseAccounts();
  });
  $('#datailExpense').keyup(function (e) {
    letters = $(this).val().length;
    $('#count').removeClass('bg-success bg-warning bg-danger test-black');
    $('#count').addClass('badge');
    $('#count').addClass('text-white');
    $('#count').addClass('font-weight-bold');
    if (letters > 0 && letters <= 80) {
      $('#count').addClass('bg-success');
      $('#count').text(letters + ' / 150');
    }
    if (letters >= 81 && letters <= 130) {
      $('#count').addClass('bg-warning');
      $('#count').addClass('text-black');
      $('#count').text(letters + ' / 150');
    }
    if (letters >= 131) {
      $('#count').addClass('bg-danger');
      $('#count').text('Le queda pocos caracteres ' + letters + ' / 150');
    }

  });
  /* Accion para marcar la casilla de los gastos fijos */
  $("#quotaExpense").change(function () {
    if ($(this).is(":checked")) {
      $('#quota_content').show();
    } else {
      $('#quota_content').hide();
    }
  });
  /* Accion Para Editar Una Cuenta de Gasto Existente En La Lista de Cuentas de Gastos*/
  $(document).on('click', '#b_edit_expense_account', function (e) {
    e.preventDefault();
    var id = $(this).data('value');
    $.ajax({
      url: 'cuentagasto_controller.php?op=get_data_expense_account',
      method: 'POST',
      dataType: 'json',
      data: { id: id },
      success: function (response) {
        loadDataSelectTypeExpenses(response.type);
        $('#idExpense').val(response.id);
        $('#codeExpense').val(response.code);
        if (response.fixed == 1) {
          $("#fixedExpense").prop('checked', true);
        } else {
          $("#fixedExpense").prop('checked', false);
        }
        $('#nameExpense').val(response.expense);
        $('#typeExpense').attr('disabled', true);
        $('#newExpenseModal').modal('show');
      }
    });
  })
  /* Accion para cambiar el estado de la disponibilidad de unidad departamental */
  $(document).on('click', '#b_trash_expense_account', function (e) {
    e.preventDefault();
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
          url: 'cuentagasto_controller.php?op=delete_expense_account',
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
              $('#expense_account_table').DataTable().ajax.reload();
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
  LoadDataTableExpenseAccounts();
});