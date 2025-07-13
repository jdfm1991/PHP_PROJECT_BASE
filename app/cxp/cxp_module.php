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






  public function getDataSuplierDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM suplier_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function deleteDataSuplierDB($id)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE suplier_data_table SET statusSuplier = :status WHERE id = :id");
    $stmt->execute(['status' => 0, 'id' => $id]);
    return $stmt->rowCount();
  }

  public function createRelationClientSuplierDB($suplier, $client)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO client_suplier_data_table(client, suplier) VALUES (:client, :suplier)");
    $stmt->execute(['client' => $client, 'suplier' => $suplier]);
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
