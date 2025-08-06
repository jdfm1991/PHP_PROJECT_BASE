<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once(PATH_APP . "/registrogasto/registrogasto_module.php");
require_once(PATH_APP . "/banco/banco_module.php");
require_once("cxp_module.php");

$payable = new AccountsPayable();
$expenses = new Expenses();
$bankmov = new BankingMovements();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$account = (isset($_POST['account'])) ? $_POST['account'] : '';
$date = (isset($_POST['date'])) ? $_POST['date'] : '';
$idrefer = (isset($_POST['idrefer'])) ? $_POST['idrefer'] : '';
$refer = (isset($_POST['refer'])) ? $_POST['refer'] : '';
$rate = (isset($_POST['rate'])) ? $_POST['rate'] : '';
$payd = (isset($_POST['payd'])) ? $_POST['payd'] : '';
$balance = (isset($_POST['balance'])) ? $_POST['balance'] : '';
$remaining = (isset($_POST['remaining'])) ? $_POST['remaining'] : '';
$check = (isset($_POST['check'])) ? $_POST['check'] : 'false';

switch ($_GET["op"]) {
  case 'get_list_accounts_payable':
    $dato = array();
    $data = $payable->getListSupliersDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['date'] = $row['dateExpense'];
      $sub_array['suplier'] = $row['nameSuplier'];
      $sub_array['expense'] = $row['expenseName'];
      $sub_array['balance'] = number_format($row['balanceExpense'], 2);
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_expense':
    $dato = array();
    $data = $expenses->getDataExpenseDB2($id);
    foreach ($data as $data) {
      $dato['id'] = $data['id'];
      $dato['date'] = $data['dateExpense'];
      $dato['suplier'] = $data['nameSuplier'];
      $dato['account'] = $data['expense'];
      $dato['expense'] = $data['expenseName'];
      $dato['balance'] = number_format($data['balanceExpense'], 2);
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_pay_ar':
    $dollar = ($check == 'true') ? 1 : 0;
    $data = $payable->createPayAccountsReceivableDB($account, $date, $refer, $rate, $payd, $balance, $remaining, $dollar);
    if ($data) {
      if ($remaining >= 0) {
        $amount = ceil($payd * $rate);
        $updr = $expenses->updateBalanceExpenseDB($account, $payd);
        $updb = $bankmov->updateBankingMovementDB($idrefer, $amount);
      } else {
        $amount = $balance * $rate;
        $updr = $expenses->updateBalanceExpenseDB($account, $balance);
        $updb = $bankmov->updateBankingMovementDB($idrefer, $amount);
      }
      $dato['status'] = true;
      $dato['error'] = '200';
      $dato['message'] = "La Relacion Fue Creado Satisfactoriamente \n";
    } else {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "Error Al Registrar el Pago, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  default:
    header("Location:" . URL_APP);
    break;
}
