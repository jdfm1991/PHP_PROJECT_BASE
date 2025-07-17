$(document).ready(function () {
  const DateNow = new Date();
  const opciones = { year: 'numeric', month: 'long' };
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
    const gf_amount = document.getElementsByName('gf_amount')
    const gv_amount = document.getElementsByName('gv_amount')
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
    const period = DateNow.toLocaleDateString('es-VE', opciones).toUpperCase();
    const vence = DateNow.getFullYear() + '-' + String(DateNow.getMonth() + 1).padStart(2, '0') + '-' + String(DateNow.getDate() + 15).padStart(2, '0');
    $('#p_cobro').val(period);
    $('#f_vence').val(vence);
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
    $.ajax({
      url: URI + 'unidaddepartamental/unidaddepartamental_controller.php?op=get_unit_by_name',
      method: 'GET',
      dataType: 'json',
      data: { search: depart },
      success: function (response) {
        $.each(response, function (idx, opt) {
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
                    <div class="col-sm-1" >
                    <button id="b_trash" type="button" class="btn btn-outline-danger btn-group-sm" data-value="${detail.id}" value="${opt.id}" title="Eliminar"><i class="bi bi-dash"></i></button>
                    </div>
                    <label name="name" class="col-sm-8 text-body-secondary text-monospace font-weight-bold">${detail.expenseName} </label>
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
                    <div class="col-sm-1" >
                    <button id="b_trash" type="button" class="btn btn-outline-danger btn-group-sm" data-value="${detail.id}" value="${opt.id}" title="Eliminar"><i class="bi bi-dash"></i></button>
                    </div>
                    <label name="name" class="col-sm-8 text-body-secondary text-monospace font-weight-bold">${detail.expenseName} </label>
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
});