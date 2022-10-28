<?php
$dir = dirname(__DIR__);
require_once $dir."/respuestas/respuestas.php";
require_once "usuario.php";

$RequestAction = [
    "GET" => function () {
      return "get not implemented";
    },
    "POST" => function () {
      $datos = $_POST;
      $datosImagen = $_FILES;
      if (!empty($datos) && !empty($datosImagen))
      {
        $allData = array_merge($datos, $datosImagen);
        $allData = json_encode($allData);
        $user = new usuario();
        $response = $user->appRegister($allData);
        header('Content-Type: application/json');
        //$response = $allData; 
        return $response;
      }
      else{
        $_resp = new respuestas();
        $_resp->status_400();
      }
    },
    "PUT" => function () {
      return "put not implemented";
    },
    "DELETE" => function () {
      return "delete not implemented";
    }
  ];
$ACTION = $RequestAction[$_SERVER["REQUEST_METHOD"]];

echo json_encode($ACTION());
?>