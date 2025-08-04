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
          <h1 class="h3 mb-1 text-gray-800 text-center">Modulo de Banco <br> .::Carga de Estados de Cuentas::.</h1>
          <div class="card mb-2">
            <div class="card-body">
              <div class="list-group-item d-flex justify-content-center lh-sm">
                <button id="btn_view" type="button" class="btn btn-outline-primary btn-group-sm"> Ver Movimientos Bancario </button>
                <button id="btn_load" type="button" class="btn btn-outline-info btn-group-sm"> Cargar Estados de Cuentas </button>
              </div>
            </div>
          </div>
          <!-- Contenedor de Elementos para carga de estados de cuentas -->
          <div id="cont_load" class="card d-none">
            <div class="card-body">
              <form id="formBankStatement">
                <div class="input-group">
                  <input type="file" class="form-control-file" id="sheetexcel"
                    onkeyup="loaddds(1);" accept=".xlsx" required>
                </div>
              </form>
            </div>
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
          <div id="cont_view" class="card d-none">
            <div class="card-body">
              <div class="table-responsive">
                <table id="b_movements_table" class="table table-striped table-bordered" style="width:100%">
                  <thead>
                    <tr>
                      <th>Fecha</th>
                      <th>Concepto</th>
                      <th>Referencia</th>
                      <th>Monto Bs</th>
                      <th>Saldo Bs</th>
                      <th>Saldo $</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
              <!-- El Contenido  se carga a traves de Ajax -->
            </div>
          </div>
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