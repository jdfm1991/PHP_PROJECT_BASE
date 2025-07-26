<?php
require_once("../../config/conexion.php");

class Incomes extends Conectar
{
  public function createDataIncomeDB($id, $income, $penalty, $detail, $percent, $mont, $montp)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO income_data_table (id, datereg, incomeaccount, byreceipt, incomename, percent, amountpercent, incomeaumont) VALUES (:id, :date, :income, :penalty, :detail, :percent, :montp, :mont)");
    $stmt->execute(['id' => $id, 'date' => date('Y-m-d'), 'income' => $income, 'penalty' => $penalty, 'detail' => $detail, 'percent' => $percent, 'mont' => $mont, 'montp' => $montp]);
    return $stmt->rowCount();
  }
  /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION DE LAS CUENTAS DE GASTOS EXISTENTES EN LA BASE DE DATOS */
  public function getListDataIncomeDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, datereg, B.incomeaccount, incomename, amountpercent, incomeaumont 
                                  FROM income_data_table AS A 
                                  INNER JOIN income_accounts_data_table AS B ON A.incomeaccount=B.id
                                WHERE statusincome=1");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
   /* FUNCION PARA EJECUTAR CONSULTAS SQL PARA TRAER INFORMACION UNA UNIDAD DEPARTAMENTAL EXISTENTE EN LA BASE DE DATOS */
  public function getDataIncomeDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM income_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  public function updateDataIncomeDB($id, $detail, $mont, $montp)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE income_data_table SET incomename=:income, amountpercent=:percent, incomeaumont=:aumont WHERE id = :id");
    $stmt->execute(['income' => $detail, 'percent' => $montp, 'aumont' => $mont, 'id' => $id]);
    return $stmt->rowCount();
  }

  public function validateAccountsRelatedIncomeDB($id)
  {
     $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT * FROM income_data_table WHERE incomeaccount = :account AND statusincome = 1");
    $stmt->execute(['account' => $id]);
    return $stmt->rowCount();
    
  }
  public function deleteDataIncomeDB($id)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE income_data_table SET statusincome = :status WHERE id = :id");
    $stmt->execute(['status' => 0, 'id' => $id]);
    return $stmt->rowCount();
  }









   public function getDataExpenseDB2($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT A.id, dateExpense, B.nameSuplier, C.expenseaccount AS expense, expenseName, balanceExpense 
                                    FROM expense_data_table AS A 
                                  INNER JOIN suplier_data_table AS B ON A.idSuplier=B.id
                                  INNER JOIN expense_accounts_data_table AS C ON A.idExpenseAccount=C.id
                                WHERE statusExpense=1 AND A.id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

   public function updateBalanceExpenseDB($account, $payd)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE expense_data_table SET balanceExpense = (balanceExpense - :balence) WHERE id = :id");
    $stmt->execute(['balence' => $payd, 'id' => $account]);
    return $stmt->rowCount();
  }

}
