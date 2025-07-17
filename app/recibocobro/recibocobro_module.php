<?php
require_once("../../config/conexion.php");

class CollectionReceipts extends Conectar
{
  public function getNewNumberReceiptCollectionDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT CONCAT('REC-',LPAD(COUNT(*) + 1, 3, '0'), '-', YEAR(NOW())) AS receipt
                                  FROM collection_receipts_data_table
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

  public function getDataCollectionReceiptsDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id, expenseName, IFNULL(quotasExpense, montExpense) AS aumont 
                                  FROM expense_data_table 
                                  WHERE idExpenseAccount=:id AND statusExpense=1");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
}
