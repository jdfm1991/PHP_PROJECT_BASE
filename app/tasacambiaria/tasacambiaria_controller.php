<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("tasacambiaria_module.php");

$exchange = new Exchange();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$date = (isset($_POST['date'])) ? $_POST['date'] : '';
$rate = (isset($_POST['rate'])) ? $_POST['rate'] : '';
$type = (isset($_POST['type'])) ? $_POST['type'] : '';

switch ($_GET["op"]) {
  case 'get_exchange_rate_types':
    $dato = array();
    $data = $exchange->getExchangeRateTypesDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['type'] = $row['exchangeratetypes'];
      $sub_array['acr'] = $row['acronym'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_rate':
    $dato = array();
    if (empty($id)) {
      $data = $exchange->createNewRateExchangeDB($id, $date, $rate, $type);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "La Tasa Cambiaria del Dia " . $date . " Fue Creada Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Registrar La Tasa Cambiaria del Dia " . $date . ", Por Favor Intente Nuevamente \n";
      }
    } else {
      $data = $cliente->updateDataClientDB($id, $name, $dni, $phone, $phonealt, $email);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "El Usuario " . $name . " Fue Actiualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Actualizar El Usuario" . $name . ", Por Favor Intente Nuevamente \n";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_list_rates':
    $dato = array();
    $data = $exchange->getListExchangeRatesDB();
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['date'] = $row['dateRate'];
      $sub_array['exchange'] = $row['exchRate'];
      $sub_array['type'] = $row['typeRate'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_client':
    $dato = array();
    $data = $cliente->getDataClientDB($id);
    foreach ($data as $row) {
      $sub_array['id'] = $row['id'];
      $sub_array['name'] = $row['nameClient'];
      $sub_array['dni'] = $row['dniClient'];
      $sub_array['email'] = $row['emailClient'];
      $sub_array['phone'] = $row['phoneClient'];
      $sub_array['phonealt'] = $row['phoneClientAlt'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'delete_client':
    $data = $cliente->deleteClientDB($id);
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
