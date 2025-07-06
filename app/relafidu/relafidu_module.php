<?php
require_once("../../config/conexion.php");

class FiduciaryRelationship extends Conectar
{
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA CREAR UNAS RELACIONES FIDUCIARIAS EN LA BASE DE DATOS */
  public function createNewFiduciaryRelationshipDB($client, $unit)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO unit_client_data_table (client, unit) VALUES (:client, :unit)");
    $stmt->execute(['client' => $client, 'unit' => $unit]);
    return $stmt->rowCount();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER EL ID DE LA UNIDAD DE UNA RELACION FIDUCIARIA EN LA BASE DE DATOS*/
  public function getFiduciaryRelationshipDB($unit)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT unit FROM unit_client_data_table WHERE unit = :unit");
    $stmt->execute(['unit' => $unit]);
    return $stmt->fetchColumn();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA ELIMINAR UNA RELACION FIDUCIARIA EN LA BASE DE DATOS */
  public function deleteFiduciaryRelationshipDB($unit)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("DELETE FROM unit_client_data_table WHERE unit = :unit");
    $stmt->execute(['unit' => $unit]);
    return $stmt->rowCount();
  }

  public function getListFiduciaryRelationshipDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, B.id AS iunit, C.id AS iclient, B.unit, D.level, C.nameClient FROM unit_client_data_table AS A 
                                  INNER JOIN unit_data_table AS B ON A.unit=B.id
                                  INNER JOIN unit_level_data_table AS D ON B.level=D.id
                                  INNER JOIN client_data_table AS C ON A.client=C.id");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function validedFiduciaryRelationshipDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM unit_client_data_table WHERE client = :client");
    $stmt->execute(['client' => $id]);
    return $stmt->rowCount();
  }

  public function getDataRelationshipClientUnitDB($serch)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, B.id AS iunit, C.id AS iclient, B.unit, D.level, C.nameClient FROM unit_client_data_table AS A 
                                  INNER JOIN unit_data_table AS B ON A.unit=B.id
                                  INNER JOIN unit_level_data_table AS D ON B.level=D.id
                                  INNER JOIN client_data_table AS C ON A.client=C.id 
                                WHERE C.nameClient LIKE '%$serch%' OR B.unit LIKE '%$serch%'");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }


}
