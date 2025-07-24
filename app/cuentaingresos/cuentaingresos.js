$(document).ready(function () {
  const type = document.getElementById('typeExpense');
  /* Funcion para Cargar Select de los tipos de gastos departamentales */
  const loadDataSelectIncomeTypes = async (id) => {
    try {
      const response = await fetch('cuentaingresos_controller.php?op=get_income_type');
      const data = await response.json();
      const container = document.getElementById('typeExpense');
      container.innerHTML = '';
      const defaultOption = document.createElement('option');
      defaultOption.setAttribute('value', '');
      defaultOption.innerHTML = 'Tipos de Ingreso...';
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
  const LoadDataTableIncomeAccounts = async () => {
    const table = $('#income_account_table').DataTable({
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
        url: "cuentaingresos_controller.php?op=get_list_income_accounts",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "type" },
        { data: "code" },
        { data: "income" },
        {
          data: "id", render: (data, _, __, meta) =>
            `<button id="b_edit_income_account" class="btn btn-outline-primary btn-sm" data-value="${data}"><i class="fa fa-edit"></i></button>
            <button id="b_trash_income_account" class="btn btn-outline-danger btn-sm" data-value="${data}"><i class="bi bi-trash3"></i></button>`, className: "text-center"
        }
      ]
    });
  }
  /* Funcion Para Cargar El Contenido del Select "typeExpense" */
  $('#newExpense').click(function (e) {
    e.preventDefault();
    $('#typeExpense').attr('disabled', false);
    $('.modal-title').text('Nueva Cuenta de Ingreso');
    $('#l_select').text('Tipo de Ingreso');
    $('#l_codigo').text('Codigo de Ingreso');
    $('#l_cuenta').text('Cuenta del Ingreso');
    $('#nameExpense').attr('placeholder', 'Ingrese el Nombre de la Cuenta de Ingreso');
    $('#idExpense').val('');
    $('#codeExpense').val('');
    $('#nameExpense').val('');
    $('.income').addClass('d-none');
    loadDataSelectIncomeTypes();
  });
  /* Funcion para obtener el nombre del Tipo de Gasto seleccionado */
  $('#typeExpense').change(function (e) {
    e.preventDefault();
    const id = type.value;
    const text = type.options[type.selectedIndex].text;
    $.ajax({
      url: "cuentaingresos_controller.php?op=get_code_income_by_type",
      method: 'POST',
      dataType: "json",
      data: { id: id, type: text },
      success: function (response) {
        $('#codeExpense').val(response);
      }
    });
  });
  /* Accion para Guardar o Actualizar Informacion de los Gastos en la Base de Datos */
  $('#formNewExpense').submit(function (e) {
    e.preventDefault();
    id = $('#idExpense').val();
    typed = $('#typeExpense').val();
    code = $('#codeExpense').val();
    income = $('#nameExpense').val().toUpperCase();
    dato = new FormData();
    dato.append('id', id);
    dato.append('type', typed);
    dato.append('code', code);
    dato.append('income', income);
    $.ajax({
      url: 'cuentaingresos_controller.php?op=new_income_account',
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
          $('#income_account_table').DataTable().ajax.reload();
          $('#formNewExpense')[0].reset();
          $('#newExpenseAccountModal').modal('hide');
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
  /* Accion Para Editar Una Cuenta de Gasto Existente En La Lista de Cuentas de Gastos*/
  $(document).on('click', '#b_edit_income_account', function (e) {
    e.preventDefault();
    var id = $(this).data('value');
    $('.income').addClass('d-none');
    $.ajax({
      url: 'cuentaingresos_controller.php?op=get_income_account',
      method: 'POST',
      dataType: 'json',
      data: { id: id },
      success: function (response) {
        loadDataSelectIncomeTypes(response.type);
        $('#idExpense').val(response.id);
        $('#codeExpense').val(response.code);
        $('#nameExpense').val(response.income);
        $('#typeExpense').attr('disabled', true);
        $('#newExpenseAccountModal').modal('show');
      }
    });
  })
  /* Accion para cambiar el estado de la disponibilidad de unidad departamental */
  $(document).on('click', '#b_trash_income_account', function (e) {
    e.preventDefault();
    var id = $(this).data('value');
    Swal.fire({
      title: 'Estas seguro de eliminar esta cuenta?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, Eliminar!'
    }).then((result) => {
      if (result.isConfirmed) {

        $.ajax({
          url: 'cuentaingresos_controller.php?op=delete_income_account',
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
              $('#income_account_table').DataTable().ajax.reload();
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
  LoadDataTableIncomeAccounts();
});