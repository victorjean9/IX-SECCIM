<?php
    $servidor = "localhost";
    $usuario = "root";
    $senha = "";
    $schema = "seccim";

    if($_SERVER['SERVER_PORT'] == 8888){
        $servidor = "localhost:8889";
        $usuario = "root";
        $senha = "root";
        $schema = "seccim";
    }

    $mysqli = new mysqli($servidor, $usuario, $senha, $schema);

    if ($mysqli->connect_errno) {
        die("Não Foi Possivel Conectar Ao Banco De Dados ");
    }

    mysqli_set_charset($mysqli, "utf8");
?>
