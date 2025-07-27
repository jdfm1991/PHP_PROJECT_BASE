<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once(PATH_APP . "/cuentagasto/cuentagasto_module.php");
require_once(PATH_APP . "/registrogasto/registrogasto_module.php");
require_once(PATH_APP . "/cuentaingresos/cuentaingresos_module.php");
require_once(PATH_APP . "/registroingresos/registroingresos_module.php");
require_once(PATH_APP . "/unidaddepartamental/unidaddepartamental_module.php");
require_once("recibocobro_module.php");

$colrec = new Receipts();
$expaccount = new ExpenseAccounts();
$expenses = new Expenses();
$incomeaccounts = new IncomeAccounts();
$unitdep = new Unitdepartmental();
$incomes = new Incomes();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$cid = (isset($_POST['cid'])) ? $_POST['cid'] : '23';
$uid = (isset($_POST['uid'])) ? $_POST['uid'] : '68670751dafb8';
$typerec = (isset($_POST['typerec'])) ? $_POST['typerec'] : 'COBR';
$depart = (isset($_POST['depart'])) ? $_POST['depart'] : '';
$nreceipt = (isset($_POST['nrecibo'])) ? $_POST['nrecibo'] : '';
$inquilino = (isset($_POST['inquilino'])) ? $_POST['inquilino'] : '';
$concepto = (isset($_POST['concepto'])) ? $_POST['concepto'] : '';
$vence = (isset($_POST['vence'])) ? $_POST['vence'] : '';
$nivel = (isset($_POST['nivel'])) ? $_POST['nivel'] : '';
$aliquot = (isset($_POST['aliquot'])) ? $_POST['aliquot'] : '';
$email = (isset($_POST['email'])) ? $_POST['email'] : '';
$monto_gf = (isset($_POST['monto_gf'])) ? $_POST['monto_gf'] : '';
$monto_gv = (isset($_POST['monto_gv'])) ? $_POST['monto_gv'] : '';
$monto_p = (isset($_POST['monto_p'])) ? $_POST['monto_p'] : '';
$monto_i = (isset($_POST['monto_i'])) ? $_POST['monto_i'] : '';
$monto_tg = (isset($_POST['monto_tg'])) ? $_POST['monto_tg'] : '';
$itemreceipt = (isset($_POST['dataexpense'])) ? $_POST['dataexpense'] : '';

