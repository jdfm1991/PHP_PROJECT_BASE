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
          <h1 class="h3 mb-4 text-gray-800 text-center">Modulo de Relacion de Fiduciarios <br> .::Creacion y Modificacion::.</h1>
          <div class="card mb-2">
            <div class="card-body">
              <details>
                <summary>
                  <span class="text-monospace">
                    <i class="fas fa-users"></i> Ver Clientes <i class="fas fa-users"></i>
                  </span>
                  <input class="form-control form-control-sm w-25 d-inline float-end mx-2" type="search" name="searchClient" id="searchClient">
                </summary>
                <input type="hidden" name="clientId" id="clientId">
                <div id="client_container" class="row list-group-item d-flex justify-content-between lh-sm align-items-center contenido">
                </div>
              </details>
              <details>
                <summary><span class="text-monospace"><i class="bi bi-building"></i> Ver Unidades Departamentales <i class="bi bi-building"></i></span></summary>
                <div id="unit_container" class="row list-group-item d-flex justify-content-between lh-sm align-items-center">
                </div>
              </details>
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <table id="relafidu_table" class="table table-striped table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>Departamento</th>
                    <th>Nivel</th>
                    <th>Inquilino</th>
                    <th>Estatus</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
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
  <script src="relafidu.js"></script>
</body>

</html>