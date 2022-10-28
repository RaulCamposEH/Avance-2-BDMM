<?php

class conexion
{
    private $server;
    private $user;
    private $password;
    private $database;
    private $port;

    protected $PDO;
    protected $mysqli;

    public function __construct()
    {
        $datos = $this->obtenerConexion("conexion.json");
        $this->server = $datos["conexion"]["server"];
        $this->user = $datos["conexion"]["user"];
        $this->password = $datos["conexion"]["password"];
        $this->database = $datos["conexion"]["database"];
        $this->port = $datos["conexion"]["port"];

        $this->mysqli;
        $this->PDO;
    }
    /**
     * funcion que obtiene los datos de la conexion del archivo json con los datos requeridos para la conexion
     * @param string $filename nombre del archivo json con los datos de la conexion
     * @return array array
     */
    private function obtenerConexion(string $filename): array
    {
        $filedir = dirname(__FILE__);
        $jsonfile = file_get_contents($filedir."/$filename");
        return json_decode($jsonfile, true);
    }

    /**
     * funcion que sirve para conectar a la base de datos
     * @return void
     */
    public function conectar(){
        $this->mysqli = new mysqli(
          $this->server,
          $this->user,
          $this->password,
          $this->database,
          $this->port
        );

        if($this->mysqli->connect_errno){
            echo "Error Conexion";
            die();
        }
    }

    public  function desconectar(){
        $this->mysqli->close();
    }

    public function open()
    {
        try {
            $this->PDO = new PDO("mysql:host=$this->server;dbname=$this->database", $this->user, $this->password);
            // set the PDO error mode to exception
            $this->PDO->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->PDO->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
            //echo "Connected successfully";
        } catch(\PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function close()
    {
        $this->PDO = null;
    }

    protected function convertirUTF8(array $array): array
    {
        array_walk_recursive($array, function (&$item, $key)
        {
            if(!mb_detect_encoding($item, 'utf8')){ #si funciona mal usar "utf-8"
                $item = utf8_encode($item);
            }
        });
        return $array;
    }

    protected function encrpitar($string): string
    {
        return hash("sha256", $string);
    }
}