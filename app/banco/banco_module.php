<?php
require_once("../../config/conexion.php");

class BankingMovements extends Conectar
{
  public function createNewBankingMovementsDB($id, $date, $refenc, $descri, $amount, $motion)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO bank_movements_data_table(id, datemov, referencemov, descriptionmov, amountmov, typemov, balencemov) VALUES (:id, :datem, :refe, :descrip, :mont, :typem, :balance)");
    $stmt->execute(['id' => $id, 'datem' => $date, 'refe' => $refenc, 'descrip' => $descri, 'mont' => $amount, 'typem' => $motion, 'balance' => $amount]);
    return $stmt->rowCount();
  }

  public function verifyReferenceMovementDB($refenc, $motion)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM bank_movements_data_table WHERE referencemov = :refenc AND descriptionmov = :descrip");
    $stmt->execute(['refenc' => $refenc, 'descrip' => $motion]);
    return $stmt->rowCount();
  }

  public function getDataBankMovementsPaymentExpensesDB($refer)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, A.referencemov, A.balencemov, A.datemov, B.exchRate, (A.balencemov/B.exchRate) AS dollar 
                                FROM bank_movements_data_table AS A
                                INNER JOIN rate_data_table AS B ON A.datemov=B.dateRate
                                WHERE referencemov LIKE '%$refer%' AND balencemov > 0 AND typemov = 'ND' AND A.id NOT IN (SELECT id FROM bank_movements_data_table WHERE (descriptionmov LIKE '%com.%' OR descriptionmov LIKE '%itf%'))");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

   public function getDataBankMovementsPaymentIncomesDB($refer)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, A.referencemov, A.balencemov, A.datemov, B.exchRate, (A.balencemov/B.exchRate) AS dollar 
                                FROM bank_movements_data_table AS A
                                INNER JOIN rate_data_table AS B ON A.datemov=B.dateRate
                                WHERE referencemov LIKE '%$refer%' AND balencemov > 0 AND typemov = 'NC' AND A.id NOT IN (SELECT id FROM bank_movements_data_table WHERE (descriptionmov LIKE '%com.%' OR descriptionmov LIKE '%itf%'))");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getDataBankingMovementsDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM bank_movements_data_table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function updateBankingMovementDB($idrefer, $balance)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE bank_movements_data_table SET balencemov = (IFNULL(balencemov, amountmov) - :balence) WHERE id = :id");
    $stmt->execute(['balence' => $balance, 'id' => $idrefer]);
    return $stmt->rowCount();
  }

  public function getSumMovementByMovementDB($descrip)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT SUM(amountmov/exchRate) AS total FROM bank_movements_data_table AS A 
                                  INNER JOIN rate_data_table AS B ON A.datemov=B.dateRate
                                  WHERE descriptionmov LIKE '%$descrip%'");
    $stmt->execute();
    return $stmt->fetchColumn();
  }
}
