<?php
require_once("../../config/conexion.php");

class Exchange extends Conectar
{
   public function getExchangeRateTypesDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM rate_types_data_table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function getListExchangeRatesDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, dateRate, exchRate, acronym FROM rate_data_table AS A 
                                  INNER JOIN rate_types_data_table AS B ON A.typeRate=B.id");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function getExchangeRateDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM rate_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function updateRateDataDB($id, $date, $rate, $type)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE rate_data_table SET dateRate=:date, exchRate=:rate, typeRate=:type WHERE id = :id");
    $stmt->execute(['date' => $date, 'rate' => $rate, 'type' => $type, 'id' => $id]);
    return $stmt->rowCount();
  }

  public function createDataRateDB($date, $rate, $type)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("INSERT INTO rate_data_table (dateRate, exchRate, typeRate) VALUES (:date, :rate, :type)");
    $stmt->execute(['date' => $date, 'rate' => $rate, 'type' => $type]);
    return $stmt->rowCount();
  }

  public function validateDateRateDB($date)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM rate_data_table WHERE dateRate = :date");
    $stmt->execute(['date' => $date]);
    return $stmt->rowCount();
  }

  public function getDataRateByDateDB($date)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT exchRate FROM rate_data_table WHERE dateRate = :date");
    $stmt->execute(['date' => $date]);
    return $stmt->fetchColumn();
  }
}
