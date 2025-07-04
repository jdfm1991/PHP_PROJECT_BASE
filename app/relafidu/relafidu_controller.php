<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once(PATH_APP . "/unidaddepartamental/unidaddepartamental_module.php");
require_once("relafidu_module.php");

$unitdep = new Unitdepartmental();
$ralafidu = new FiduciaryRelationship();

$unit = (isset($_POST['unit'])) ? $_POST['unit'] : '';
$client = (isset($_POST['client'])) ? $_POST['client'] : '';

switch ($_GET["op"]) {
  case 'get_list_units':
    $dato = array();
    $datafull = $unitdep->getListUnitsDB();
    foreach ($datafull as $row) {
      $sub_array = array();
      $unit = $ralafidu->getFiduciaryRelationshipDB($row['id']);
      if ($unit != $row['id']) {
        $sub_array['id'] = $row['id'];
        $sub_array['unit'] = $row['unit'];
        $dato[] = $sub_array;
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_fidu_rela':;
    $data = $ralafidu->createNewFiduciaryRelationshipDB($client, $unit);
    if ($data) {
      $enable = 0;
      $data = $unitdep->changeEnableUnitDB($unit, $enable);
      $dato['status'] = true;
      $dato['error'] = '200';
      $dato['message'] = "La Relacion Fiduciaria Fue Creada Satisfactoriamente \n";
    } else {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "Error Al Crear  la Relacion Fiduciaria, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_list_relafidu':
    $dato = array();
    $data = $ralafidu->getListFiduciaryRelationshipDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['unit'] = $row['unit'];
      $sub_array['level'] = $row['level'];
      $sub_array['client'] = $row['nameClient'];
      $sub_array['iunit'] = $row['iunit'];
      $sub_array['iclient'] = $row['iclient'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  default:
    header("Location:" . URL_APP);
    break;
}
