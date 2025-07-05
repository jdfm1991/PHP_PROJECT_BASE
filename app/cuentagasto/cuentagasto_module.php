<?php
require_once("../../config/conexion.php");

class Expenses extends Conectar
{
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DE LOS TIPO DE GASTOS EXISTENTES EN LA BASE DE DATOS*/
  public function getTypeExpensesBD()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM expense_type_data_table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }







  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DE LOS TIPOS DE ALIQUOTAS EXISTENTES EN LA 
  BASE DE DATOS */
  public function getUnitAliquotsBD()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM unit_aliquot_data_table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DE LOS NOMBRES DE UNIDADES DEPARTAMENTALES QUE SE DESEAN CREAR EN LA BASE DE DATOS */
  public function getNewUnitnameByLevelDB($id, $level)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT CONCAT('$level-A', LPAD(COUNT(*) + 1, 2, '0')) AS newunitname
            FROM unit_data_table
            WHERE level = :level");
    $stmt->execute(['level' => $id]);
    return $stmt->fetchColumn();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA CREAR UNIDADES DEPARTAMENTALES EN LA BASE DE DATOS */
  public function createNewUnitDB($id, $unit, $level, $aliquot)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO unit_data_table (id, unit, level, aliquot) VALUES (:id, :unit, :level, :aliquot)");
    $stmt->execute(['id' => $id, 'unit' => $unit, 'level' => $level, 'aliquot' => $aliquot]);
    return $stmt->rowCount();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DE LAS UNIDADES DEPARTAMENTALES EXISTENTES EN LA BASE DE DATOS */
  public function getListUnitsDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, unit, B.level, C.aliquot, enable FROM unit_data_table AS A 
                                  INNER JOIN unit_level_data_table AS B ON A.level=B.id
                                  INNER JOIN unit_aliquot_data_table AS C ON A.aliquot=C.id
                                WHERE available=1");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DEL ESTADO DE UNIDADES DEPARTAMENTALES EXISTENTES EN LA BASE DE DATOS */
  public function getEnableUnitDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT enable FROM unit_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchColumn();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA CAMBIAR EL ESTADO DE UNIDADES DEPARTAMENTALES EN LA BASE DE DATOS */
  public function changeEnableUnitDB($id, $enable)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE unit_data_table SET enable = :enable WHERE id = :id");
    $stmt->execute(['enable' => $enable, 'id' => $id]);
    return $stmt->rowCount();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION UNA UNIDAD DEPARTAMENTAL EXISTENTE EN LA BASE DE DATOS */
  public function getDataUnitDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM unit_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function updateUnitDataDB($id, $unit, $aliquot)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE unit_data_table SET unit=:unit, aliquot=:aliquot WHERE id = :id");
    $stmt->execute(['unit' => $unit, 'aliquot' => $aliquot, 'id' => $id]);
    return $stmt->rowCount();
  }

}
