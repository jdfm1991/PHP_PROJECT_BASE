<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once(PATH_VENDOR . "/autoload.php");
require_once(PATH_APP . "/tasacambiaria/tasacambiaria_module.php");

require_once("banco_module.php");

$bankmov = new BankingMovements();
$exchange = new Exchange();

$path = PATH_ASSETS . "/uploads";
$refer = (isset($_POST['refer'])) ? $_POST['refer'] : '';
$monthNames = [
  "enero" => 1,
  "febrero" => 2,
  "marzo" => 3,
  "abril" => 4,
  "mayo" => 5,
  "junio" => 6,
  "julio" => 7,
  "agosto" => 8,
  "septiembre" => 9,
  "octubre" => 10,
  "noviembre" => 11,
  "diciembre" => 12,
];

switch ($_GET['op']) {
  case 'load_bank_statement_by_excel':
    $data = array();
    if (!is_dir($path)) {
      $sub_array = array();
      mkdir($path, 0777, true);
    }
    $extension = strtolower(pathinfo($_FILES['sheetexcel']['name'], PATHINFO_EXTENSION));
    if ($extension != "xlsx") {
      $data['status'] = false;
      $data['error'] = '500';
      $data['message'] = "Error Al Cargar El Archivo de Excel,<br> Por Favor Verifique el Formato y Intente Nuevamente";
      echo json_encode($data, JSON_UNESCAPED_UNICODE);
      return;
    }
    $targetpath = $path . '/' . $_FILES['sheetexcel']['name'];
    move_uploaded_file($_FILES['sheetexcel']['tmp_name'], $targetpath);
    $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader('Xlsx');
    $spreadsheet = $reader->load($targetpath);
    $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
    if (empty($sheetData)) {
      $data['status'] = false;
      $data['error'] = '500';
      $data['message'] = "Por Favor Debe Cargar un Archivo de Excel";
      echo json_encode($data, JSON_UNESCAPED_UNICODE);
      return;
    } else {
      $data['status'] = true;
      $data['error'] = '200';
      $data['message'] = "El Archivo Fue Cargado Satisfactoriamente";
    }
    unset($sheetData[1]);
    $i = 1;
    foreach ($sheetData as $row) {
      $sub_array = array();
      $sub_array['line'] = $i;
      $datef = explode(" ", str_replace("de ", "", $row['A']));
      if (isset($monthNames[strtolower(trim($datef[1]))])) {
        $mes = $monthNames[strtolower(trim($datef[1]))];
        $sub_array['date'] = $datef[2] . '-' . str_pad($mes, 2, "0", STR_PAD_LEFT) . '-' . $datef[0];
      } else {
        $data['status'] = false;
        $data['error'] = '500';
        $data['message'] = "Error Al Cargar El Archivo, Por Favor Verifique el Formato y Intente Nuevamente \n";
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        return;
      }
      $sub_array['refenc'] = $row['B'];
      $sub_array['descri'] = $row['C'];
      $sub_array['amount'] = str_replace(",", ".", str_replace(".", "", $row['D']));
      $sub_array['motion']  = $row['F'];
      $i++;
      $data[] = $sub_array;
    }
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    break;
  case 'new_banking_movements':
    $dato = array();
    $targetpath = $path . '/' . $_FILES['sheetexcel']['name'];
    $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader('Xlsx');
    $spreadsheet = $reader->load($targetpath);
    $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
    unset($sheetData[1]);
    $i = 0;
    $j = 0;
    $k = 0;
    $l = 0;
    foreach ($sheetData as $row) {
      $datef = explode(" ", str_replace("de ", "", $row['A']));
      $mes = $monthNames[strtolower(trim($datef[1]))];
      $id = uniqid();
      $date = $datef[2] . '-' . str_pad($mes, 2, "0", STR_PAD_LEFT) . '-' . $datef[0];
      $refenc = $row['B'];
      $descri = $row['C'];
      $amount = str_replace(",", ".", str_replace(".", "", $row['D']));
      $motion  = $row['F'];
      $i++;
      $verify = $bankmov->verifyReferenceMovementDB($refenc);
      if ($verify == 0) {
        $data = $bankmov->createNewBankingMovementsDB($id, $date, $refenc, $descri, $amount, $motion);
        if ($data) {
          $j++;
        } else {
          $k++;
        }
      } else {
        $l++;
      }
      if ($j == $i) {
        $dato['status'] = true;
        $dato['code'] = '201';
        $dato['message'] = "Se Registraron de Manera Exitosa Los Movimientos Cargados";
      } else if ($l == $i) {
        $dato['status'] = true;
        $dato['code'] = '201';
        $dato['message'] = "Los Movimientos Cargados, No se Registraron, Bebido a Que Ya Se Registraron Anteriormente";
      }
      if ($k == $i) {
        $dato['status'] = false;
        $dato['code'] = '500';
        $dato['message'] = "Error Al Guardos los Movimientos en la Base de Datos";
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'get_banking_movement':
    $dato = array();
    $data = $bankmov->getDataBankingMovementDB($refer);
    foreach ($data as $row) {
      $sub_array = array();
      $sub_array['id'] = $row['id'];
      $sub_array['refer'] = $row['referencemov'];
      $sub_array['amount'] = number_format($row['amountmov'],2, '.','');
      $sub_array['date'] = $row['datemov'];
      $rate = $exchange->getDataRateByDateDB($row['datemov']);
      $sub_array['rate'] = $rate;
      $sub_array['amountd'] = number_format(($row['balencemov']/$rate),2, '.','');
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  default:

    break;
}
