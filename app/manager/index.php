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
          <h1 class="h3 mb-4 text-gray-800 text-center">Modulo de Desarrollo .::Estructuracion Departamentos y Modulos::.</h1>
          <div class="card mb-2">
            <div class="card-body">
              <p class="text-monospace text-center">.::Modulos Disponibles Para Ser Asignados A Un Departamento::.</p>
              <div id="modulescontainer" class="row list-group-item d-flex justify-content-between lh-sm align-items-center">
                <button id="b_module_available" type="button" class="btn btn-outline-success btn-group-sm"> Modulos de Sistema </button>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <div id="module_body">
                <div class="accordion" id="accordionDepartment">
                  <div class="card">
                    <div class="card-header" id="headingOne">
                      <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                          Collapsible Group Item #1
                        </button>
                      </h2>
                    </div>

                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                      <div class="card-body">
                        Some placeholder content for the first accordion panel. This panel is shown by default, thanks to the <code>.show</code> class.
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="headingTwo">
                      <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          Collapsible Group Item #2
                        </button>
                      </h2>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                      <div class="card-body">
                        Some placeholder content for the second accordion panel. This panel is hidden by default.
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="headingThree">
                      <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                          Collapsible Group Item #3
                        </button>
                      </h2>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                      <div class="card-body">
                        And lastly, the placeholder content for the third and final accordion panel. This panel is hidden by default.
                      </div>
                    </div>
                  </div>
                </div>
                <!-- El Contenido  se carga a traves de Ajax -->
              </div>

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
  require_once(PATH_ASSETS . '/components/modal.html');

  ?>
  <script src="man.js"></script>
</body>

</html>