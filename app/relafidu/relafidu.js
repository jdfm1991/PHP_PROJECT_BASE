$(document).ready(function () {
  /* Funcion para listar todos los clientes existentes en la base de datos */
  const loadListClentAvailableDB = async () => {
    try {
      const response = await fetch(URI + 'clientes/clientes_controller.php?op=get_list_clients');
      const data = await response.json();
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

  loadListClentAvailableDB();
  loadListUnitAvailableDB();




















  const level = document.getElementById('unitLevel');
  /* Funcion para Cargar Select de los niveles de las unidades departamentales */
  const loadDataSelectUnitLevels = async (id) => {
    try {
      const response = await fetch('unidaddepartamental_controller.php?op=get_unit_levels');
      const data = await response.json();
      const container = document.getElementById('unitLevel');
      container.innerHTML = '';
      const defaultOption = document.createElement('option');
      defaultOption.setAttribute('value', '');
      defaultOption.innerHTML = 'Nivel...';
      container.appendChild(defaultOption);
      data.forEach((opt, idx) => {
        const option = document.createElement('option');
        if (id == opt.id) {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.level}`;
          option.setAttribute('selected', 'selected');
          container.appendChild(option);
        } else {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.level}`;
          container.appendChild(option);
        }
      })
    } catch (error) {
      console.log('Error', error);
    }
  }
  /* Funcion para Cargar Select de los alicuotas de las unidades departamentales */
  const loadDataSelectUnitAliquots = async (id) => {
    try {
      const response = await fetch('unidaddepartamental_controller.php?op=get_unit_aliquots');
      const data = await response.json();
      const container = document.getElementById('unitaliquots');
      container.innerHTML = '';
      data.forEach((opt, idx) => {
        const option = document.createElement('option');
        if (id == opt.id) {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.aliquot}`;
          option.setAttribute('selected', 'selected');
          container.appendChild(option);
        } else {
          option.setAttribute('value', opt.id);
          option.innerHTML = `${opt.aliquot}`;
          container.appendChild(option);
        }
      })
    } catch (error) {
      console.log('Error', error);
    }
  }
  /* Funcion para listar todos los unidades departamentales existentes en la base de datos */
  const LoadDataTableUnits = async () => {
    const table = $('#units_table').DataTable({
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
        url: "unidaddepartamental_controller.php?op=get_list_units",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "unit" },
        { data: "level" },
        { data: "aliquot" },
        {
          data: null, render: (data, type, row) =>
            row.enable == 1 ? `<a id="b_enable_unit" data-value="${row.id}" href="#"><span class="badge badge-success">Disponible</span></a>` : `<a id="b_enable_unit" data-value="${row.id}" href="#"><span class="badge badge-danger">No Disponible</span></a>`, className: "text-center"
        },
        {
          data: "id", render: (data, _, __, meta) =>
            `<button id="b_edit_unit" class="btn btn-outline-primary btn-sm" data-value="${data}"><i class="fa fa-edit"></i></button>`, className: "text-center"
        }
      ]
    });

  }
  /* Funcion para llamar a la carga de los select de niveles y alicuotas al crear una unidad departamental */
  $('#newUnit').click(function (e) {
    e.preventDefault();
    loadDataSelectUnitLevels();
    loadDataSelectUnitAliquots();
  });
  /* Funcion para obtener el nombre de la unidad departamental segun el nivel seleccionado */
  $('#unitLevel').change(function (e) {
    e.preventDefault();
    const id = level.value;
    const text = level.options[level.selectedIndex].text;
    $.ajax({
      url: "unidaddepartamental_controller.php?op=get_unit_name_by_level",
      method: 'POST',
      dataType: "json",
      data: { id: id, levelu: text },
      success: function (response) {
        $('#unitname').val(response);
      }
    });
  });
  /* Accion para Guardar o Actualizar Informacion de la Unidad Departamental en la Base de Datos */
  $('#formNewUnit').submit(function (e) {
    e.preventDefault();
    id = $('#idUnit').val();
    unit = $('#unitname').val();
    levelu = $('#unitLevel').val();
    aliquot = $('#unitaliquots').val();
    dato = new FormData();
    dato.append('id', id);
    dato.append('unit', unit);
    dato.append('levelu', levelu);
    dato.append('aliquot', aliquot);
    $.ajax({
      url: 'unidaddepartamental_controller.php?op=new_unit',
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
          $('#units_table').DataTable().ajax.reload();
          $('#formNewUnit')[0].reset();
          $('#newUnitModal').modal('hide');
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

  //LoadDataTableUnits();
});