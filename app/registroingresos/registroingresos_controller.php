<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("registroingresos_module.php");

$incomes = new Incomes();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$income = (isset($_POST['income'])) ? $_POST['income'] : '';
$penalty = (isset($_POST['penalty'])) ? $_POST['penalty'] : 'false';
$detail = (isset($_POST['detail'])) ? $_POST['detail'] : '';
$percent = (isset($_POST['percent'])) ? $_POST['percent'] : 'false';
$mont = (isset($_POST['mont']) && (!empty($_POST['mont']))) ? $_POST['mont'] : NULL;
$montp = (isset($_POST['montp']) && (!empty($_POST['montp']))) ? $_POST['montp'] : NULL;

switch ($_GET["op"]) {
  case 'new_income':
    $dato = array();
    $penalty = ($penalty == 'true') ? 1 : 0;
    $percent = ($percent == 'true') ? 1 : 0;
    if (empty($id)) {
      $id = uniqid();
      $data = $incomes->createDataIncomeDB($id, $income, $penalty, $detail, $percent, $mont, $montp);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "El Gasto Fue Creada Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Crear El Gasto, Por Favor Intente Nuevamente \n";
      }
    } else {
      $data = $expenses->updateDataExpenseDB($id, $date, $detail, $mont, $quota);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "El Gasto Fue Actiualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Actualizar el Gasto, Por Favor Intente Nuevamente \n";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_list_income':
    $dato = array();
    $data = $incomes->getListDataIncomeDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['date'] = $row['datereg'];
      $sub_array['account'] = $row['incomeaccount'];
      $sub_array['income'] = $row['incomename'];
      $sub_array['aumont'] = number_format(($row['incomeaumont'] != NULL) ? $row['incomeaumont']  : 0, 2);
      $sub_array['percent'] = number_format(($row['amountpercent'] != NULL) ? $row['amountpercent']  : 0, 2);
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_expense':
    $dato = array();
    $data = $expenses->getDataExpenseDB($id);
    foreach ($data as $data) {
      $dato['id'] = $data['id'];
      $dato['date'] = $data['dateExpense'];
      $dato['suplier'] = $data['idSuplier'];
      $dato['account'] = $data['idExpenseAccount'];
      $dato['expense'] = $data['expenseName'];
      $dato['mont'] = number_format($data['montExpense'], 2);
      $dato['quota'] = ($data['quotasExpense']!=null) ? number_format($data['quotasExpense'], 2) : NULL; 
      $dato['dater'] = $data['dateRegExp'];
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'delete_expense':
    $data = $expenses->deleteClideleteExpenseDB($id);
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
