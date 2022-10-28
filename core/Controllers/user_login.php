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
    if (!empty($datos)){
      $datos = json_encode($datos);
      $user = new usuario();
      $response = $user->appLogin($datos);
      header('Content-Type: application/json');
      //$response = $datos;
      return $response;
    }
    //return $datos;
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
