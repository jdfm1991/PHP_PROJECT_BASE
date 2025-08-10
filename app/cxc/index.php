<!DOCTYPE html>
<html lang="en">
<?php
require_once("../head.php");
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
          <h1 class="h3 mb-4 text-gray-800 text-center">Modulo de Cuentas Por Cobrar <br> .::Liquidacion Y Abonos::.</h1>
          <div class="card">
            <div class="card-body">
              <table id="cxc_table" class="table table-striped table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>Fecha</th>
                    <th>Departamento</th>
                    <th>Recibo</th>
                    <th>Inquilino</th>
                    <th>Monto Deuda</th>
                    <th>Monto Mora</th>
                    <th>Monto Admtvo.</th>
                    <th>Monto Total</th>
                    <th>Opcion</th>
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
  <script src="cxc.js"></script>
</body>

</html>