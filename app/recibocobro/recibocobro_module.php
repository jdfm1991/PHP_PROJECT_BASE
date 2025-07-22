<?php
require_once("../../config/conexion.php");

class Receipts extends Conectar
{
  public function getNewNumberReceiptDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT CONCAT('REC-',LPAD(COUNT(*) + 1, 3, '0'), '-', YEAR(NOW())) AS receipt
                                  FROM receipts_data_table
                                WHERE YEAR(daterec) = YEAR(NOW())");
    $stmt->execute();
    return $stmt->fetchColumn();
  }

  public function getDataExpenseAcountFixedDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id, codeaccount, expenseaccount FROM expense_accounts_data_table WHERE fixedaccount = 1");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getDataExpenseAcountNonFixedDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id, codeaccount, expenseaccount FROM expense_accounts_data_table WHERE fixedaccount = 0");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getDataDetailsExpenseDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id, expenseName, LL(quotasExpense, montExpense) AS aumont 
                                  FROM expense_data_table 
                                  WHERE idExpenseAccount=:id AND statusExpense=1");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function createDataReceiptsDB($id, $cid, $uid, $nreceipt, $inquilino, $concepto, $vence, $nivel, $aliquot, $email, $monto_gf, $monto_gv, $monto_p, $monto_i, $monto_tg)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO receipts_data_table (id, cid, uid, daterec, numrec, nametenant, conceptreceipt, levelrec, aliquotrec, emailrec, aumontgf, aumontgv, aumontp, aumonti, aumont, expirationdate, balencereceipt) VALUES (:id, :cid, :uid, :date, :number, :tenant, :concept, :level, :aliquot, :email, :aumontgf, :aumontgv, :aumontp, :aumonti, :aumont, :expiration, :balence)");
    $stmt->execute(['id' => $id, 'cid' => $cid, 'uid' => $uid, 'date' => date('Y-m-d'), 'number' => $nreceipt, 'tenant' => $inquilino, 'concept' => $concepto, 'level' => $nivel, 'aliquot' => $aliquot, 'email' => $email, 'aumontgf' => $monto_gf, 'aumontgv' => $monto_gv, 'aumontp' => $monto_p, 'aumonti' => $monto_i, 'aumont' => $monto_tg, 'expiration' => $vence, 'balence' => $monto_tg]);
    return $stmt->rowCount();
  }

  public function createDataReceiptItemsDB($id, $type, $code, $expense, $amount)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO receipts_items_data_table(idreceipt, typeexpense, idexpense, detailexpense, amountexpense) VALUES (:idr, :type, :code, :expense, :amount)");
    $stmt->execute(['idr' => $id, 'type' => $type, 'code' => $code, 'expense' => $expense, 'amount' => $amount]);
    return $stmt->rowCount();
  }

  public function getDataReceiptsDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM receipts_data_table WHERE statusrec = 1 ORDER BY daterec DESC");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function checkPeriodReceiptDB($cid, $uid)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM receipts_data_table WHERE MONTH(daterec)=MONTH(NOW()) AND statusrec = 1 AND cid = :cid AND uid = :uid");
    $stmt->execute(['cid' => $cid, 'uid' => $uid]);
    return $stmt->rowCount();
  }

  public function deleteDataReceiptDB($id)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE receipts_data_table SET statusrec = :status WHERE id = :id");
    $stmt->execute(['status' => 0, 'id' => $id]);
    return $stmt->rowCount();
  }

  public function updateBalanceReceiptDB($account, $payd)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE receipts_data_table SET balencereceipt = (balencereceipt - :balence) WHERE id = :id");
    $stmt->execute(['balence' => $payd, 'id' => $account]);
    return $stmt->rowCount();
  }
}
