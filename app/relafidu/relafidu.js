$(document).ready(function () {
  /* Funcion para listar todos los clientes existentes en la base de datos */
  const loadListClentAvailableDB = async (clientName) => {
    console.log(clientName);
    try {
      const response = await fetch(URI + 'clientes/clientes_controller.php?op=get_list_clients&search=' + clientName);
      const data = await response.json();
      console.log(data);
      
      const container = document.getElementById('client_container');
      container.innerHTML = '';
      data.forEach((opt, idx) => {
        const button = document.createElement('button');
        button.style.width = '220px';
        button.style.margin = '10px';
        button.classList.add('btn_client_selected');
        button.classList.add('btn');
        button.classList.add('btn-outline-info');
        button.classList.add('btn-group-sm');
        button.setAttribute('id', 'b_client_selected');
        button.setAttribute('data-value', opt.id);
        button.setAttribute('type', 'button');
        button.setAttribute('value', opt.name);
        button.innerHTML = `${opt.name}`;
        container.appendChild(button);
      })
    } catch (error) {
      console.log('Error', error);
    }
  };
  /* Funcion para listar todos los clientes existentes en la base de datos */
  const loadListUnitAvailableDB = async () => {
    try {
      const response = await fetch('relafidu_controller.php?op=get_list_units');
      const data = await response.json();
      const container = document.getElementById('unit_container');
      container.innerHTML = '';
      data.forEach((opt, idx) => {
        const button = document.createElement('button');
        button.style.width = '220px';
        button.style.margin = '10px';
        button.classList.add('btn');
        button.classList.add('btn-outline-info');
        button.classList.add('btn-group-sm');
        button.setAttribute('id', 'b_unit_selected');
        button.setAttribute('data-value', opt.id);
        button.setAttribute('type', 'button');
        button.setAttribute('value', opt.unit);
        button.innerHTML = `${opt.unit}`;
        container.appendChild(button);
      })
    } catch (error) {
      console.log('Error', error);
    }
  };
  /* Funcion para listar todos los unidades departamentales existentes en la base de datos */
  const LoadDataTableFiduciaryRelationship = async () => {
    const table = $('#relafidu_table').DataTable({
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
        url: "relafidu_controller.php?op=get_list_relafidu",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "unit" },
        { data: "level" },
        { data: "client" },
        {
          data: null, render: (data, type, row) =>
            row.enable == 1 ? `<a id="b_enable_unit" data-value="${row.id}" href="#"><span class="badge badge-success">Disponible</span></a>` : `<a id="b_enable_unit" data-value="${row.iunit}" href="#"><span class="badge badge-danger">No Disponible</span></a>`, className: "text-center"
        },
      ]
    });

  }
  /* Accion para cambiar el estado de la disponibilidad de unidad departamental */
  $(document).on('click', '#b_client_selected', function () {
    $('.btn_client_selected').removeClass('active');
    $(this).addClass('active');
    var id = $(this).data('value');
    $('#clientId').val(id);
    $('#clientname').val($(this).attr('value'));
  })
  /* Accion para cambiar el estado de la disponibilidad de unidad departamental */
  $(document).on('click', '#b_unit_selected', function () {
    var unit = $(this).data('value');
    var client = $('#clientId').val();
    if (client == '') {
      $(".mr-auto").text("Procesos Fallido");
      $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#toastText").text("Debe seleccionar un cliente");
      $('.toast').toast('show');
      return true;
    }
    $.ajax({
      url: 'relafidu_controller.php?op=new_fidu_rela',
      method: 'POST',
      dataType: 'json',
      data: { unit: unit, client: client },
      success: function (response) {
        if (response.status == true) {
          $(".mr-auto").text("Procesos Exitoso");
          $(".toast").css("background-color", "rgb(29 255 34 / 85%)");
          $(".toast").css("color", "white");
          $(".toast").attr("background-color", "");
          $("#toastText").text(response.message);
          $('.toast').toast('show');
          $('#relafidu_table').DataTable().ajax.reload();
          loadListUnitAvailableDB();
        } else {
          $(".mr-auto").text("Procesos Fallido");
          $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
          $(".toast").css("color", "white");
          $(".toast").attr("background-color", "");
          $("#toastText").text(response.message);
          $('.toast').toast('show');
        }
      }
    });
  })
  $('#searchClient').keyup(function (e) {
    clientName = $(this).val();
    loadListClentAvailableDB(clientName);
  });




  /* Accion para Eliminar Usuario de la Lista de usuario Visibles */
  $(document).on('click', '#b_edit_unit', function () {
    var id = $(this).data('value');
    $.ajax({
      url: 'unidaddepartamental_controller.php?op=get_data_unit',
      method: 'POST',
      dataType: 'json',
      data: { id: id },
      success: function (response) {
        loadDataSelectUnitLevels(response.level);
        loadDataSelectUnitAliquots(response.aliquot);
        $('#idUnit').val(response.id);
        $('#unitname').val(response.unit);
        $('#unitLevel').attr('disabled', true);
        $('#newUnitModal').modal('show');
      }
    });
  })

  loadListClentAvailableDB();
  loadListUnitAvailableDB();
  LoadDataTableFiduciaryRelationship();
});