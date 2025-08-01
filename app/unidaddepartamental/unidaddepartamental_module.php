<?php
require_once("../../config/conexion.php");

class Unitdepartmental extends Conectar
{
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DE LOS NIVELES DE UNIDADES DEPARTAMENTALES EXISTENTES EN LA BASE DE DATOS*/
  public function getUnitLevelsBD()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM unit_level_data_table");
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

  public function getDataUnitByNameDB($search)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, B.id AS uid, B.unit, D.level, E.aliquot, A.id AS cid, C.nameClient, C.emailClient,
    (SELECT F.id FROM receipts_data_table AS F WHERE F.daterec < NOW() AND F.balencereceipt > 0 AND F.uid=B.id AND F.typerec='cobro' LIMIT 1) AS receipt,
    (SELECT E.amount FROM income_penalty_data_table AS E WHERE E.unit=B.id AND E.namepenalty='mora' LIMIT 1) AS mora,
    (SELECT E.amount FROM income_penalty_data_table AS E WHERE E.unit=B.id AND E.namepenalty LIKE '%gastos ad%' LIMIT 1) AS gastos,
    (SELECT F.balencereceipt FROM receipts_data_table AS F WHERE F.daterec < NOW() AND F.balencereceipt > 0 AND F.uid=B.id AND F.typerec='cobro' LIMIT 1) AS balance
                                    FROM unit_client_data_table AS A 
                                  INNER JOIN unit_data_table AS B ON A.unit=B.id
                                  INNER JOIN unit_level_data_table AS D ON B.level=D.id
                                  INNER JOIN unit_aliquot_data_table AS E ON B.aliquot=E.id
                                  INNER JOIN client_data_table AS C ON A.client=C.id
                                WHERE B.unit = :search");
    $stmt->execute(['search' => $search ]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

   public function getDataAllUnitClientDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, A.id AS cid, B.id AS uid, C.nameClient, 
                                    (SELECT CONCAT(
                                      CASE MONTH(NOW())
                                          WHEN 1 THEN 'ENERO'
                                          WHEN 2 THEN 'FEBRERO'
                                          WHEN 3 THEN 'MARZO'
                                          WHEN 4 THEN 'ABRIL'
                                          WHEN 5 THEN 'MAYO'
                                          WHEN 6 THEN 'JUNIO'
                                          WHEN 7 THEN 'JULIO'
                                          WHEN 8 THEN 'AGOSTO'
                                          WHEN 9 THEN 'SEPTIEMBRE'
                                          WHEN 10 THEN 'OCTUBRE'
                                          WHEN 11 THEN 'NOVIEMBRE'
                                          WHEN 12 THEN 'DICIEMBRE'
                                      END, ' DE ', YEAR(NOW()))) AS concepto, 
                                    (SELECT DATE_ADD(NOW(), INTERVAL 15 DAY)) AS vence,
                                    D.level, B.unit, E.aliquot, C.emailClient 
                                    FROM unit_client_data_table AS A 
                                  INNER JOIN unit_data_table AS B ON A.unit=B.id
                                  INNER JOIN unit_level_data_table AS D ON B.level=D.id
                                  INNER JOIN unit_aliquot_data_table AS E ON B.aliquot=E.id
                                  INNER JOIN client_data_table AS C ON A.client=C.id");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

}
