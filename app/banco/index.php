<!DOCTYPE html>
<html lang="en">
<?php
require_once("../../config/const.php");
require_once(PATH_APP . "/head.php");
?>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <?php
    require_once(PATH_APP . "/menu.php");
    ?>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">
        <?php
        require_once(PATH_APP . "/navbar.php");
        ?>
        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800 text-center">Modulo de Banco <br> .::Estados de Cuentas y
            Conciliacion::.</h1>
          <!-- Contenedor de Elementos para carga de estados de cuentas -->
          <details>
            <summary>
              <span class="text-monospace">
                <i class="bi bi-file-earmark-spreadsheet"></i> Carga de estados de cuentas (xlsx)
                <i class="bi bi-file-earmark-spreadsheet"></i>
              </span>
            </summary>
            <form id="formBankStatement">
              <div class="card mb-2">
                <div class="card-body">
                  <div class="row d-flex justify-content-between">
                    <div class="col-lg-6">
                      <div class="input-group">
                        <input type="file" class="form-control-file" id="sheetexcel"
                          onkeyup="loaddds(1);" accept=".xls,.xlsx" required>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </form>
            <div class="card">
              <div class="card-body">
                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                  <div id="wait_time" class="alert d-none" role="alert">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                      <img id="loader" alt="loader" class="img-fluid my-3 mx-auto"
                        width="150" /><br>
                    </div>
                    <div id="m_load_file" class="text-center">

                    </div>
                  </div>
                </div>
                <div id="content_data">
                  <div class="card">
                    <div class="card-header">
                      <div class="row d-flex justify-content-between">
                        <h3 class="text-center col-sm-10">Datos de hoja de Excel</h3>
                        <button class="btn btn-outline-info btn-group-sm" id="load_data">Cargar
                          Datos</button>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="container">
                        <div class="row">
                          <div class="col-lg-12">
                            <div class="table-responsive">
                              <table id="data_table" class="table table-striped"
                                style="width:100%">


                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </details>
          <!-- Contenedor de Elementos para realizar la conciliacion de los movimentos de las cuentas -->
          <details>
            <summary>
              <span class="text-monospace">
                <i class="bi bi-cash-coin"></i> Conciliacion de Estados de Cuentas
                <i class="bi bi-cash-coin"></i>
              </span>
            </summary>
            <div class="card">
              <div class="card-body">
                <div id="module_body">
                  <table id="expense_account_table" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                      <tr>
                        <th>Cuenta</th>
                        <th>Codigo</th>
                        <th>Tipo</th>
                        <th>Concepto</th>
                        <th>Accion</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                  <!-- El Contenido  se carga a traves de Ajax -->
                </div>

              </div>
            </div>
          </details>
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
      <?php
      require_once(PATH_APP . "/footer.php");
      ?>
    </div>
    <!-- End of Content Wrapper -->
  </div>
  <!-- End of Page Wrapper -->
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  <?php
  require_once(PATH_APP . "/plugins.php");
  require_once(PATH_ASSETS . '/components/modal.php');
  ?>
  <script src="banco.js"></script>
</body>

</html>