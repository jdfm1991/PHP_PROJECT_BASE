<?php
require_once("../../config/conexion.php");

class AccountsPayable extends Conectar
{
  public function getListSupliersDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, dateExpense, B.nameSuplier, expenseName, balanceExpense 
                                    FROM expense_data_table AS A 
                                  INNER JOIN suplier_data_table AS B ON A.idSuplier=B.id
                                WHERE statusExpense=1 AND balanceExpense > 0");
    $stmt->execute();
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