switch ($_GET["op"]) {
  case 'get_new_number':
    $dato = $colrec->getNewNumberReceiptDB();
    echo json_encode($dato);
    break;
  case 'get_data_expense_fixed':
    $dato = array();
    $data = $expaccount->getDataExpenseAcountFixedDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $details = $expenses->getDataDetailsExpenseDB($row['id']);
      if (!empty($details)) {
        $sub_array['code'] = $row['codeaccount'];
        $sub_array['account'] = $row['expenseaccount'];
        $sub_array['details'] = $details;
        $dato[] = $sub_array;
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_expense_non_fixed':
    $dato = array();
    $data = $expaccount->getDataExpenseAcountNonFixedDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $details = $expenses->getDataDetailsExpenseDB($row['id']);
      if (!empty($details)) {
        $sub_array['code'] = $row['codeaccount'];
        $sub_array['account'] = $row['expenseaccount'];
        $sub_array['details'] = $details;
        $dato[] = $sub_array;
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_income':
    $dato = array();
    $data = $incomeaccounts->getDataIncomeAcountDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $details = $incomes->getDataDetailsIncomeDB($row['id']);
      if (!empty($details)) {
        $sub_array['code'] = $row['codeaccount'];
        $sub_array['account'] = $row['incomeaccount'];
        $sub_array['details'] = $details;
        $dato[] = $sub_array;
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_penalty':
    $dato = array();
    $data = $incomeaccounts->getDataPenaltyAcountDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $details = $incomes->getDataDetailsIncomeDB($row['id']);
      if (!empty($details)) {
        $sub_array['code'] = $row['codeaccount'];
        $sub_array['account'] = $row['incomeaccount'];
        $sub_array['details'] = $details;
        $dato[] = $sub_array;
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_receipt':
    $dato = array();
    $check = $colrec->checkPeriodReceiptDB($cid, $uid);
    if ($check > 0 && $typerec == 'COBRO') {
      $dato['status'] = false;
      $dato['httpstatus'] = '400';
      $dato['message'] = "Esta Departamento ya Existe Un Recibo En Este Periodo";
      echo json_encode($dato, JSON_UNESCAPED_UNICODE);
      return;
    }
    $id = uniqid();
    $data = $colrec->createDataReceiptsDB($id, $cid, $uid, $nreceipt, $inquilino, $concepto, $vence, $nivel, $aliquot, $email, $monto_gf, $monto_gv, $monto_p, $monto_i, $monto_tg, $typerec, $depart);
    if ($data) {
      $i = 0;
      foreach (json_decode($itemreceipt, true) as $row) {
        $dataitems = $colrec->createDataReceiptItemsDB($id, $row['type'], $row['code'], $row['expense'], $row['amount']);
        if ($dataitems) {
          $i++;
        }
      }
      if ($i == count(json_decode($itemreceipt, true))) {
        $dato['status'] = true;
        $dato['httpstatus'] = '200';
        $dato['message'] = "El Recibo Fue Creado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['httpstatus'] = '500';
        $dato['message'] = "Error Al Registar algun Item, Por Favor Intente Nuevamente \n";
      }
    } else {
      $dato['status'] = false;
      $dato['httpstatus'] = '500';
      $dato['message'] = "Error Al Registrar el Recibo, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'generate_receipt_automatic':
    $dato = array();
    $i = 0;
    $j = 0;
    $data = $unitdep->getDataAllUnitClientDB();
    foreach ($data as $row) {
      $check = $colrec->checkPeriodReceiptDB($row['cid'], $row['uid']);
      if ($check > 0) {
        $i++;
        $dato['status'] = true;
        $dato['httpstatus'] = '200';
        $dato['message'] = "De los " . count($data) . " Departamentos que Existen, se gerenaron " . $j . " Recibos de cobro, ya que " . $i . " Se Generaron,  Exitosamente En Este Periodo con anterioridad \n";
      } else {
        $j++;
        $id = uniqid();
        $monto_gf = 0;
        $monto_gv = 0;
        $monto_p = 0;
        $monto_i = 0;
        $monto_tg = 0;
        $nreceipt = $colrec->getNewNumberReceiptDB();
        $typerec = 'COBRO';
        $depart = $row['unit'];
        $receipt = $colrec->createDataReceiptsDB($id, $row['cid'], $row['uid'], $nreceipt, $row['nameClient'], $row['concepto'], $row['vence'], $row['level'], $row['aliquot'], $row['emailClient'], $monto_gf, $monto_gv, $monto_p, $monto_i, $monto_tg, $typerec, $depart);
        if ($receipt) {
          $af = $expaccount->getDataExpenseAcountFixedDB();
          foreach ($af as $row2) {
            $details = $expenses->getDataDetailsExpenseDB($row2['id']);
            if (!empty($details)) {
              foreach ($details as $row3) {
                $dataitems = $colrec->createDataReceiptItemsDB($id, $row2['id'], $row3['id'], $row3['expenseName'], (($row3['aumont'] * $row['aliquot']) / 100));
                if ($dataitems) {
                  $monto_gf = $monto_gf + (($row3['aumont'] * $row['aliquot']) / 100);
                }
              }
            }
          }
          $anf = $expaccount->getDataExpenseAcountNonFixedDB();
          foreach ($anf as $row2) {
            $details = $expenses->getDataDetailsExpenseDB($row2['id']);
            if (!empty($details)) {
              foreach ($details as $row3) {
                $dataitems = $colrec->createDataReceiptItemsDB($id, $row2['id'], $row3['id'], $row3['expenseName'], (($row3['aumont'] * $row['aliquot']) / 100));
                if ($dataitems) {
                  $monto_gv = $monto_gv + (($row3['aumont'] * $row['aliquot']) / 100);
                }
              }
            }
          }
          $ai = $incomeaccounts->getDataIncomeAcountDB();
          foreach ($ai as $row2) {
            $details = $incomes->getDataDetailsIncomeDB($row2['id']);
            if (!empty($details)) {
              foreach ($details as $row3) {
                $dataitems = $colrec->createDataReceiptItemsDB($id, $row2['id'], $row3['id'], $row3['incomename'], (($row3['incomebalance'] * $row['aliquot']) / 100));
                if ($dataitems) {
                  $monto_i = $monto_i + (($row3['incomebalance'] * $row['aliquot']) / 100);
                }
              }
            }
          }
          $monto_tg = $monto_gf + $monto_gv + $monto_i;
          $uptdatereceipt = $colrec->updateReceiptBalancestDB($id, $monto_gf, $monto_gv, $monto_i, $monto_tg);
          if ($uptdatereceipt) {
            $dato['status'] = true;
            $dato['httpstatus'] = '200';
            $dato['message'] = "Actualmente Se Existe " . count($data) . " Recibos Pendientes Por Generar, De los cuales " . $j . " Se Generaron Exitosamente y " . $i . " No Se Generaron Porque Ya Existen Recibos En Este Periodo\n";
          }
        }
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_list_receipts':
    $dato = array();
    $data = $colrec->getDataReceiptsDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['date'] = $row['daterec'];
      $sub_array['number'] = $row['numrec'];
      $sub_array['unit'] = $row['unitdep'];
      $sub_array['name'] = $row['nametenant'];
      $sub_array['concept'] = $row['conceptreceipt'];
      $sub_array['aumont'] = number_format($row['aumont'], 2);
      $sub_array['type'] = $row['typerec'];
      $sub_array['expiration'] = $row['expirationdate'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'delete_receipt':
    /* $valided = $ralafidu->validedFiduciaryRelationshipDB($id);
    if ($valided > 0) {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "No Puede Eliminiar Este Cliente, Ya que Tiene Relacion Con Una Unidad Departamental, Por Favor Intente Con Un Cliente Diferente \n";
      echo json_encode($dato, JSON_UNESCAPED_UNICODE);
      return;
    } */
    $data = $colrec->deleteDataReceiptDB($id);
    if ($data) {
      $dato['status'] = true;
      $dato['error'] = '200';
      $dato['message'] = "El Cliente Fue Eliminado Satisfactoriamente \n";
    } else {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "Error Al Cliente El Usuario, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  default:
    header("Location:" . URL_APP);
    break;
}
