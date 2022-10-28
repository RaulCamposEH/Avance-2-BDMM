<?php
require_once "conexion.php";

class storedProcedureQuery extends conexion
{
  //private $spName;
  private $spStmt;
  //private $spQuery;
  private $stmt;
  //private $sptemplate;
  //private $spParameters;

  public function __construct()
  {
    parent::__construct();
  }

  public function startTransact()
  {
    $this->PDO->beginTransaction();
  }

  public function commit()
  {
    $this->PDO->commit();
  }

  public function rollback()
  {
    $this->PDO->rollback();
  }
  
  public function initPDO($sp): storedProcedureQuery
  {
    $this->spStmt = str_replace("{p}", "$sp", "Call {p}");
    //$this->spParameters = array();
    return $this;
  }

  public function openPDO(): storedProcedureQuery
  {
    $this->open();
    $this->PDO->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $this;
  }

  public function closePDO(): storedProcedureQuery
  {
    $this->stmt->closeCursor();
    $this->close();
    return $this;
  }

  public function preparePDO(): storedProcedureQuery
  {
    $this->stmt = $this->PDO->prepare($this->spStmt);
    return $this;
  }

  public function bindValue($name, $value, $paramtype): storedProcedureQuery
  {
    $this->stmt->bindValue($name, $value, $paramtype);
    return $this;
  }

  public function printStatement()
  {
    $this->stmt->debugDumpParams();
    echo "\n" . $this->spStmt . "\n";
    return $this;
  }

  public function execPDO()
  {
    $this->stmt->execute();
    return $this;
  }

  public function PDOsingleResult(array &$result)
  {
    $result = $this->stmt->fetchAll(PDO::FETCH_ASSOC);
    return $this;
  }

  public function PDOresult(array &$result)
  {
    $result = $this->stmt->fetchAll(PDO::FETCH_ASSOC)[0];
    return $this;
  }

  public function PDOnext(&$nextresult)
  {
    $this->stmt->nextRowset();
    $nextresult = $this->stmt->fetchAll(PDO::FETCH_ASSOC)[0];
    return $this;
  }

  public function PDOlastInsertId(&$id)
  {
    $id = $this->PDO->lastInsertId();
    return $this;
  }
}
