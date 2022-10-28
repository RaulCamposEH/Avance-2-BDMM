<?php
$dir = dirname(__DIR__);
require_once $dir . "/conexion/conexion.php";
require_once $dir . "/conexion/storedProcedureQuery.php";
require_once $dir . "/respuestas/respuestas.php";

class usuario extends conexion
{
  const EstadoPublic = 1;
  const EstadoPrivado = 2;
  const EstadoInactivo = 3;

  const InsertarRegistro = 1;
  const ActualizarInformacion = 2;
  const ActualizarRol = 3;
  const ActualizarImagen = 4;
  const ActualizarEstado = 5;
  const GetUserLogin = 1;
  const CheckExistingUser = 2;
  const GetInfoByUsername = 3;
  const GetInfoByToken = 4;
  const GetImageByToken = 5;

  public function appLogin($json)
  {
    $_respuestas = new respuestas;
    $datos = json_decode($json, true);
    
    if ( !isset($datos['username']) || !isset($datos["password"]) ) {
      return $_respuestas->status_400();
    } else {
      $email = false;
      $user = "";
      if(preg_match("/[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$/", $datos['username'])){
        $email = $datos['username'];
      }
      else{
        $user = $datos['username'];
      }
      $pass = parent::encrpitar($datos['password']);
      $select = array();
      $spStmt = "sp_UsuarioReads(:action, :username, :password, :userId, :email, :token)";

      $sp = new storedProcedureQuery();
      $sp
        ->openPDO()
        ->initPDO($spStmt)
        ->preparePDO()
        ->bindValue(":action", usuario::GetUserLogin, PDO::PARAM_INT)
        ->bindValue(":username", ($email != false) ? null: $user, ($email != false) ? PDO::PARAM_NULL : PDO::PARAM_STR)
        ->bindValue(":password", $pass, PDO::PARAM_STR)
        ->bindValue(":userId", null, PDO::PARAM_NULL)
        ->bindValue(":email",  ($email != false) ? $email : null, ($email != false) ? PDO::PARAM_STR : PDO::PARAM_NULL)
        ->bindValue(":token", null, PDO::PARAM_NULL)
        ->execPDO()
        ->PDOresult($select);

      if (isset($select["EMAIL"])){
        if ($user != $select["EMAIL"]) {
          //return "no email found";
          return $_respuestas->status_401("email no encontrado!");
        }
      }
      else if (isset($select["USUARIO"])){
        if ($user != $select["USUARIO"]) {
          //return "no user found";
          return $_respuestas->status_401("usuario no encontrado!");
        }
      }
      if ($pass != $select["PASSWORD"]) {
        //return "not the same password";
        return $_respuestas->status_401("contraseña no coincide!");
      }
      return $_respuestas->response = [
        "status" => "ok", 
        "result" => [
          "status_code" => "200" , 
          "status_content" => "iniciando sesion, bienvenido!",
          "token" => $select["TOKEN"],
          "rol" => $select["ROL"],
          "estado" => $select["ESTADO"]
        ]
      ];
    }
  }

  public function obtenerUsuario_TOKEN($json)
  {
    $_respuestas = new respuestas;
    $datos = json_decode($json, true);
    if (!isset($datos["user_token"])) {
      return $_respuestas->status_400();
    } else {
      $select = array();
      $spStmt = "sp_UsuarioReads(:action, :username, :password, :userId, :email, :token)";

      $token = $datos['user_token'];
      $sp = new storedProcedureQuery();
      $sp
        ->openPDO()
        ->initPDO($spStmt)
        ->preparePDO()
        ->bindValue(":action", self::GetInfoByToken, PDO::PARAM_INT)
        ->bindValue(":username", null, PDO::PARAM_NULL)
        ->bindValue(":password", null, PDO::PARAM_NULL)
        ->bindValue(":userId", null, PDO::PARAM_NULL)
        ->bindValue(":email", null, PDO::PARAM_NULL)
        ->bindValue(":token", $token, PDO::PARAM_STR)
        ->execPDO()
        ->PDOresult($select);

        if ($select["ESTADO USUARIO"] == 3) {
          //return "no user found";
          return $_respuestas->status_401("usuario no encontrado!");
        }
        return $_respuestas->response = [
          "status" => "ok", 
          "result" => [
            "status_code" => "200" , 
            "status_content" => "informacion obtenida exitosamente!",
            "email" => $select["EMAIL"],
            "usuario" => $select["USUARIO"],
            "nombre_completo" => $select["NOMBRE COMPLETO"],
            "sexo" => $select["SEXO"],
            "fecha_nacimiento" => $select["FECHA NACIMIENTO"],
            "token" => $select["TOKEN"],
            "rol" => $select["ROL USUARIO"],
            "state" => $select["ESTADO USUARIO"],
            "image" => base64_encode($select["IMG DATA"]),
            "imgtype" => $select["IMG TYPE"]
          ]
        ];
    }
  }
  
