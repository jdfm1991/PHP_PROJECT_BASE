<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("registroingresos_module.php");

$incomes = new Incomes();

$id = (isset($_POST['id'])) ? $_POST['id'] : '688257338a0c1';
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
        $dato['message'] = "El Ingreso Fue Creada Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Crear El Ingreso, Por Favor Intente Nuevamente \n";
      }
    } else {
      $data = $incomes->updateDataIncomeDB($id, $detail, $mont, $montp);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "El Ingreso Fue Actiualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Actualizar el Ingreso, Por Favor Intente Nuevamente \n";
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
  case 'get_data_income':
    $dato = array();
    $data = $incomes->getDataIncomeDB($id);
    foreach ($data as $data) {
      $dato['id'] = $data['id'];
      $dato['date'] = $data['datereg'];
      $dato['account'] = $data['incomeaccount'];
      $dato['byreceipt'] = $data['byreceipt'];
      $dato['income'] = $data['incomename'];
      $dato['perc'] = $data['percent'];
      $dato['percent'] = ($data['amountpercent']!=null) ? number_format($data['amountpercent'], 2) : ''; 
      $dato['aumont'] = ($data['incomeaumont']!=null) ? number_format($data['incomeaumont'], 2) : ''; 
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'delete_income':
    $data = $incomes->deleteDataIncomeDB($id);
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
