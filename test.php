<?php
require "core/conexion/conexion.php";
require "core/conexion/storedProcedureQuery.php";

$con = new conexion();

$select1 = array();

//$token = bin2hex(openssl_random_pseudo_bytes(16, $val));
//echo $token;

$select = array();
    $spStmt = "sp_UsuarioReads(:action, :username, :password, :userId, :email, :token)";
    $sp = new storedProcedureQuery();
    $sp
      ->openPDO()
      ->initPDO($spStmt)
      ->preparePDO()
      ->bindValue(":action", 5, PDO::PARAM_INT)
      ->bindValue(":username", null, PDO::PARAM_NULL)
      ->bindValue(":password", null, PDO::PARAM_NULL)
      ->bindValue(":userId", null, PDO::PARAM_NULL)
      ->bindValue(":email", null, PDO::PARAM_NULL)
      ->bindValue(":token", "'4d08a7c0b2466ca12292c06569c9d4b0'", PDO::PARAM_STR)
      ->execPDO()
      ->PDOResult($select);
    print_r($select);
/*
$email = false;
$username = "Zeal1";
$spStmt = "sp_UsuarioReads(:action, :username, :password, :userId, :email)";
$sp = new storedProcedureQuery();
$sp
    ->openPDO()
    ->initPDO($spStmt)
    ->preparePDO()
    ->bindValue(":action", 2, PDO::PARAM_INT)
    ->bindValue(":username",(!$email) ? $username : null, (!$email) ? PDO::PARAM_STR : PDO::PARAM_NULL)
    ->bindValue(":password", null, PDO::PARAM_NULL)
    ->bindValue(":userId", null, PDO::PARAM_NULL)
    ->bindValue(":email", ($email) ? $username : null, ($email) ? PDO::PARAM_STR : PDO::PARAM_NULL)
    ->execPDO()
    ->PDOResult($select1);

print_r($select1);
*/
/*
$email = false;
$user = "Zeal";
$pass = hash("sha256", utf8_encode("Abc.1234"));
$select = array();
$spStmt = "sp_UsuarioReads(:action, :username, :password, :userId, :email)";

$sp = new storedProcedureQuery();
$sp
  ->openPDO()
  ->initPDO($spStmt)
  ->preparePDO()
  ->bindValue(":action", 1, PDO::PARAM_INT)
  ->bindValue(":username", ($email !== false) ? null : $user, ($email != false) ? PDO::PARAM_NULL : PDO::PARAM_STR)
  ->bindValue(":password", $pass, PDO::PARAM_STR)
  ->bindValue(":userId", null, PDO::PARAM_NULL)
  ->bindValue(":email", ($email !== false) ? $email : null, ($email != false) ? PDO::PARAM_STR : PDO::PARAM_NULL)
  ->execPDO()
  ->PDOresult($select);

if (isset($select["EMAIL"])) {
  if ($user != $select["EMAIL"]) {
    echo "no email found";
    //return $_respuestas->status_401("email no encontrado!");
  }
} else if (isset($select["USUARIO"])) {
  if ($user != $select["USUARIO"]) {
    echo "no user found";
    //return $_respuestas->status_401("usuario no encontrado!");
  }
}
if ($pass != $select["PASSWORD"]) {
  echo "\n".$pass."\n";
  echo "\n".$select["PASSWORD"]."\n";
  echo "not the same password";
  //return $_respuestas->status_401("contraseña no coincide!");
}
else{
  echo "todo ok";
}
//return $_respuestas->status_200("Inicio de sesion exitoso!");
*/