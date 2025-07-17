$(document).ready(function () {
  $('#content_data').hide();
  let sheetexcel = $('#sheetexcel')[0].files[0];
  /* Funcion para cargar el excel del banco y mostrar la informacion */
  const loadBankStatementByExcel = (sheetexcel) => {
    var datos = new FormData();
    datos.append('sheetexcel', sheetexcel)
    $.ajax({
      url: "banco_controller.php?op=load_bank_statement_by_excel",
      type: "POST",
      dataType: "json",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      success: function (response) {
        if (response.status == true) {
          $("#wait_time").removeClass("alert-info alert-danger alert-success");
          $("#wait_time").addClass("alert-success");
          $('#loader').attr('src', URL_ASSETS + 'img/success.gif');
          $('#m_load_file').empty();
          $('#m_load_file').append(`
            <h2><strong>${response.message}</strong></h2>
            `);
          setTimeout(() => {
            $("#wait_time").removeClass("alert-info alert-danger alert-success show");
            $("#wait_time").addClass("d-none");
            $('#m_load_file').empty();
            $('#content_data').show();
            $('#data_table').empty();
            $('#data_table').append('<thead class="text-center"><tr><th>N#</th><th>Fecha</th><th>Referencia</th><th>Descripcion</th><th>Monto</th><th>Movimiento</th></tr></thead>');
            $.each(response, function (idx, opt) {
              if (opt.date != undefined) {
                $('#data_table').append('<tbody><td>' + opt.line + '</td><td>' + opt.date + '</td><td>' + opt.refenc + '</td><td>' + opt.descri + '</td><td>' + opt.amount + '</td><td>' + opt.motion + '</td></tbody>');
              }
            });
          }, 1000);
        } else {
          $("#wait_time").removeClass("alert-info alert-danger alert-success");
          $("#wait_time").addClass("alert-danger");
          $('#loader').attr('src', URL_ASSETS + 'img/error.gif');
          $('#m_load_file').empty();
          $('#m_load_file').append(`
            <h2><strong>${response.message}</strong></h2>
            `);
        }
      }
    });
  }
  /* Accion que llama la funcion para cargar el excel */
  $('#sheetexcel').change(function () {
    sheetexcel = $('#sheetexcel')[0].files[0];
    // Se verifica si se selecciono un archivo
    if (sheetexcel == undefined) {
      $('#content_data').hide();
      $('#data_table').empty();
      $("#wait_time").removeClass("d-none");
      $("#wait_time").addClass("show");
      $("#wait_time").removeClass("alert-info alert-danger alert-success");
      $("#wait_time").addClass("alert-danger");
      $('#loader').attr('src', URL_ASSETS + 'img/error.gif');
      $('#m_load_file').empty();
      $('#m_load_file').append(`
            <h2><strong>Debe seleccionar un archivo</strong></h2>
            `);
      return false;
    } else {
      $("#wait_time").removeClass("d-none");
      $("#wait_time").addClass("show");
      $("#wait_time").removeClass("alert-info alert-danger alert-success");
      $("#wait_time").addClass("alert-info");
      $('#m_load_file').empty();
      $('#loader').attr('src', URL_ASSETS + 'img/loader.gif');
      $('#m_load_file').append(`
      <h2><strong>Espere un momento, por favor...</strong></h2><h3>Se esta cargando el archivo</h3>
      `);
      setTimeout(() => {
        loadBankStatementByExcel(sheetexcel);
      }, 1000);

    }
  });
  /* Accion para guardar la informacion una vez cargada y visualizada */
  $('#load_data').click(function (e) {
    e.preventDefault();
    sheetexcel = $('#sheetexcel')[0].files[0];
    var datos = new FormData();
    datos.append('sheetexcel', sheetexcel)
    $.ajax({
      url: "banco_controller.php?op=new_banking_movements",
      type: "POST",
      dataType: "json",
      data: datos,
      cache: false,
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
          $('#data_table').empty();
          $('#content_data').hide();
          $('#formBankStatement')[0].reset();
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
});