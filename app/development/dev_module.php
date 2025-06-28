<?php
require_once("../../config/conexion.php");

class Development extends Conectar
{
  function createDepartmentDB($id, $depart, $tagdepart)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO department_data_table(id, nameDepartment, tagDepartment) VALUES (?,?,?)");
    $stmt->execute([$id, $depart, $tagdepart]);
    return $stmt;
  }
  function getListDepartmentDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->query("SELECT id, nameDepartment, tagDepartment, statusDepartment FROM department_data_table WHERE availableDepartment=1");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  public function getAvailabilityDepartmenttDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT availableDepartment FROM department_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchColumn();
  }
  public function changeAvailabilityDepartmentDB($id, $available)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE department_data_table SET availableDepartment = :available WHERE id = :id");
    $stmt->execute(['available' => $available, 'id' => $id]);
    return $stmt->rowCount();
  }
  public function getStatusDepartmentDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT statusDepartment FROM department_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchColumn();
  }

  public function changeStatusDepartmentDB($id, $status)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE department_data_table SET statusDepartment = ? WHERE id = ?");
    $stmt->execute([$status, $id]);
    return $stmt->rowCount();
  }
  public function getNameDepartmentDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT nameDepartment FROM department_data_table WHERE id = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchColumn();
  }
  public function updateDepartmentDB($id, $depart, $tagdepart)
  {
    $conectar = parent::conexion();
    $stmt = $conectar->prepare("UPDATE department_data_table SET nameDepartment = ?, tagDepartment = ? WHERE id = ?");
    $stmt->execute([$depart, $tagdepart, $id]);
    return $stmt->rowCount();
  }
  function createModuleDB($id, $module, $namelist)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("INSERT INTO module_data_table(id, nameModule, nameListModule) VALUES (?,?,?)");
    $stmt->execute([$id, $module, $namelist]);
    return $stmt;
  }
  function getListNameModulesDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->query("SELECT nameModule FROM module_data_table");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
   function getListModulesDB()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->query("SELECT * FROM module_data_table WHERE availableModule=1");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  function getListModulesDB2()
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->query("SELECT * FROM module_data_table WHERE statusModule=1");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  
  function getValitedDepartmentDB($id)
  {
    $conectar = parent::conexion();
    parent::set_names();
    $stmt = $conectar->prepare("SELECT id FROM model_department_data_table WHERE department = :id");
    $stmt->execute(['id' => $id]);
    return $stmt->fetchColumn();
  }
  
}
