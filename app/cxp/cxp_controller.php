<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once(PATH_APP . "/registrogasto/registrogasto_module.php");
require_once("cxp_module.php");

$payable = new AccountsPayable();
$expenses = new Expenses();

$id = (isset($_POST['id'])) ? $_POST['id'] : '6873ad6c02425';
$name = (isset($_POST['name'])) ? $_POST['name'] : '';
$client = (isset($_POST['client'])) ? $_POST['client'] : '';


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
      $sub_array['balance'] = $row['balanceExpense'];
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
      $dato['balance'] = $data['balanceExpense'];
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
