<?php
require_once("../../config/conexion.php");

class BankingMovements extends Conectar
{
    public function createNewBankingMovementsDB($id, $date, $refenc, $descri, $amount, $motion)
    {
        $conectar = parent::conexion();
        parent::set_names();
        $stmt = $conectar->prepare("INSERT INTO bank_movements_data_table(id, datemov, referencemov, descriptionmov, amountmov, typemov) VALUES (:id, :datem, :refe, :descrip, :mont, :typem)");
        $stmt->execute(['id' => $id, 'datem' => $date, 'refe' => $refenc, 'descrip' => $descri, 'mont' => $amount, 'typem' => $motion]);
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
}
