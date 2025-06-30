<!-- Modal Nuevo Departamento -->
<div class="modal fade" id="NewDepartModal" tabindex="-1" aria-labelledby="NewDepartModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="NewDepartModalLabel">Nuevo Departamento</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_body">
        <form id="formNewDepart">
          <input type="hidden" name="id" id="idDepart">
          <div class="form-group">
            <label for="nameNewDepart">Nombre del Departamento</label>
            <input type="text" class="form-control" id="nameNewDepart" aria-describedby="nameNewHelp" required>
            <small id="nameNewHelp" class="form-text text-muted">Escriba el Nombre del Departamento</small>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal Nuevo Modulo -->
<div class="modal fade" id="newModuleModal" tabindex="-1" aria-labelledby="NewModuleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="assingModuleModalLabel">Nuevo Modulo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_body">
        <form id="formNewModule">
          <div class="form-group">
            <label for="nameNewModule">Nombre del Modulo</label>
            <input type="text" class="form-control" id="nameNewModule" aria-describedby="nameNewHelp" required>
            <small id="nameNewHelp" class="form-text text-muted">Escriba el Nombre que tendra la carpeta dentro de
              sistema</small>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary closemodal" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal Listado de Modulos -->
<div class="modal fade" id="listModuleModal" tabindex="-1" aria-labelledby="listModuleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="listModuleModalLabel">Lista de Modulo Existentes</h5>
        <button type="button" class="close closemodal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="container-sm !justify !spacing">
        <div class="form-group">
          <label for="nameNewDepart">Nombre del Modulo</label>
          <input type="text" class="form-control" id="nameNewModule2" aria-describedby="nameNewModule2Help" required>
          <small id="nameNewModule2Help" class="form-text text-muted">Escriba el Nombre del Modulo que Desea
            Crear</small>
        </div>
      </div>
      <div id="alert_container" class="container-sm !justify !spacing">
        <div class="alert alert-danger" role="alert">
          <p id="text_alert"></p>
        </div>
      </div>

      <div class="modal-body" id="list_modal_body">
        <!-- Conteni SE Carga A traves de Ajax -->
      </div>
    </div>
  </div>
</div>

<!-- Modal Para Asignacion de Modulo -->
<div class="modal fade" id="assignModuleModal" tabindex="-1" aria-labelledby="assignModuleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="assingModuleModalLabel">Assingnacion de Modulo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_body">
        <form id="formAssignModule">
          <input type="hidden" name="id" id="idModuleByAssign">
          <div class="form-row">
            <div class="col-md-6">
              <label for="validationCustom03">Modulo</label>
              <input type="text" class="form-control" id="nameModuleByAssign" required disabled>
            </div>
            <div class="col-md-6">
              <label for="validationCustom04">Departamentos</label>
              <select class="custom-select" id="nameDepartAssign" required>
                <option value="">Choose...</option>
                <option>...</option>
              </select>
            </div>
            <small id="nameNewHelp" class="form-text text-muted text-center">Escriba el Nombre que tendra la carpeta
              dentro de
              sistema</small>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary closemodal" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal Nuevo Usuario -->
<div class="modal fade" id="newUserModal" tabindex="-1" aria-labelledby="newUserModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="newUserModalLabel">Nuevo Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_body">
        <form id="formUser">
          <div class="modal-body form-row">
            <input type="hidden" name="id" id="userId">
            <div class="form-group col-md-6">
              <label for="userName" class="form-label">Nombre Completo</label>
              <input type="text" class="form-control" id="userName" placeholder="Nombre y Apellido" required>
            </div>
            <div class="form-group col-md-6">
              <label for="userEmail" class="form-label">Email</label>
              <input type="email" class="form-control" id="userEmail" placeholder="Correo Electronico" required>
            </div>
            <div class="form-group col-lg-4">
              <label for="userLogin" class="form-label">Login</label>
              <input type="text" class="form-control" id="userLogin" placeholder="Para Iniciar Sesion" required>
            </div>
            <div class="form-group col-lg-4">
              <label for="pass" class="form-label">Contraseña</label>
              <input type="password" class="form-control" id="userpassword" placeholder="Para Iniciar Sesion" required>
            </div>
            <div class="form-group col-lg-4">
              <label for="usertypes" class="form-label">Tipo de Usuario</label>
              <select class="form-control" id="usertypes">
                <!-- Se carga a Traves de Archivo JS con arrow function "loadDataSelectUserTypes" -->
              </select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger btn-light" data-bs-dismiss="modal"
              aria-label="Close">Cancelar</button>
            <button type="submit" class="btn btn-outline-primary btn-light">Guardar</button>
          </div>
          <div id="messegecont" class="alert alert-warning d-none" role="alert">
            <p id="messegetext" class="mb-0">Alert Description</p>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal para Iniciar Sesion -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="card o-hidden border-0 shadow-lg">
          <div class="row">
            <div class="col-lg-6 d-none d-lg-block bg-login-image">
              <div class="text-center">
                <img class="img-fluid mt-5 mb-5 ml-5" style="width: 25rem;"
                  src="<?php echo  URL_ASSETS; ?>/img/undraw_posting_photo.svg" alt="...">
              </div>
            </div>
            <div class="col-lg-6">
              <div class="p-5">
                <div class="text-center">
                  <h1 class="h4 text-gray-900 mb-4">¡Bienvenido de nuevo!</h1>
                </div>
                <form class="user" id="formLogin">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="sessionlogin"
                      aria-describedby="emailHelp" placeholder="Ingrese su Login...">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-user" id="sessionpassword"
                      placeholder="Ingrese su Contraseña...">
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger btn-light" data-bs-dismiss="modal"
                      aria-label="Close">Cancelar</button>
                    <button type="submit" class="btn btn-outline-primary btn-light">Iniciar Sesion</button>
                  </div>
                  <div id="m_login_cont" class="alert alert-warning d-none" role="alert">
                    <p id="m_login_text" class="mb-0">Alert Description</p>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal Nuevo Cliente -->
