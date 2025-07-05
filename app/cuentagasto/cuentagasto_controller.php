<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("cuentagasto_module.php");

$expenses = new Expenses();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$unit = (isset($_POST['unit'])) ? $_POST['unit'] : '';
$level = (isset($_POST['levelu'])) ? $_POST['levelu'] : '';
$aliquot = (isset($_POST['aliquot'])) ? $_POST['aliquot'] : '';

switch ($_GET["op"]) {
  case 'get_type_expenses':
    $dato = array();
    $data = $expenses->getTypeExpensesBD();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['type'] = $row['expensetypename'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato);
    break;
  case 'get_unit_aliquots':
    $dato = array();
    $data = $unitdep->getUnitAliquotsBD();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['aliquot'] = $row['aliquot'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato);
    break;
  case 'get_unit_name_by_level':
    $newunitname = $unitdep->getNewUnitnameByLevelDB($id, $level);
    echo json_encode($newunitname, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_unit':
    $dato = array();
    if (empty($id)) {

      $id = uniqid();
      $data = $unitdep->createNewUnitDB($id, $unit, $level, $aliquot);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "La Unidad Departamental " . $unit . " Fue Creada Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Crear  la Unidad Departamental" . $unit . ", Por Favor Intente Nuevamente \n";
      }
    } else {
      $data = $unitdep->updateUnitDataDB($id, $unit, $aliquot);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "La Unidad Departamental " . $unit . " Fue Actiualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Actualizar La Unidad Departamental" . $unit . ", Por Favor Intente Nuevamente \n";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'get_list_units':
    $dato = array();
    $data = $unitdep->getListUnitsDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['unit'] = $row['unit'];
      $sub_array['level'] = $row['level'];
      $sub_array['aliquot'] = $row['aliquot'];
      $sub_array['enable'] = $row['enable'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'enable_unit':
    $enable = $unitdep->getEnableUnitDB($id);
    $status = ($enable == 1) ? 0 : 1;
    if ($status == 1) {
      $delete = $ralafidu->deleteFiduciaryRelationshipDB($id);
    }
    $data = $unitdep->changeEnableUnitDB($id, $status);
    if ($data) {
      $dato['status'] = true;
      $dato['error'] = '200';
      $dato['message'] = "El Cambio de Estatus Se Realizo Satisfactoriamente \n";
    } else {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "Error Al Realizar El Cambio de Estatus, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_unit':
    $dato = array();
    $data = $unitdep->getDataUnitDB($id);
    foreach ($data as $data) {
      $dato['id'] = $data['id'];
      $dato['unit'] = $data['unit'];
      $dato['level'] = $data['level'];
      $dato['aliquot'] = $data['aliquot'];
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  default:
    header("Location:" . URL_APP);
    break;
}
