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

    public function verifyReferenceMovementDB($refenc)
  {
     $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM bank_movements_data_table WHERE referencemov = :refenc");
    $stmt->execute(['refenc' => $refenc]);
    return $stmt->rowCount();
  }

  public function getDataBankingMovementDB($refer)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM bank_movements_data_table WHERE referencemov LIKE '%$refer%' AND balencemov > 0");
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

  public function updateBankingMovementDB($refer, $balance)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE bank_movements_data_table SET balencemov = (IFNULL(balencemov, amountmov) - :balence) WHERE referencemov = :refer");
    $stmt->execute(['balence' => $balance, 'refer' => $refer]);
    return $stmt->rowCount();
  }
}