  public function obtenerImagenUsuario($token){
    $select = array();
    $spStmt = "sp_UsuarioReads(:action, :username, :password, :userId, :email, :token)";
    $sp = new storedProcedureQuery();
    $sp
      ->openPDO()
      ->initPDO($spStmt)
      ->preparePDO()
      ->bindValue(":action", self::GetImageByToken, PDO::PARAM_INT)
      ->bindValue(":username", null, PDO::PARAM_NULL)
      ->bindValue(":password", null, PDO::PARAM_NULL)
      ->bindValue(":userId", null, PDO::PARAM_NULL)
      ->bindValue(":email", null, PDO::PARAM_NULL)
      ->bindValue(":token", $token, PDO::PARAM_STR)
      ->execPDO()
      ->PDOResult($select);
      return $select;
  }

  private function UserExists($username, $email = false)
  {
    $select = array();
    $spStmt = "sp_UsuarioReads(:action, :username, :password, :userId, :email, :token)";
    $sp = new storedProcedureQuery();
    $sp
      ->openPDO()
      ->initPDO($spStmt)
      ->preparePDO()
      ->bindValue(":action", usuario::CheckExistingUser, PDO::PARAM_INT)
      ->bindValue(":username",(!$email) ? $username : null, (!$email) ? PDO::PARAM_STR : PDO::PARAM_NULL)
      ->bindValue(":password", null, PDO::PARAM_NULL)
      ->bindValue(":userId", null, PDO::PARAM_NULL)
      ->bindValue(":email", ($email) ? $username : null, ($email) ? PDO::PARAM_STR : PDO::PARAM_NULL)
      ->bindValue(":token", null, PDO::PARAM_NULL)
      ->execPDO()
      ->PDOResult($select);
    
    return $select["EXISTS"];
  }

  public function appRegister($json)
  {
    $_respuestas = new respuestas;
    $datos = json_decode($json, true);
    if (
      !isset($datos["email"]) ||
      !isset($datos["user"]) ||
      !isset($datos["password"]) ||
      !isset($datos["user-rol"]) ||
      !isset($datos["nombre"]) ||
      !isset($datos["A-paterno"]) ||
      !isset($datos["A-materno"]) ||
      !isset($datos["sexo"]) ||
      !isset($datos["born-date"]) ||
      !isset($datos["imagefile"])
    ) {
      return $_respuestas->status_400();
    } 
    else {
      
      $email_exist = $this->UserExists($datos["email"], true);
      if ($email_exist == 1){
        return $_respuestas->response = ["status" => "error", "result" => ["status_code" => "200" , "status_content" => "email ya se encuentra en uso!"]];
      }

      $username_exist = $this->UserExists($datos["user"]);
      if ($username_exist == 1){
        return $_respuestas->response = ["status" => "error", "result" => ["status_code" => "200" , "status_content" => "nombre de usuario ya se encuentra en uso!"]];
      }
      
      $image = $datos["imagefile"];
      if (!is_uploaded_file($image['tmp_name'])) {
        return $_respuestas->status_400();
      }
      $id = 0;
      $imgData = file_get_contents($image['tmp_name']);
      $imgType = $image['type'];
      $token = bin2hex(openssl_random_pseudo_bytes(16, $val));
      $sp = new storedProcedureQuery();
      try {
        $spStmt = "sp_UsuarioActions(:action, :user_id, :email, :user, :pass, :nombre, :apPat, :apMat, :sex, :fecha_n, :fecha_i, :img_data, :img_type, :rol, :estado, :token)";
        $sp->openPDO();
        $sp->startTransact();
        $sp
          ->initPDO($spStmt)
          ->preparePDO()
          ->bindValue(":action", usuario::InsertarRegistro, PDO::PARAM_INT)
          ->bindValue(":user_id", null, PDO::PARAM_NULL)
          ->bindValue(":email", $datos["email"], PDO::PARAM_STR)
          ->bindValue(":user", $datos["user"], PDO::PARAM_STR)
          ->bindValue(":pass", parent::encrpitar($datos["password"]), PDO::PARAM_STR)
          ->bindValue(":nombre", $datos["nombre"], PDO::PARAM_STR)
          ->bindValue(":apPat", $datos["A-paterno"], PDO::PARAM_STR)
          ->bindValue(":apMat", $datos["A-materno"], PDO::PARAM_STR)
          ->bindValue(":sex", $datos["sexo"], PDO::PARAM_INT)
          ->bindValue(":fecha_n", $datos["born-date"], PDO::PARAM_STR)
          ->bindValue(":fecha_i", date("Y-m-d H:i"), PDO::PARAM_STR)
          ->bindValue(":img_data", $imgData, PDO::PARAM_LOB)
          ->bindValue(":img_type", $imgType, PDO::PARAM_STR)
          ->bindValue(":rol", $datos["user-rol"], PDO::PARAM_INT)
          ->bindValue(":estado", usuario::EstadoPublic, PDO::PARAM_INT)
          ->bindValue(":token", $token, PDO::PARAM_STR)
          ->execPDO()
          ;

        $sp->commit();
        $sp->closePDO();

        //Everything OK
        return $_respuestas->response = [
          "status" => "ok", 
          "result" => [
            "status_code" => "200" , 
            "status_content" => "Usuario registrado exitosamente!"
          ]
        ];
        //return $_respuestas->status_200("Usuario Registrado Exitosamente!");
      } catch (\PDOException $exception) {
        $sp->rollback();
        $sp->closePDO();
        echo $exception;
        return $_respuestas->status_500();
      }
    }
  }
}
