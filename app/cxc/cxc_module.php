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

  public function createPayAccountsReceivableDB($account, $date, $refer, $rate, $payd, $balance, $remaining, $check)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO receipt_pay_data_table(idrec, datereg, ratepay, referpay, pay, balance, remaining, dollarpay) VALUES (:rec, :date, :rate, :refer, :pay, :balance, :remaining, :check)");
    $stmt->execute(['rec' => $account, 'date' => $date, 'rate' => $rate, 'refer' => $refer, 'pay' => $payd, 'balance' => $balance, 'remaining' => $remaining, 'check' => $check]);
    return $stmt->rowCount();
  }
}
