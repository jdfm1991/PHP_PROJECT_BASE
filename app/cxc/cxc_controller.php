<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("cxc_module.php");

$receivable = new AccountsReceivable();

$id = (isset($_POST['id'])) ? $_POST['id'] : '687d7dd88776a';
$name = (isset($_POST['name'])) ? $_POST['name'] : '';
$client = (isset($_POST['client'])) ? $_POST['client'] : '';


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
      $sub_array['balance'] = number_format($row['balencereceipt'],2);
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
      $dato['concept'] = strtoupper('cobro Mes de '.$row['conceptreceipt']);
      $dato['balance'] = number_format($row['balencereceipt'],2);
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;







  case 'get_data_relationship_suplier':
    $dato = array();
    $data = $clientes->getRelationshipClientSuplierDB($id);
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['suplier'] = $row['suplier'];
      $sub_array['client'] = $row['nameClient'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'delete_supplier':
    $valided = $supliers->validedRelationClientSuplierDB($id);
    if ($valided > 0) {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "No Puede Eliminiar Este Proveedor, Ya que Tiene Relacion Con Un Cliente, Por Favor Intente Con Un Cliente Diferente \n";
      echo json_encode($dato, JSON_UNESCAPED_UNICODE);
      return;
    }
    $data = $supliers->deleteDataSuplierDB($id);
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
  case 'new_link':
    $data = $supliers->createRelationClientSuplierDB($id, $client);
    if ($data) {
      $dato['status'] = true;
      $dato['error'] = '200';
      $dato['message'] = "La Relacion Fue Creado Satisfactoriamente \n";
    } else {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "Error Al Crear La Relacion, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'delete_link':
    $data = $supliers->deleteRelationClientSuplierDB($id);
    if ($data) {
      $dato['status'] = true;
      $dato['error'] = '200';
      $dato['message'] = "La Relacion Fue Creado Satisfactoriamente \n";
    } else {
      $dato['status'] = false;
      $dato['error'] = '500';
      $dato['message'] = "Error Al Crear La Relacion, Por Favor Intente Nuevamente \n";
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  default:
    header("Location:" . URL_APP);
    break;
}
