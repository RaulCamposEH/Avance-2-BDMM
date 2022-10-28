<?php
require_once $_SERVER['DOCUMENT_ROOT']."/core/conexion/conexion.php";
require_once $_SERVER['DOCUMENT_ROOT']."/core/conexion/storedProcedureQuery.php";
require_once $_SERVER['DOCUMENT_ROOT']."/core/respuestas/respuestas.php";
require_once "TokenConst.php";

class apiAuth extends conexion {

    public function login($json){
        $_respuestas = new respuestas;
        $datos = json_decode($json,true);
        if(!(isset($datos['usuario']) || isset($datos['email'])) || !isset($datos["password"])){
            return $_respuestas->status_400();
        }else{
            $email = $datos["email"] ?? false;
            $user = $datos['usuario'];
            $pass = hash("sha256", $datos['password']);
            $UserInfo = array();
            if ($email === false){
                $UserInfo = $this->obtenerUsuarioInfo($datos["usuario"]);
            }
            else{
                $UserInfo = $this->obtenerUsuarioInfo_ByEmail($datos["email"]);
            }
            $this->verificarDatos($UserInfo, $pass);
        }

    }

    private function verificarDatos($UserInfo, $clave){
        if ($clave == $UserInfo["CLAVE_USUARIO"]){
            if("USUARIO ELIMINADO" == $UserInfo["ESTADO_USUARIO"]){
                $this->insertToken($UserInfo["ID"]);
            }
        }
    }

    public function obtenerUsuarioInfo($usuario)
    {
        $sp = new storedProcedureQuery();
    }

    public function obtenerUsuarioInfo_ByEmail($email)
    {
        $sp = new storedProcedureQuery();
    }

    public function insertToken($user_id){
        $val = true;
        $token = bin2hex(openssl_random_pseudo_bytes(16, $val));
        $date = date("Y-m-d H:i");

        $sp = new storedProcedureQuery();

    }

    public function desactivarToken($user_id){
        
    }

    public function activarToken($user_id){

    }
}

?>