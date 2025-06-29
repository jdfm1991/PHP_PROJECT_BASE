<?php
date_default_timezone_set('america/caracas');
require_once("../../config/conexion.php");
require_once("dev_module.php");

$dev = new Development();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$module = (isset($_POST['module'])) ? $_POST['module'] : 'cosas';
$namelist = (isset($_POST['namelist'])) ? $_POST['namelist'] : '';
$copy = (isset($_POST['copy'])) ? $_POST['copy'] : 'clientes';
$depart = (isset($_POST['depart'])) ? $_POST['depart'] : '';


switch ($_GET["op"]) {
  case 'new_depart':
    $dato = array();
    $arraydepart = explode(" ", $depart);
    $tagdepart = end($arraydepart);
    if (empty($id)) {
      $id = uniqid();
      $data = $dev->createDepartmentDB($id, $depart, $tagdepart);
      if ($data) {
        $dato['status'] = true;
        $dato['message'] = "El Departamento " . $depart . " Fue Creado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['message'] = "Error Al Crear Departamento" . $depart . ", Por Favor Intente Nuevamente \n";
      }
    } else {
      $data = $dev->updateDepartmentDB($id, $depart, $tagdepart);
      if ($data) {
        $dato['status'] = true;
        $dato['message'] = "El Departamento " . $depart . " Fue Actualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['message'] = "Error Al Actualizar Departamento" . $depart . ", Por Favor Intente Nuevamente \n";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'list_depart':
    $dato = array();
    $data = $dev->getListDepartmentDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['name'] = $row['nameDepartment'];
      if ($row['statusDepartment'] == 1) {
        $sub_array['icon'] = '<i class="bi bi-lightbulb-fill"></i>';
        $sub_array['color'] = 'warning';
      } else {
        $sub_array['icon'] = '<i class="bi bi-lightbulb-off-fill"></i>';
        $sub_array['color'] = 'dark';
      }
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'trash_depart':
    $dato = array();
    $valited = $dev->getValitedDepartmentDB($depart);
    if ($valited) {
      $dato['status'] = false;
      $dato['message'] = "Error Al Este Departamento Posee Modulos Asignados, Por Favor Intente Nuevamente \n";
    } else {
      $availability = $dev->getAvailabilityDepartmenttDB($depart);
      $available = ($availability == 1) ? 0 : 1;
      $data = $dev->changeAvailabilityDepartmentDB($depart, $available);
      if ($data) {
        $dato['status'] = true;
        $dato['message'] = "El Departamento Se Elimino Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['message'] = "Error Al Eliminar Departamento, Por Favor Intente Nuevamente \n";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'enable_depart':
    $dato = array();
    $enable = $dev->getStatusDepartmentDB($depart);
    $status = ($enable == 1) ? 0 : 1;
    $data = $dev->changeStatusDepartmentDB($depart, $status);
    if ($data) {
      $dato['status'] = true;
      $dato['message'] = "El Departamento Se Actualizo Satisfactoriamente \n";
    } else {
      $dato['status'] = false;
      $dato['message'] = "Error Al Actualizar Departamento, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_name_depart':
    $dato = array();
    $name = $dev->getNameDepartmentDB($depart);
    $dato['name'] = $name;
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_folder_module':
    $dato = array();
    $files = array(
      "index.php",
      $module . "_controller.php",
      $module . "_module.php",
      $module . ".js",
    );
    $path = PATH_APP . '/' . $module;
    if (!is_dir($path)) {
      $sub_array = array();
      mkdir($path, 0777, true);
      foreach ($files as $file) {
        touch($path . '/' . $file);
      }
      $dato['status'] = true;
      $sub_array['message'] = "El Modulo Fue Creado Satisfactoriamente \n";
      $dato[] = $sub_array;
    } else {
      $dato['status'] = false;
      $sub_array['message'] = "Error Al Crear Modulo, Ya existe Un Modulo Con El Mismo Nombre Creado Previamente \n";
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'available_modules':
    $dato = array();
    $dato1 = array();
    $dato2 = array();
    $path = PATH_APP;
    $data = $dev->getListNameModulesDB();
    foreach ($data as $row) {
      $sub_array = array();
      $dato1[] = $row['nameModule'];
    }
    if (is_dir($path)) {
      $elementos = scandir($path);
      foreach ($elementos as $elemento) {
        $sub_array = array();
        if ($elemento != "." && $elemento != "..") { // Evitar . y ..
          $ruta_completa = $path . '/' . $elemento;
          if (is_dir($ruta_completa)) {
            if ($elemento !== 'development' && $elemento !== 'manager') {
              $dato2[] = $elemento;
            }
          }
        }
      }
      $datos = array_diff($dato2, $dato1);
      foreach ($datos as $row) {
        $sub_array = array();
        $sub_array['folder'] = $row;
        $dato[] = $sub_array;
      }
    } else {
      echo "El directorio especificado no existe.";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'new_module':
    $dato = array();
    if (empty($id)) {
      $id = uniqid();
      $data = $dev->createModuleDB($id, $module, $namelist);
      if ($data) {
        $dato['status'] = true;
        $dato['message'] = "El Modulo " . $namelist . " Fue Creado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['message'] = "Error Al Crear Modulo" . $namelist . ", Por Favor Intente Nuevamente \n";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'copy_module':
    $root = PATH_APP . '/' . $module;
    if (!is_dir($root)) {
      $sub_array = array();
      mkdir($root, 0777, true);
      $path = PATH_APP;
      $from = PATH_APP . '/' . $copy;
      $to = PATH_APP . '/' . $module;
      //Abro el directorio que voy a leer
      $dir = opendir($from);
      //Recorro el directorio para leer los archivos que tiene
      while (($file = readdir($dir)) !== false) {
        $new_file = str_replace($copy, $module, $file);
        //Leo todos los archivos excepto . y ..
        if (strpos($file, '.') !== 0) {
          //Copio el archivo manteniendo el mismo nombre en la nueva carpeta
          copy($from . '/' . $file, $to . '/' . $new_file);
        }
      }
      closedir($dir);
      $dato['status'] = true;
      $sub_array['message'] = "El Modulo Fue Creado Satisfactoriamente \n";
      $dato[] = $sub_array;
    } else {
      $dato['status'] = false;
      $sub_array['message'] = "Error Al Crear Modulo, Ya existe Un Modulo Con El Mismo Nombre Creado Previamente \n";
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_name_module':
    $dato = array();
    $data = $dev->getListModulesDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['name'] = $row['nameModule'];
      if ($row['statusModule'] == 1) {
        $sub_array['icon'] = '<i class="bi bi-lightbulb-fill"></i>';
        $sub_array['color'] = 'warning';
      } else {
        $sub_array['icon'] = '<i class="bi bi-lightbulb-off-fill"></i>';
        $sub_array['color'] = 'dark';
      }
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  default:
    header("Location:" . URL_APP);
    break;
}
