<?php
$dir = dirname(__DIR__);
require_once $dir."/respuestas/respuestas.php";
require_once "usuario.php";

$RequestAction = [
  "GET" => function () {
    if (isset($_GET['id'])) {
        $token = $_GET['id'];
        $user = new usuario();
        $response = $user->obtenerImagenUsuario($token);
        return '<img src="data:image/jpeg;base64,'.base64_encode($response["IMG DATA"]).'"/>';
    }
  },
  "POST" => function () {
    return "post not implemented";
  },
  "PUT" => function () {
    return "put not implemented";
  },
  "DELETE" => function () {
    return "delete not implemented";
  }
];
$ACTION = $RequestAction[$_SERVER["REQUEST_METHOD"]];
echo $ACTION();
