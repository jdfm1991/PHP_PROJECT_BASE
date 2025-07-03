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
}
