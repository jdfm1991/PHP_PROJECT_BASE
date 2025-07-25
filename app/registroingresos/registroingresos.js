$(document).ready(function () {
  const account = document.getElementById('accountIncome')

  /* Funcion para Cargar Select de las cuentas de gastos */
  const loadDataSelectIncomeAccounts = async (id) => {
    try {
      const response = await fetch(URI + 'cuentaingresos/cuentaingresos_controller.php?op=get_list_income_accounts');
      const data = await response.json();
      const container = document.getElementById('accountIncome');
      container.innerHTML = '';
      data.forEach((opt, idx) => {
        const option = document.createElement('option');
        if (id == opt.id) {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.income}`;
          option.setAttribute('selected', 'selected');
          container.appendChild(option);
        } else {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.income}`;
          container.appendChild(option);
        }
      })
    } catch (error) {
      console.log('Error', error);
    }
  }
  /* Funcion para listar todos los unidades departamentales existentes en la base de datos */
  const LoadDataTableIncomes = async () => {
    const table = $('#income_table').DataTable({
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
        url: "registroingresos_controller.php?op=get_list_income",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "date" },
        { data: "account" },
        { data: "income" },
        { data: "aumont" },
        { data: "percent" },
        {
          data: "id", render: (data, _, __, meta) =>
            `<button id="b_edit_income" class="btn btn-outline-primary btn-sm" data-value="${data}"><i class="fa fa-edit"></i></button>
            <button id="b_trash_income" class="btn btn-outline-danger btn-sm" data-value="${data}"><i class="bi bi-trash3"></i></button>`, className: "text-center"
        }
      ]
    });
  }
  /* Funcion Para Cargar El Contenido del Selectores del Modal "newIncomeModal" */
  $('#newIncome').click(function () {
    $('#accountIncome').attr('disabled', false);
    $('#formIncome')[0].reset();
    $('#c_formula').addClass('d-none');
    $('#c_penal').addClass('d-none');
    $('#per_content').addClass('d-none');
    $('#aumot_content').removeClass('d-none');
    loadDataSelectIncomeAccounts();
  });
  $('#accountIncome').change(function (e) {
    e.preventDefault();
    const text = account.options[account.selectedIndex].text;
    if (text.includes('PENAL')) {
      $('#c_penal').removeClass('d-none');

    } else {
      $('#c_penal').addClass('d-none');
    }
  });
  /* Accion para contar los caracteres de la descripcion */
  $('#datailIncome').keyup(function (e) {
    letters = $(this).val().length;
    $('#count2').removeClass('bg-success bg-warning bg-danger test-black');
    $('#count2').addClass('badge');
    $('#count2').addClass('text-white');
    $('#count2').addClass('font-weight-bold');
    if (letters > 0 && letters <= 30) {
      $('#count2').addClass('bg-success');
      $('#count2').text(letters + ' / 50');
    }
    if (letters >= 31 && letters <= 45) {
      $('#count2').addClass('bg-warning');
      $('#count2').addClass('text-black');
      $('#count2').text(letters + ' / 50');
    }
    if (letters >= 45) {
      $('#count2').addClass('bg-danger');
      $('#count2').text('Le queda pocos caracteres ' + letters + ' / 50');
    }
  });

  /* Accion para visualizar el campo para agregar la cuota en caso de ser necesario */
  $("#penalty").change(function () {
    if ($(this).is(":checked")) {
      $('#c_formula').removeClass('d-none');
    } else {
      $('#c_formula').addClass('d-none');
    }
  });
  $("#percent").change(function () {
    if ($(this).is(":checked")) {
      $('#per_content').removeClass('d-none');
      $('#aumot_content').addClass('d-none');
      $('#montIncome').val('');
    } else {
      $('#per_content').addClass('d-none');
      $('#aumot_content').removeClass('d-none');
      $('#m_percent').val('');
    }
  });
  /* Accion para Guardar o Actualizar Informacion de los Gastos en la Base de Datos */
  $('#formIncome').submit(function (e) {
    e.preventDefault();
    id = $('#idinc').val();
    income = $('#accountIncome').val();
    penalty = $('#penalty').is(':checked');
    detail = $('#datailIncome').val().toUpperCase();
    percent = $('#percent').is(':checked');
    mont = $('#montIncome').val();
    montp = $('#m_percent').val();
    dato = new FormData();
    dato.append('id', id);
    dato.append('income', income);
    dato.append('penalty', penalty);
    dato.append('detail', detail);
    dato.append('percent', percent);
    dato.append('mont', mont);
    dato.append('montp', montp);
    $.ajax({
      url: 'registroingresos_controller.php?op=new_income',
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
          $('#income_table').DataTable().ajax.reload();
          $('#formIncome')[0].reset();
          $('#newIncomeModal').modal('hide');
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
  /* Accion Para Editar el Gasto Existente En La Lista de Gastos*/
  $(document).on('click', '#b_edit_income', function (e) {
    e.preventDefault();
    var id = $(this).data('value');
    $.ajax({
      url: 'registroingresos_controller.php?op=get_data_income',
      method: 'POST',
      dataType: 'json',
      data: { id: id },
      success: function (response) {
        loadDataSelectIncomeAccounts(response.suplier);
        $('.modal-title').text('Editar Gasto');
        $('#idinc').val(response.id);
        $('#datailExpense').val(response.account);
        if (response.byreceipt == 1) {
          $('#c_penal').removeClass('d-none');
          $("#penalty").prop('checked', true);
        }
        $('#datailIncome').val(response.income);
        if (response.perc == 1) {
          $('#c_formula').removeClass('d-none');
          $('#aumot_content').addClass('d-none');
          $('#per_content').removeClass('d-none');
          $("#percent").prop('checked', true);
          $('#m_percent').val(response.percent);
        }
        $('#montIncome').val(response.aumont);
        $('#accountIncome').attr('disabled', true);
        $('#penalty').attr('disabled', true);
        $('#percent').attr('disabled', true);
        $('#newIncomeModal').modal('show');
      }
    });
  })
  /* Accion para cambiar el estado de la disponibilidad de unidad departamental */
  $(document).on('click', '#b_trash_income', function (e) {
    e.preventDefault();
    var id = $(this).data('value');
    Swal.fire({
      title: 'Estas seguro de eliminar el ingreso?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, Eliminar!'
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: 'registroingresos_controller.php?op=delete_income',
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
              $('#income_table').DataTable().ajax.reload();
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
  LoadDataTableIncomes();
});