<div class="modal fade" id="newClientModal" tabindex="-1" aria-labelledby="newClientModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="newUserModalLabel">Nuevo Cliente</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_body">
        <form id="formClient">
          <div class="modal-body form-row">
            <input type="hidden" name="id" id="clientId">
            <div class="form-group col-md-6">
              <label for="clientName" class="form-label">Nombre Completo</label>
              <input type="text" class="form-control" id="clientName" placeholder="Nombre y Apellido" required>
            </div>
            <div class="form-group col-md-6">
              <label for="clientDni" class="form-label">N° DNI // Cedula</label>
              <input type="text" class="form-control" id="clientDni" placeholder="N° DNI // Cedula de Identidad" maxlength="20">
            </div>
            <div class="form-group col-md-6">
              <label for="clientPhone" class="form-label">N° Telefonico Principal</label>
              <input type="text" class="form-control" id="clientPhone" name="clientPhone" placeholder="N° Telefonico" required maxlength="11">
              <small id="clientPhoneHelp" class="form-text text-muted">Escriba Codigo de Area Sin el Primer 0 + N° Telefonico</small>
            </div>
            <div class="form-group col-md-6">
              <label for="clientPhoneAlt" class="form-label">N° Telefonico Alternativo</label>
              <input type="text" class="form-control" id="clientPhoneAlt" placeholder="N° Telefonico" maxlength="20">
            </div>
            <div class="form-group col-md-6">
              <label for="clientEmail" class="form-label">Email</label>
              <input type="email" class="form-control" id="clientEmail" placeholder="Correo Electronico" required>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger btn-light" data-bs-dismiss="modal"
              aria-label="Close">Cancelar</button>
            <button type="submit" class="btn btn-outline-primary btn-light">Guardar</button>
          </div>
          <div id="m_client_cont" class="alert alert-warning d-none" role="alert">
            <p id="m_client_text" class="mb-0">Alert Description</p>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal Nueva Tasa de Cambio -->
<div class="modal fade" id="newRateModal" tabindex="-1" aria-labelledby="newRateModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="NewDepartModalLabel">Nuevo Departamento</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body " id="modal_body">
        <form id="formNewRate">
          <input type="hidden" name="id" id="idRate">
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="exchangeRate">Mont de la Tasa</label>
              <input type="text" class="form-control" id="exchangeRate" name="exchangeRate" aria-describedby="exchangeRateHelp" required>
              <small id="exchangeRateHelp" class="form-text text-muted">Monto de la Tasa de Cambio</small>
            </div>
            <div class="form-group col-md-4">
              <label for="dateRate">Fecha de la Tasa</label>
              <input type="date" class="form-control" id="dateRate" name="dateRate" aria-describedby="dateRateHelp" max="<?php echo date('Y-m-d'); ?>" required>
              <small id="dateRateHelp" class="form-text text-muted">Fecha de la Tasa de Cambio</small>
            </div>
            <div class="form-group col-md-4">
              <label for="validationCustom04">Tipo de Cambio</label>
              <select class="custom-select" id="exchange_rate" required>
                <!-- El Contenido  se carga a traves de Ajax Mediante Archivo js -->
              </select>
            </div>
          </div>
          <div id="m_rate_cont" class="alert alert-warning d-none" role="alert">
            <p id="m_rate_text" class="mb-0">Alert Description</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>