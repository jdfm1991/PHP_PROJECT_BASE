<?php
require_once("../../config/conexion.php");

class AccountsReceivable extends Conectar
{
  public function getListAccountsReceivableDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM receipts_data_table WHERE statusrec = 1 AND balencereceipt > 0");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getAccountReceivableDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM receipts_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function createPayAccountsReceivableDB($account, $date, $refer, $rate, $payd, $balance, $remaining)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO receipt_pay_data_table(idrec, datereg, ratepay, referpay, pay, balance, remaining) VALUES (:rec, :date, :rate, :refer, :pay, :balance, :remaining)");
    $stmt->execute(['rec' => $account, 'date' => $date, 'rate' => $rate, 'refer' => $refer, 'pay' => $payd, 'balance' => $balance, 'remaining' => $remaining]);
    return $stmt->rowCount();
  }














  public function deleteDataSuplierDB($id)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE suplier_data_table SET statusSuplier = :status WHERE id = :id");
    $stmt->execute(['status' => 0, 'id' => $id]);
    return $stmt->rowCount();
  }

  

  public function deleteRelationClientSuplierDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("DELETE FROM client_suplier_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->rowCount();
  }

   public function validedRelationClientSuplierDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM client_suplier_data_table WHERE suplier = :suplier");
    $stmt->execute(['suplier' => $id]);
    return $stmt->rowCount();
  }
}
