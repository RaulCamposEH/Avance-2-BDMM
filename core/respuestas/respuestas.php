<?php

class respuestas{

    public $response = [
        "status" => "ok",
        "result" => array()
    ];

    public function status_405(){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "status_code" => "405",
            "status_content" => "Metodo no permitido"
        );
        return $this->response;
    }

    public function status_200($valor = "Datos incorrectos"){
        if ($valor != "Datos incorrectos")
            $this->response['status'] = "ok";
        else
            $this->response['status'] = "error";
        $this->response['result'] = array(
            "status_code" => "200",
            "status_content" => $valor
        );  
        return $this->response;
    }

    public  function status_400(){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "status_code" => "400",
            "status_content" => "Datos incompletos o con formato incorrecto"
        );
        return $this->response;
    }

    public function status_401($valor = "No autorizado"){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "status_code" => "401",
            "status_content" => $valor
        );
        return $this->response;
    }

    public function status_500($valor = "Error interno del servidor"){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "status_code" => "500",
            "status_content" => $valor
        );
        return $this->response;
    }



}

?>