<?php
require_once("../../config/conexion.php");

class Exchange extends Conectar
{
   public function getExchangeRateTypesDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM exchange_rate_types_data_table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function createNewRateExchangeDB($id, $date, $rate, $type)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO exch_rate_data_table(id, dateRate, exchRate, typeRate) VALUES ('','2025-12-2', '12', '1')");
    //$stmt->execute([$id, $date, $rate, $type]);
    return $stmt;
  }
  public function updateDataClientDB($id, $name, $dni, $phone, $phonealt, $email)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE client_data_table SET nameClient=:name, dniClient=:dni, emailClient=:email, phoneClient=:phone, phoneClientAlt=:phonealt WHERE id = :id");
    $stmt->execute(['name' => $name, 'dni' => $dni, 'email' => $email, 'phone' => $phone, 'phonealt' => $phonealt, 'id' => $id]);
    return $stmt->rowCount();
  }
  public function getListExchangeRatesDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM exch_rate_data_table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function getDataClientDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM client_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function deleteClientDB($id)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE client_data_table SET statusClient = :status WHERE id = :id");
    $stmt->execute(['status' => 0, 'id' => $id]);
    return $stmt->rowCount();
  }








  public function getNameUserTypes()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM user_types_data_table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function loginUserExistsDB($login)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT loginuser FROM user_data_table WHERE loginuser = :login");
    $stmt->execute(['login' => $login]);
    return $stmt->fetchColumn();
  }

  

  public function getPasswordUserDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT passworduser FROM user_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchColumn();
  }

  public function updateUserDataDBPasswordOff($id, $name, $email, $login, $type)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE user_data_table SET nameuser=:nameuser,emailuser=:emailuser,loginuser=:loginuser,leveluser=:leveluser WHERE id = :id");
    $stmt->execute(['nameuser' => $name, 'emailuser' => $email, 'loginuser' => $login, 'leveluser' => $type, 'id' => $id]);
    return $stmt->rowCount();
  }
  

  

  
  

   public function getDataUserLogin($login)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM user_data_table WHERE loginuser = :login");
    $stmt->execute(['login' => $login]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
}
