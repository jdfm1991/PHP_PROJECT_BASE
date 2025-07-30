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

  public function createDataReceiptsDB($id, $cid, $uid, $nreceipt, $inquilino, $concepto, $vence, $nivel, $aliquot, $email, $monto_gf, $monto_gv, $monto_p, $monto_i, $monto_tg, $typerec, $depart)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO receipts_data_table (id, cid, uid, daterec, numrec, nametenant, conceptreceipt, levelrec, aliquotrec, emailrec, aumontgf, aumontgv, aumontp, aumonti, aumont, expirationdate, balencereceipt, typerec, unitdep) VALUES (:id, :cid, :uid, :date, :number, :tenant, :concept, :level, :aliquot, :email, :aumontgf, :aumontgv, :aumontp, :aumonti, :aumont, :expiration, :balence, :typerec, :depart)");
    $stmt->execute(['id' => $id, 'cid' => $cid, 'uid' => $uid, 'date' => date('Y-m-d'), 'number' => $nreceipt, 'tenant' => $inquilino, 'concept' => $concepto, 'level' => $nivel, 'aliquot' => $aliquot, 'email' => $email, 'aumontgf' => $monto_gf, 'aumontgv' => $monto_gv, 'aumontp' => $monto_p, 'aumonti' => $monto_i, 'aumont' => $monto_tg, 'expiration' => $vence, 'balence' => $monto_tg, 'typerec' => $typerec, 'depart' => $depart]);
    return $stmt->rowCount();
  }

  public function createDataReceiptItemsDB($id, $type, $code, $expense, $amount, $aliquot)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO receipts_items_data_table(idreceipt, typeexpense, idexpense, detailexpense, amountexpense, aumontaliquot) VALUES (:idr, :type, :code, :expense, :amount, :aliquot)");
    $stmt->execute(['idr' => $id, 'type' => $type, 'code' => $code, 'expense' => $expense, 'amount' => $amount, 'aliquot' => $aliquot]);
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
    $stmt = $conectar->prepare("SELECT * FROM receipts_data_table WHERE MONTH(daterec)=MONTH(NOW()) AND statusrec = 1 AND cid = :cid AND uid = :uid AND typerec = 'COBRO'");
    $stmt->execute(['cid' => $cid, 'uid' => $uid]);
    return $stmt->rowCount();
  }

  public function checkPenaliesReceiptDB($cid, $uid, $concepto)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM receipts_data_table WHERE MONTH(daterec)=MONTH(NOW()) AND statusrec = 1 AND cid = :cid AND uid = :uid AND conceptreceipt = :concept AND typerec = 'PENAL'");
    $stmt->execute(['cid' => $cid, 'uid' => $uid, 'concept' => $concepto]);
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

  public function updateReceiptBalancestDB($id, $monto_gf, $monto_gv, $monto_i, $monto_tg)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE receipts_data_table SET aumontgf	= :aumontgf, aumontgv = :aumontgv, aumonti = :aumonti, aumont = :aumont, balencereceipt = :balence WHERE id = :id");
    $stmt->execute(['aumontgf' => $monto_gf, 'aumontgv' => $monto_gv, 'aumonti' => $monto_i, 'aumont' => $monto_tg, 'balence' => $monto_tg, 'id' => $id]);
    return $stmt->rowCount();
  }

  public function getDataHeaderReceiptDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id, daterec, numrec, nametenant, unitdep, conceptreceipt, levelrec, aliquotrec, aumontgf, aumontgv, aumontp, aumonti, aumont, expirationdate, typerec FROM receipts_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getDataItemsByReceiptDB($receipt, $expense)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM receipts_items_data_table WHERE idreceipt = :receipt AND typeexpense = :expense");
    $stmt->execute(['receipt' => $receipt, 'expense' => $expense]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getDataReceiptsExpiredDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM receipts_data_table WHERE MONTH(daterec)=MONTH(NOW()) AND statusrec = 1 AND expirationdate < NOW() AND typerec = 'COBRO' ORDER BY daterec DESC");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function createDataPenaltyReceiptsDB($receipt, $account, $income, $penalty, $amount)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO income_penalty_data_table(datep, receipt, account, income, namepenalty, amount) VALUES (:datep, :receipt, :account, :income, :penalty, :amount)");
    $stmt->execute(['datep' => date('Y-m-d'), 'receipt' => $receipt, 'account' => $account, 'income' => $income, 'penalty' => $penalty, 'amount' => $amount]);
    return $stmt->rowCount();
  }

  public function validatePenaltyReceiptDB($receipt, $account, $income)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM income_penalty_data_table WHERE receipt = :receipt and account = :account AND income = :income AND status = 1 AND MONTH(datep)=MONTH(NOW()) AND YEAR(datep)=YEAR(NOW())");
    $stmt->execute(['receipt' => $receipt, 'account' => $account, 'income' => $income]);
    return $stmt->rowCount();
  }

  public function updateDataPenaltyReceiptsDB($receipt, $account, $income, $amount)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("UPDATE income_penalty_data_table SET amount = :amount, dateupt = NOW() WHERE receipt = :receipt AND account = :account AND income = :income");
    $stmt->execute(['amount' => $amount, 'receipt' => $receipt, 'account' => $account, 'income' => $income]);
    return $stmt->rowCount();
  }

}
