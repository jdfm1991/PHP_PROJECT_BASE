<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once(PATH_APP . "/registrogasto/registrogasto_module.php");
require_once("cuentaingresos_module.php");

$incomeaccounts = new IncomeAccounts();
$expenses = new Expenses();

$id = (isset($_POST['id'])) ? $_POST['id'] : '68817fcedd832';
$type = (isset($_POST['type'])) ? $_POST['type'] : '';
$code = (isset($_POST['code'])) ? $_POST['code'] : '';
$income = (isset($_POST['income'])) ? $_POST['income'] : '';

switch ($_GET["op"]) {
  case 'get_income_type':
    $dato = array();
    $data = $incomeaccounts->getDataIncomeTypeBD();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['type'] = $row['incometypename'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato);
    break;
  case 'get_code_income_by_type':
    $prefix = substr($type, 0, 4);
    $code = $incomeaccounts->getNewCodeIncomeByTypeDB($id, $prefix);
    echo json_encode($code, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_income_account':
    $dato = array();
    if (empty($id)) {
      $id = uniqid();
      $data = $incomeaccounts->createIncomeAccountDB($id, $type, $code, $income);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "La Cuenta de Ingresos " . $income . " Fue Creada Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Crear La Cuenta de Ingresos" . $income . ", Por Favor Intente Nuevamente \n";
      }
    } else {
      $data = $incomeaccounts->updateDataIncomeAccountDB($id, $income);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "La Cuenta de Ingresos " . $income . " Fue Actiualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Actualizar La Cuenta de Ingresos " . $income . ", Por Favor Intente Nuevamente \n";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'get_list_income_accounts':
    $dato = array();
    $data = $incomeaccounts->getListIncomeAccountsDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['type'] = $row['type'];
      $sub_array['code'] = $row['code'];
      $sub_array['income'] = $row['income'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_income_account':
    $dato = array();
    $data = $incomeaccounts->getDataIncomeAccountDB($id);
    foreach ($data as $data) {
      $dato['id'] = $data['id'];
      $dato['type'] = $data['typeaccount'];
      $dato['code'] = $data['codeaccount'];
      $dato['income'] = $data['incomeaccount'];
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'delete_income_account':
    /* $valided = $expenses->validateAccountsRelatedExpensesDB($id);
    if ($valided > 0) {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "No Puede Eliminiar Esta Cuenta, Ya que Tiene Relacion Con Un Gasto, Por Favor Intente Con Un Cliente Diferente \n";
      echo json_encode($dato, JSON_UNESCAPED_UNICODE);
      return;
    }  */
    $data = $incomeaccounts->deleteIncomeAccountDB($id);
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
