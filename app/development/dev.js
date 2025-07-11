$(document).ready(function () {
  const namemodule1 = document.getElementById('nameNewModule');
  const namemodule2 = document.getElementById('nameNewModule2');
  var alertcontainer = $('#alert_container');
  var text_alert = $('#text_alert');
  alertcontainer.hide();
  /* Activador dinamico de botones */
  var $buttons = $("button").click(function () {
    $buttons.removeClass("active");
    $(this).addClass("active");
    /* var id = this.id
    console.log(id); */
  });
  /* Evitar espacios en blanco de los inputs de los  nombres de modulos */
  namemodule1.addEventListener('keydown', function (event) {
    if (event.key === ' ') {
      event.preventDefault();
    }
  });
  namemodule2.addEventListener('keydown', function (event) {
    if (event.key === ' ') {
      event.preventDefault();
    }
  });
  /* Funcion para crear nuevos departamentos en la base de datos */
  $('#formNewDepart').submit(function (e) {
    e.preventDefault();
    var id = $('#idDepart').val();
    var depart = $('#nameNewDepart').val();
    $.ajax({
      url: "dev_controller.php?op=new_depart",
      method: "POST",
      data: { id: id, depart: depart },
      dataType: "json",
      success: function (response) {
        if (response.status == true) {
          $('#NewDepartModal').modal('hide');
          $('#formNewDepart').trigger('reset');
          Swal.fire({
            icon: "success",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
          $('#listDepartment').click()
        } else {
          Swal.fire({
            icon: "error",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
          $('#listDepartment').click()
        }
      }
    });

  });
  /* Funcion para Listar todos los departamentos existentes en la base de datos */
  $('#listDepartment').click(function (e) {
    e.preventDefault();
    $.ajax({
      url: "dev_controller.php?op=list_depart",
      method: "POST",
      dataType: "json",
      success: function (response) {
        const $module_body = $('#module_body').empty();
        const items = response.map((opt, idx) =>
          `<li class="list-group-item d-flex justify-content-between lh-sm">
            <div class="d-flex justify-content-between">
              <small class="text-body-secondary d-inline">${idx + 1} - </small>
              <div class="d-inline pl-2 justify-content-between text-center">
                  <h6 class="font-weight-bold"> ${opt.name} </h6>
              </div>   
            </div>
            <div class="btn-group" role="group" aria-label="Button group name">
                <button id="b_enable_depart" type="button" class="btn btn-outline-${opt.color} btn-group-sm" data-value="${opt.id}">${opt.icon}</button>
                <button id="b_update_depart" type="button" class="btn btn-outline-info btn-group-sm" data-value="${opt.id}"><i class="bi bi-arrow-repeat"></i></button>
                <button id="b_trash_depart" type="button" class="btn btn-outline-danger btn-group-sm" data-value="${opt.id}"><i class="bi bi-trash3"></i></button>
            </div>
          </li>`
        );
        $module_body.append(items);
      }
    });
  });

  /* Funcion para escoger como crear los modulos del sistema */
  $('#newModule').click(function (e) {
    e.preventDefault();
    Swal.fire({
      title: "Como Desea Crear el Nuevo Modulo?",
      showDenyButton: true,
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      denyButtonColor: "#08cea1",
      confirmButtonText: "Modulo Nuevo",
      denyButtonText: "A Partir de Modulo Existente"
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        $('#newModuleModal').modal('show')
      } else if (result.isDenied) {
        getListModulesAvailablesDB();
        $('#listModuleModal').modal('show')
      }
    });
  });
  /* Funcion para Crear todos los modulos que seran utilizados en el sistema */
  $('#formNewModule').submit(function (e) {
    e.preventDefault();
    var module = $('#nameNewModule').val();
    $.ajax({
      url: "dev_controller.php?op=new_folder_module",
      method: "POST",
      dataType: "json",
      data: { module: module },
      success: function (response) {
        if (response.status == true) {
          $('#newModuleModal').modal('hide');
          $('#formNewModule').trigger('reset');
          Swal.fire({
            icon: "success",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
          $('#listModules').click()
        } else {
          Swal.fire({
            icon: "error",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
          $('#listModules').click()
        }

      }
    });

  });
  /* Funcion para listar todos los modulos existentes en fase de desarrollo que puede ser activados en el sistema */
  $('#listModules').click(function (e) {
    e.preventDefault();
    $.ajax({
      url: "dev_controller.php?op=available_modules",
      method: "POST",
      dataType: "json",
      success: function (response) {
        const $module_body = $('#module_body').empty();
        const items = response.map((opt, idx) =>
          `<li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <small class="text-body-secondary d-inline">${idx + 1} - </small>
              <h6 class="font-weight-bold d-inline">${opt.folder}</h6>
            </div>
            <div class="btn-group" role="group" aria-label="Button group name">
              <button id="b_active_module" type="button" class="btn btn-outline-info btn-group-sm buttonActive" data-value="${opt.folder}"  title="Activar Modulo"><i class="bi bi-folder-symlink-fill"></i></button>
            </div>
          </li>`
        );
        $module_body.append(items.join(''));
      }
    });
  });
  /* Funcion para Listar todos los modulos existentes en la base de datos */
  $('#listModulesdb').click(function (e) {
    e.preventDefault();
    $.ajax({
      url: "dev_controller.php?op=get_name_module",
      method: "POST",
      dataType: "json",
      success: function (response) {       
        const $module_body = $('#module_body').empty();
        const items = response.map((opt, idx) =>
          `<li class="list-group-item d-flex justify-content-between lh-sm">
            <div class="d-flex justify-content-between">
              <small class="text-body-secondary d-inline">${idx + 1} - </small>
              <div class="d-inline pl-2 justify-content-between text-center">
                  <h6 class="font-weight-bold"> Nombre del modulo: ${opt.listname} </h6>
              </div>   
            </div>
            <div class="btn-group" role="group" aria-label="Button group">
                <button id="b_trash_module" type="button" class="btn btn-outline-danger btn-group-sm" data-value="${opt.id}" value="${opt.name}"><i class="bi bi-trash3"></i></button>
            </div>
          </li>`
        );
        $module_body.append(items);
      }
    });

  });
  /* Cambiar el estatus de los departamentos en el sistema */
  $(document).on('click', '#b_enable_depart', function () {
    var depart = $(this).data('value');
    $.ajax({
      url: "dev_controller.php?op=enable_depart",
      method: "POST",
      dataType: "json",
      data: { depart: depart },
      success: function (response) {
        if (response.status == true) {
          Swal.fire({
            icon: "success",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
          $('#listDepartment').click()
        } else {
          Swal.fire({
            icon: "error",
            title: response.message,
            showConfirmButton: false,
            timer: 1500
          });
          $('#listDepartment').click()
        }
      }
    });
  })
  /* Actualizar los nombres de los Departamentos en el sistema*/
  $(document).on('click', '#b_update_depart', function () {
    var depart = $(this).data('value');
    $('#idDepart').val(depart);
    $.ajax({
      url: "dev_controller.php?op=get_name_depart",
      method: "POST",
      dataType: "json",
      data: { depart: depart },
      success: function (response) {
        $('#nameNewDepart').val(response.name);
        $('#formNewDepartModal').modal('show')
      }
    });
  })
  /* Eliminar Departamentos de las Lista de Departamentos Creador */
  $(document).on('click', '#b_trash_depart', function () {
    var depart = $(this).data('value');
    Swal.fire({
      title: "¿Estas seguro que deseas eliminarlo?",
      text: "No podrás revertir esto!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "¡Si, borralo!"
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "dev_controller.php?op=trash_depart",
          method: "POST",
          dataType: "json",
          data: { depart: depart },
          success: function (response) {
            if (response.status == true) {
              Swal.fire({
                title: "¡Eliminado!",
                text: response.message,
                icon: "success",
                showConfirmButton: false,
                timer: 1500
              });
              $('#listDepartment').click()
            } else {
              Swal.fire({
                title: "¡Eliminado!",
                text: response.message,
                icon: "error",
                showConfirmButton: false,
                timer: 1500
              });
              $('#listDepartment').click()
            }

          }
        });

      }
    });
  });

  /* Funcion para activar modulos en el sistema, registrando en la base de datos del sistemas */
  $(document).on('click', '#b_active_module', function () {
    var module = $(this).data('value');
    Swal.fire({
      title: "Nombre Que Tendra en el Sistema",
      input: "text",
      inputAttributes: {
        autocapitalize: "off"
      },
      showDenyButton: true,
      confirmButtonText: "Registrar",
      denyButtonText: `No Registar`
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "dev_controller.php?op=new_module",
          method: "POST",
          dataType: "json",
          data: { module: module, namelist: result.value },
          success: function (response) {
            if (response.status == true) {
              Swal.fire({
                icon: "success",
                title: response.message,
                showConfirmButton: false,
                timer: 1500
              });
              $('#module_body').empty();
              $('#listModules').click()
            } else {
              Swal.fire({
                icon: "error",
                title: response.message,
                showConfirmButton: false,
                timer: 1500
              });
              $('#module_body').empty();
              $('#listModules').click()
            }
          }
        });
      } else if (result.isDenied) {
        Swal.fire("No Se Realizo Nungun Cambio en el Sistemas", "", "info");
      }
    });
  });
  /* Funcion para copiar contenido de un modulo a otro */
  $(document).on('click', '#b_copy_module', function () {
    var modulecopy = $(this).data('value');
    var module = $('#nameNewModule2').val();
    if (module == "") {
      text_alert.text('Debe Ingresar el Nombre del Modulo a Crear');
      alertcontainer.show();
      setTimeout(function () {
        alertcontainer.hide();
      }, 2000)
    } else {
      $.ajax({
        url: "dev_controller.php?op=copy_module",
        method: "POST",
        dataType: "json",
        data: { copy: modulecopy, module: module },
        success: function (response) {
          if (response.status == true) {
            $('#listModuleModal').modal('hide');
            Swal.fire({
              icon: "success",
              title: response.message,
              showConfirmButton: false,
              timer: 1500
            });
            $('#listModules').click()
            $('#nameNewModule2').val('');
          } else {
            Swal.fire({
              icon: "error",
              title: response.message,
              showConfirmButton: false,
              timer: 1500
            });
            $('#listModules').click()
          }
        }
      });
    }
  })

  /* Eliminar Modulos de las Lista de Modulos Creador */
  $(document).on('click', '#b_trash_module', function () {
    var id = $(this).data('value');
    var module = $(this).attr('value');
    Swal.fire({
      title: "¿Estas seguro que deseas eliminarlo?",
      text: "No podrás revertir esto!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "¡Si, borralo!"
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "dev_controller.php?op=trash_module",
          method: "POST",
          dataType: "json",
          data: { id: id, module: module },
          success: function (response) {
            if (response.status == true) {
              Swal.fire({
                title: "¡Eliminado!",
                text: response.message,
                icon: "success",
                showConfirmButton: false,
                timer: 1500
              });
              $('#listModulesdb').click()
            } else {
              Swal.fire({
                title: "¡Eliminado!",
                text: response.message,
                icon: "error",
                showConfirmButton: false,
                timer: 1500
              });
              $('#listModulesdb').click()
            }

          }
        });

      }
    });
  });
  /* Funcion para listar todos los modulos existentes en fase de desarrolloE */
  const getListModulesAvailablesDB = async () => {
    try {
      const response = await fetch('dev_controller.php?op=get_name_module');
      const data = await response.json();
      const container = document.getElementById('list_modal_body');
      container.innerHTML = '';
      data.forEach((opt, idx) => {
        const li = document.createElement('li');
        li.classList.add('list-group-item');
        li.classList.add('d-flex');
        li.classList.add('justify-content-between');
        li.classList.add('lh-sm');
        li.innerHTML = `  
          <div class="d-flex justify-content-between">
            <small class="text-body-secondary d-inline">${idx + 1} - </small>
            <div class="d-inline pl-2 justify-content-between text-center">
                <h6 class="font-weight-bold"> ${opt.name} </h6>
            </div>   
          </div>
          <div class="btn-group" role="group" aria-label="Button group name">
              <button id="b_copy_module" type="button" class="btn btn-outline-success btn-group-sm" data-value="${opt.name}"><i class="bi bi-copy"></i></button>
          </div>
        `;
        container.appendChild(li);
      });

    } catch (error) {
      console.log('Error', error);
    }

  }
  $('.closemodal').click(function (e) {
    e.preventDefault();
    $('#nameNewModule').val('');
    $('#nameNewModule2').val('');

  });
});
