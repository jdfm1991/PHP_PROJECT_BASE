<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("recibocobro_module.php");

$colrec = new Receipts();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$cid = (isset($_POST['cid'])) ? $_POST['cid'] : '7';
$uid = (isset($_POST['uid'])) ? $_POST['uid'] : '686707bc60583';
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
    $data = $colrec->getDataExpenseAcountFixedDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $details = $colrec->getDataDetailsExpenseDB($row['id']);
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
    $data = $colrec->getDataExpenseAcountNonFixedDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $details = $colrec->getDataDetailsExpenseDB($row['id']);
      if (!empty($details)) {
        $sub_array['code'] = $row['codeaccount'];
        $sub_array['account'] = $row['expenseaccount'];
        $sub_array['details'] = $details;
        $dato[] = $sub_array;
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_receipt':
    $dato = array();
    if (empty($id)) {
      $check = $colrec->checkPeriodReceiptDB($cid, $uid);
      if ($check > 0) {
        $dato['status'] = false;
        $dato['httpstatus'] = '400';
        $dato['message'] = "Esta Departamento ya Existe Un Recibo En Este Periodo";
        echo json_encode($dato, JSON_UNESCAPED_UNICODE);
        return;
      }
      $id = uniqid();
      $data = $colrec->createDataReceiptsDB($id, $cid, $uid, $nreceipt, $inquilino, $concepto, $vence, $nivel, $aliquot, $email, $monto_gf, $monto_gv, $monto_p, $monto_i, $monto_tg);
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
        $dato['status'] = true;
        $dato['httpstatus'] = '200';
        $dato['message'] = "El Recibo Fue Creado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['httpstatus'] = '500';
        $dato['message'] = "Error Al Registrar el Recibo, Por Favor Intente Nuevamente \n";
      }
    } else {
      $data = $expenses->updateDataExpenseDB($id, $date, $detail, $mont, $quota);
      if ($data) {
        $dato['status'] = true;
        $dato['httpstatus'] = '200';
        $dato['message'] = "El Gasto Fue Actiualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['httpstatus'] = '500';
        $dato['message'] = "Error Al Actualizar el Gasto, Por Favor Intente Nuevamente \n";
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
      $sub_array['name'] = $row['nametenant'];
      $sub_array['concept'] = $row['conceptreceipt'];
      $sub_array['aumont'] = $row['aumont'];
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
