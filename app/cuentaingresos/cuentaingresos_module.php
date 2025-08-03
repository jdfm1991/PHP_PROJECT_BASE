<?php
require_once("../../config/conexion.php");

class IncomeAccounts extends Conectar
{
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DE LOS TIPO DE GASTOS EXISTENTES EN LA BASE DE DATOS*/
  public function getDataIncomeTypeBD()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM income_type_data_table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DEL NUEVO CODIGO DE GASTO QUE SE DESEAN CREAR EN LA BASE DE DATOS */
  public function getNewCodeIncomeByTypeDB($id, $prefix)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT CONCAT('$prefix-', LPAD(COUNT(*) + 1, 2, '0')) AS newcode
            FROM income_accounts_data_table
            WHERE typeaccount = :type");
    $stmt->execute(['type' => $id]);
    return $stmt->fetchColumn();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA CREAR EL NUEVO GASTO EN LA BASE DE DATOS */
  public function createIncomeAccountDB($id, $type, $code, $income)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO income_accounts_data_table (id, typeaccount, codeaccount, incomeaccount) VALUES (:id, :type, :code, :income)");
    $stmt->execute(['id' => $id, 'type' => $type, 'code' => $code, 'income' => $income]);
    return $stmt->rowCount();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DE LAS CUENTAS DE GASTOS EXISTENTES EN LA BASE DE DATOS */
  public function getListIncomeAccountsDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, B.incometypename AS type, codeaccount AS code, incomeaccount AS income
                                  FROM income_accounts_data_table AS A
                                  INNER JOIN income_type_data_table AS B ON A.typeaccount=B.id
                                WHERE statusaccount=1");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION UNA UNIDAD DEPARTAMENTAL EXISTENTE EN LA BASE DE DATOS */
  public function getDataIncomeAccountDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM income_accounts_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function updateDataIncomeAccountDB($id, $income)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE income_accounts_data_table SET incomeaccount=:income WHERE id = :id");
    $stmt->execute(['income' => $income, 'id' => $id]);
    return $stmt->rowCount();
  }
  public function deleteIncomeAccountDB($id)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE income_accounts_data_table SET statusaccount = :status WHERE id = :id");
    $stmt->execute(['status' => 0, 'id' => $id]);
    return $stmt->rowCount();
  }

  public function getDataIncomeAcountDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id, codeaccount, incomeaccount FROM income_accounts_data_table WHERE statusaccount = 1 AND typeaccount != 2");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getDataPenaltyAcountDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id, codeaccount, incomeaccount FROM income_accounts_data_table WHERE statusaccount = 1 AND typeaccount = 2");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getIdAcountPenaltyDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id FROM income_accounts_data_table WHERE statusaccount = 1 AND typeaccount = 2");
    $stmt->execute();
    return $stmt->fetchColumn();
  }
}
