$(document).ready(function () {
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
        $('#idCxp').val(response.id);
        $('#t_date').text(date);
        $('#t_suplier').text(response.suplier);
        $('#t_account').text(response.account);
        $('#t_detail').text(response.expense);
        $('#t_balance').val(response.balance);
        $('#cxpPayModal').modal('show');


      }
    });
  })

  /* Accion para Guardar o Actualizar Informacion del Cliente en la Base de Datos */
  $('#formNewSuplier').submit(function (e) {
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

  loadDataTableAccountsPayable();
});