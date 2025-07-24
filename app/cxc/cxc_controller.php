<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once(PATH_APP . "/banco/banco_module.php");
require_once(PATH_APP . "/recibocobro/recibocobro_module.php");
require_once("cxc_module.php");

$receivable = new AccountsReceivable();
$colrec = new Receipts();
$bankmov = new BankingMovements();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$account = (isset($_POST['account'])) ? $_POST['account'] : '';
$date = (isset($_POST['date'])) ? $_POST['date'] : '';
$refer = (isset($_POST['refer'])) ? $_POST['refer'] : '';
$rate = (isset($_POST['rate'])) ? $_POST['rate'] : '';
$payd = (isset($_POST['payd'])) ? $_POST['payd'] : '';
$balance = (isset($_POST['balance'])) ? $_POST['balance'] : '';
$remaining = (isset($_POST['remaining'])) ? $_POST['remaining'] : '';
$check = (isset($_POST['check'])) ? $_POST['check'] : 'false';

switch ($_GET["op"]) {
  case 'get_list_accounts_receivable':
    $dato = array();
    $data = $receivable->getListAccountsReceivableDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['date'] = $row['daterec'];
      $sub_array['expiration'] = $row['expirationdate'];
      $sub_array['number'] = $row['numrec'];
      $sub_array['name'] = $row['nametenant'];
      $sub_array['balance'] = number_format($row['balencereceipt'], 2);
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_account_receivable':
    $dato = array();
    $data = $receivable->getAccountReceivableDB($id);
    foreach ($data as $row) {
      $dato['id'] = $row['id'];
      $dato['date'] = $row['daterec'];
      $dato['expiration'] = $row['expirationdate'];
      $dato['number'] = $row['numrec'];
      $dato['name'] = $row['nametenant'];
      $dato['concept'] = strtoupper('cobro Mes de ' . $row['conceptreceipt']);
      $dato['balance'] = number_format($row['balencereceipt'], 2);
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_pay_ar':
    $dollar = ($check == 'true') ? 1 : 0;
    $data = $receivable->createPayAccountsReceivableDB($account, $date, $refer, $rate, $payd, $balance, $remaining, $dollar);
    if ($data) {
      if ($remaining >= 0) {
        $amount = ceil($payd * $rate);
        $updr = $colrec->updateBalanceReceiptDB($account, $payd);
        $updb = $bankmov->updateBankingMovementDB($refer, $amount);
      } else {
        $amount = $balance * $rate;
        $updr = $colrec->updateBalanceReceiptDB($account, $balance);
        $updb = $bankmov->updateBankingMovementDB($refer, $amount);
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
