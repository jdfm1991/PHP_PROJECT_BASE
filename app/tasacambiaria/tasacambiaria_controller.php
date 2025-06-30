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
      $datevalidate = $exchange->validateDateRateDB($date); //Validar Fecha de Exchange
      if ($datevalidate > 0) {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "La Tasa Cambiaria del Dia " . $date . " Ya Existe, Por Favor Intente Con Una Fecha Diferente \n";
        echo json_encode($dato, JSON_UNESCAPED_UNICODE);
        return;
      }
      $data = $exchange->createDataRateDB($date, $rate, $type);
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
      $data = $exchange->updateRateDataDB($id, $date, $rate, $type);
      if ($data) {
        $dato['status'] = true;
        $dato['error'] = '200';
        $dato['message'] = "La Tasa Cambiaria del Dia  " . $date . " Fue Actiualizado Satisfactoriamente \n";
      } else {
        $dato['status'] = false;
        $dato['error'] = '500';
        $dato['message'] = "Error Al Actualizar Tasa Cambiaria del Dia " . $date . ", Por Favor Intente Nuevamente \n";
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
      $sub_array['type'] = $row['acronym'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_data_rate':
    $dato = array();
    $data = $exchange->getExchangeRateDB($id);
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
  default:
    header("Location:" . URL_APP);
    break;
}
