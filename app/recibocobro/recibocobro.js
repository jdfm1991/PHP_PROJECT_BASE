$(document).ready(function () {
  const DateNow = new Date();
  const opciones = { year: 'numeric', month: 'long' };
  const period = DateNow.toLocaleDateString('es-VE', opciones).toUpperCase();
  const vencimento = new Date(DateNow.getTime() + 15 * 24 * 60 * 60 * 1000); // 15 Representa La cantidad de dias a sumar, 24 * 60 * 60 * 1000 Representa la cantidad de milisegundos en un dia
  const vence = vencimento.getFullYear() + '-' + String(vencimento.getMonth() + 1).padStart(2, '0') + '-' + String(vencimento.getDate()).padStart(2, '0');
  /* Definiendo elementos para obtener valores de los gastos fijos y almacenarlos en un arreglo */
  const codef = document.getElementsByName('codef')
  const typef = document.getElementsByName('typef')
  const expensef = document.getElementsByName('expensef')
  const gf_amount = document.getElementsByName('gf_amount')
  /* Definiendo elementos para obtener valores de los gastos variables y almacenarlos en un arreglo */
  const codenf = document.getElementsByName('codenf')
  const typenf = document.getElementsByName('typenf')
  const expensenf = document.getElementsByName('expensenf')
  const gv_amount = document.getElementsByName('gv_amount')
  const loadDataTableReceipts = async () => {
    const table = $('#receipt_table').DataTable({
      responsive: true,
      scrollX: true,
      autoWidth: true,
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
        url: "recibocobro_controller.php?op=get_list_receipts",
        type: "GET",
        dataType: "json",
        dataSrc: "",
      },
      columns: [
        { data: "date" },
        { data: "number" },
        { data: "concept" },
        { data: "expiration" },
        { data: "name" },
        { data: "aumont" },
        {
          data: "id", render: (data, _, __, meta) =>
            `<button id="b_delete_receipt" class="btn btn-outline-danger btn-sm" data-value="${data}"><i class="fa fa-trash"></i></button>`, className: "text-center"
        }
      ],
      order: [[0, "desc"]],
    });

  }
  const clearFields = function () {
    $('#formReceipt')[0].reset();
    $('#content_fixed_body').empty();
    $('#content_non_fixed_body').empty();
    $('#content_fixed').addClass('d-none');
    $('#content_non_fixed').addClass('d-none');
  }
  const getNewNumberRC = function () {
    $.ajax({
      url: "recibocobro_controller.php?op=get_new_number",
      method: 'POST',
      dataType: "json",
      success: function (response) {
        $('#n_rc').text(response);
      }
    });
  }
  const getCalcFormatting = function (amount, aliquot) {
    const x = (Number.parseFloat(amount) * Number.parseFloat(aliquot)) / 100;
    return x.toFixed(2);
  }
  const getTotals = function () {
    let suma_gf = 0;
    let suma_gv = 0;
    let suma = 0;
    for (let i = 0; i < gf_amount.length; i++) {
      const amount = parseFloat(gf_amount[i].value);
      if (!isNaN(amount)) {
        suma_gf += amount;
      }
    }
    for (let i = 0; i < gv_amount.length; i++) {
      const amount = parseFloat(gv_amount[i].value);
      if (!isNaN(amount)) {
        suma_gv += amount;
      }
    }
    $('#amout_gf').val(suma_gf.toFixed(2));
    $('#amout_gv').val(suma_gv.toFixed(2));
    $('#total_fixed').text(suma_gf.toFixed(2));
    $('#total_non_fixed').text(suma_gv.toFixed(2));
    $('#amout_i').val(0);
    $('#amout_p').val(0);
    suma = parseFloat(suma_gf + suma_gv).toFixed(2)
    $('#amout_tg').val(suma);
  }
  $('#rc_indivual').click(function (e) {
    e.preventDefault();
    loadDataDateReceipt();
    getNewNumberRC();
    $('.modal-title').text('Nuevo Recibo de Cobro');
    $('#p_cobro').attr('disabled', true);
    $('#l_dpto').attr('disabled', true);
    $('#a_dpto').attr('disabled', true);
    $('#e_dpto').attr('disabled', true);
    $('#rcIndividualModal').modal('show');
  });
  $('#name_client').click(function () {
    depart = $('#n_dpto').val();
    if (depart == '') {
      clearFields();
      $(".mr-auto").text("Procesos Fallido");
      $(".toast").css("z-index", "1000");
      $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#toastText").text("Debe Seleccionar un Departamento Para Continuar");
      $('.toast').toast('show');
      return false;
    }
    $.ajax({
      url: URI + 'unidaddepartamental/unidaddepartamental_controller.php?op=get_unit_by_name',
      method: 'POST',
      dataType: 'json',
      data: { search: depart },
      success: function (response) {
        if (response.length == 0) {
          clearFields();
          $(".mr-auto").text("Procesos Fallido");
          $(".toast").css("z-index", "1000");
          $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
          $(".toast").css("color", "white");
          $(".toast").attr("background-color", "");
          $("#toastText").text("Departamento No Encontrado");
          $('.toast').toast('show');
          return false;
        }
        clearFields();
        loadDataDateReceipt();
        $.each(response, function (idx, opt) {
          $('#id_u').val(opt.uid);
          $('#id_c').val(opt.cid);
          $('#n_dpto').val(opt.unit);
          $('#name_client').val(opt.name);
          $('#l_dpto').val(opt.level);
          $('#a_dpto').val(opt.aliquot);
          $('#e_dpto').val(opt.email);
        });
      }
    });
  });
  $('#b_gastos_f').click(function (e) {
    e.preventDefault();
    aliquot = $('#a_dpto').val();
    if (aliquot == '') {
      $(".mr-auto").text("Procesos Fallido");
      $(".toast").css("z-index", "1000");
      $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#toastText").text("Debe Seleccionar un Departamento Para Continuar");
      $('.toast').toast('show');
      return false;
    }
    $('#title_fixed').text('Relacion de Gastos Fijos');
    $('#content_fixed').removeClass('d-none');
    $.ajax({
      url: 'recibocobro_controller.php?op=get_data_expense_fixed',
      method: 'GET',
      dataType: 'json',
      success: function (response) {
        $("#content_fixed_body").empty();
        $.each(response, function (idx, opt) {
          $("#content_fixed_body").append(`
                <div id="cont_${opt.id}" class="row d-flex justify-content-between">
                  <small class="col-2 text-body-secondary">${opt.code} </small>
                  <span class="col-8 font-weight-bold">${opt.account}</span>
                  <hr>
                  <div class="col-12">`+
            opt.details.map((detail) => {
              return `
              <div id="detail_${detail.id}" name="cont_${opt.id}" class="row">
                <input type="hidden" name="typef" value="${opt.id}">
                <input type="hidden" name="codef" value="${detail.id}">
                <div class="col-sm-1" >
                <button id="b_trash" type="button" class="btn btn-outline-danger btn-group-sm" data-value="${detail.id}" value="${opt.id}" title="Eliminar"><i class="bi bi-dash"></i></button>
                </div>
                <label name="expensef" class="col-sm-8 text-body-secondary text-monospace font-weight-bold">${detail.expenseName} </label>
                <span class="col-sm-2 font-weight-bold text-right" name="amount">${detail.aumont}</span>
                <input name="gf_amount" type="text" class="form-control col-sm-1" value="${getCalcFormatting(detail.aumont, aliquot)}" disabled>
              </div>
               `
            }) +
            `</div>
                </div>
          `);
        });
        getTotals();
      }
    });
  });
  $('#b_gastos_v').click(function (e) {
    e.preventDefault();
    aliquot = $('#a_dpto').val();
    if (aliquot == '') {
      $(".mr-auto").text("Procesos Fallido");
      $(".toast").css("z-index", "1000");
      $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#toastText").text("Debe Seleccionar un Departamento Para Continuar");
      $('.toast').toast('show');
      return false;
    }
    $('#title_non_fixed').text('Relacion de Gastos Variables');
    $('#content_non_fixed').removeClass('d-none');
    $.ajax({
      url: 'recibocobro_controller.php?op=get_data_expense_non_fixed',
      method: 'GET',
      dataType: 'json',
      success: function (response) {
        $("#content_non_fixed_body").empty();
        $.each(response, function (idx, opt) {
          $("#content_non_fixed_body").append(`
                <div id="cont_${opt.id}" class="row d-flex justify-content-between">
                  <small class="col-2 text-body-secondary">${opt.code} </small>
                  <span class="col-8 font-weight-bold">${opt.account}</span>
                  <hr>
                  <div class="col-12">`+
            opt.details.map((detail) => {
              return `
              <div id="detail_${detail.id}" name="cont_${opt.id}" class="row">
                    <input type="hidden" name="typenf" value="${opt.id}">
                    <input type="hidden" name="codenf" value="${detail.id}">
                    <div class="col-sm-1" >
                    <button id="b_trash" type="button" class="btn btn-outline-danger btn-group-sm" data-value="${detail.id}" value="${opt.id}" title="Eliminar"><i class="bi bi-dash"></i></button>
                    </div>
                    <label name="expensenf" class="col-sm-8 text-body-secondary text-monospace font-weight-bold">${detail.expenseName} </label>
                    <span class="col-sm-2 font-weight-bold text-right" name="amount">${detail.aumont}</span>
                    <input name="gv_amount" type="text" class="form-control col-sm-1" value="${getCalcFormatting(detail.aumont, aliquot)}" disabled>
                  </div>
               `
            }) +
            `</div>
                </div>
          `);
        });
        getTotals();
      }
    });
  });
  $(document).on('click', '#b_trash', function () {
    const id = $(this).data('value');
    const cont = $(this).attr('value');
    const contain = document.getElementsByName('cont_' + cont)
    const container = document.getElementById('cont_' + cont)
    const element = document.getElementById('detail_' + id);
    element.remove();
    const n_item = contain.length
    if (n_item == 0) {
      container.remove();
    }
    const elementerase = document.getElementById('detail_' + id);
    if (elementerase == null) {
      $(".mr-auto").text("Procesos Exitoso");
      $(".toast").css("z-index", "1000");
      $(".toast").css("background-color", "rgb(29 255 34 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#toastText").text("item Eliminado con exito");
      $('.toast').toast('show');
    } else {
      $(".mr-auto").text("Procesos Fallido");
      $(".toast").css("z-index", "1000");
      $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#toastText").text("Error al Eliminar item");
      $('.toast').toast('show');
    }
    getTotals(cont);
  })
  $('.x').click(function (e) {
    e.preventDefault();
    clearFields();
  });
  $('#formReceipt').submit(function (e) {
    e.preventDefault();
    let dataexpense = []
    for (let i = 0; i < expensef.length; i++) {
      const type = typef[i].value;
      const code = codef[i].value;
      const expense = expensef[i].textContent;
      const amount = gf_amount[i].value;
      dataexpense.push({ type: type, code: code, expense: expense, amount: amount })
    }
    for (let i = 0; i < expensenf.length; i++) {
      const type = typenf[i].value;
      const code = codenf[i].value;
      const expense = expensenf[i].textContent;
      const amount = gv_amount[i].value;
      dataexpense.push({ type: type, code: code, expense: expense, amount: amount })
    }
    nrecibo = $('#n_rc').text();
    cid = $('#id_c').val();
    uid = $('#id_u').val();
    inquilino = $('#name_client').val();
    concepto = $('#p_cobro').val();
    fvence = $('#f_vence').val();
    nivel = $('#l_dpto').val();
    aliquot = $('#a_dpto').val();
    email = $('#e_dpto').val();
    monto_gf = $('#amout_gf').val();
    monto_gv = $('#amout_gv').val();
    monto_p = $('#amout_p').val();
    monto_i = $('#amout_i').val();
    monto_tg = $('#amout_tg').val();
    dataexpense = dataexpense;
    data = new FormData();
    data.append('nrecibo', nrecibo);
    data.append('cid', cid);
    data.append('uid', uid);
    data.append('inquilino', inquilino);
    data.append('concepto', concepto);
    data.append('vence', fvence);
    data.append('nivel', nivel);
    data.append('aliquot', aliquot);
    data.append('email', email);
    data.append('monto_gf', monto_gf);
    data.append('monto_gv', monto_gv);
    data.append('monto_p', monto_p);
    data.append('monto_i', monto_i);
    data.append('monto_tg', monto_tg);
    data.append('dataexpense', JSON.stringify(dataexpense));
    if (monto_tg == 0 || monto_tg == '') {
      $(".mr-auto").text("Procesos Fallido");
      $(".toast").css("background-color", "rgb(36 113 163 / 85%)");
      $(".toast").css("color", "white");
      $("#toastText").text("No Se Puede Totalizar Con Monto Total Cero");
      $('.toast').toast('show');
      return false;
    }
    $.ajax({
      url: 'recibocobro_controller.php?op=new_receipt',
      method: 'POST',
      dataType: "json",
      data: data,
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
          $('#receipt_table').DataTable().ajax.reload();
          clearFields();
          $('#rcIndividualModal').modal('hide');
        } else {
          if (response.httpstatus == '400') {
            $(".mr-auto").text("Procesos Fallido");
            $(".toast").css("background-color", "rgb(36 113 163 / 85%)");
            $(".toast").css("color", "white");
            $("#toastText").text(response.message);
            $('.toast').toast('show');
            return false;
          }
          Swal.fire({
            icon: "error",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
        }

      }
    })

  });
   /* Accion para Eliminar Usuario de la Lista de usuario Visibles */
  $(document).on('click', '#b_delete_receipt', function () {
    var id = $(this).data('value');
    Swal.fire({
      title: 'Estas seguro de eliminar este recibo?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, Eliminar!'
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: 'recibocobro_controller.php?op=delete_receipt',
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
              $('#receipt_table').DataTable().ajax.reload();
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
  function loadDataDateReceipt() {
    $('#p_cobro').val(period);
    $('#f_vence').val(vence);
  }
  loadDataTableReceipts();
});


