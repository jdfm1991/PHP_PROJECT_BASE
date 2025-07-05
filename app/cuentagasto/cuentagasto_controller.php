<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("cuentagasto_module.php");

$expenses = new Expenses();

$id = (isset($_POST['id'])) ? $_POST['id'] : '6869260d82a19';
$type = (isset($_POST['type'])) ? $_POST['type'] : '1';
$code = (isset($_POST['code'])) ? $_POST['code'] : '1';
$fixe = (isset($_POST['fixed'])) ? $_POST['fixed'] : 'false';
$expense = (isset($_POST['expense'])) ? $_POST['expense'] : '1';

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
  case 'get_code_expense_by_type':
    $prefix = substr($type, 0, 4);
    $code = $expenses->getNewCodeExpenseByTypeDB($id, $prefix);
    echo json_encode($code, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_expense_account':
    $dato = array();
    if (empty($id)) {
      $id = uniqid();
      $fixed = ($fixe == 'true') ? 1 : 0;
      $data = $expenses->createExpenseAccountDB($id, $type, $code, $fixed, $expense);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "La Cuenta de Gasto " . $expense . " Fue Creada Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Crear La Cuenta de Gasto" . $expense . ", Por Favor Intente Nuevamente \n";
      }
    } else {
      $fixed = ($fixe == 'true') ? 1 : 0;
      $data = $expenses->updateDataExpenseAccountDB($id, $type, $code, $fixed, $expense);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "La Cuenta de Gastol " . $expense . " Fue Actiualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Actualizar La Cuenta de Gasto" . $expense . ", Por Favor Intente Nuevamente \n";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'get_list_expense_accounts':
    $dato = array();
    $data = $expenses->getListExpenseAccountsDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['type'] = $row['type'];
      $sub_array['code'] = $row['code'];
      $sub_array['fixed'] = ($row['fixed'] == 1) ? 'GASTO FIJO' : 'GASTO VARIABLE';
      $sub_array['expense'] = $row['expense'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_expense_account':
    $dato = array();
    $data = $expenses->getDataExpenseAccountDB($id);
    foreach ($data as $data) {
      $dato['id'] = $data['id'];
      $dato['type'] = $data['type'];
      $dato['code'] = $data['code'];
      $dato['fixed'] = $data['fixed'];
      $dato['expense'] = $data['expense'];
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'delete_expense_account':
    /* $valided = $ralafidu->validedFiduciaryRelationshipDB($id);
    if ($valided > 0) {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "No Puede Eliminiar Este Cliente, Ya que Tiene Relacion Con Una Unidad Departamental, Por Favor Intente Con Un Cliente Diferente \n";
      echo json_encode($dato, JSON_UNESCAPED_UNICODE);
      return;
    } */
    $data = $expenses->deleteClideleteExpenseAccountDBentDB($id);
    if ($data) {
      $dato['status'] = true;
      $dato['error'] = '200';
      $dato['message'] = "La Cuenta Fue Eliminado Satisfactoriamente \n";
    } else {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "Error Al Elminar La Cuenta, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  default:
    header("Location:" . URL_APP);
    break;
}
