<?php
    include "conexao.inc";
    include "links.php";

    function carrega_informacoes($id){
        include "conexao.inc";

        // Função para pegar informações de uma paletra/minicurso

        $sql_evento = "SELECT titulo, tipo, url FROM minicurso_palestra WHERE id='". $id ."';";
        $query_evento = $mysqli->query($sql_evento);
        $dados_minicurso_palestra = $query_evento->fetch_assoc();

        return $dados_minicurso_palestra;
    }

    $dia = '07/10';

    if((date("d") >= 7) && (date("d") <= 11) && (date("m") == 10)){
        $dia = date("d/m");
    }

    if(isset($_POST['dia']) && $_POST['dia'] != ""){
        $dia = $_POST['dia'];
    }

    $array = array();
    $sql = "SELECT id, data, hora_inicio, hora_final, id_evento, nome FROM cronograma WHERE data = '" . $dia . "' || data = '*'  ORDER BY hora_inicio;";
    $query = $mysqli->query($sql);
    while ($dados = $query->fetch_assoc()) {

        // Exceção Pyladies
        if($dia == '09/10' && $dados['data'] == '*' && $dados['nome'] == "Almoço"){
            continue;
        }

        $cor = 'orange';
        $icone = 'star';
        $local = "";
        $url = "";
        $nome = $dados['nome'];
        $tipo = 0; // 0 nenhum, 1 - palestra, 2 - minicurso

        if($dados['id_evento'] != 0) {
            $info_evento = carrega_informacoes($dados['id_evento']);
            $tipo = $info_evento['tipo'];
            if($tipo == 0){
                $tipo = 2;
            }
            $nome = $info_evento['titulo'];
            $url = $palestra_minicurso.$info_evento['url'];

            $cor = 'blue';
            $icone = 'bullhorn';
            $local = 'Auditório Professor Bruno Rodrigues de Almeida, IM-UFRRJ';
            if($info_evento['tipo'] == 0) {
                $local = '3ºAndar, sala 309 - Bloco Informática, IM-UFRRJ';
                $icone = 'graduation cap';
                $cor = 'green';
            }
        } else {
            if ($dados['nome'] == 'Almoço') {
                $icone = 'utensils';
                $cor = 'red';
            }

            if ($dados['id'] == 36) {
                $icone = 'film';
                $cor = 'purple';
            }

            if (($dados['id'] >= 24) && ($dados['id'] <= 27)){
                $icone = 'laptop';
                $cor = 'teal';
            }

            if(($dados['data'] == '*') && ($dados['nome'] != 'Almoço')){
                $cor = 'brown';
                $icone = 'coffee';
                if ($dados['nome'] == 'Encerramento') {
                    $icone = 'power off';
                    $cor = 'black';
                }
            }
        }

        $array[] = array(
            'data' => $dados['data'],
            'hora_inicio' => $dados['hora_inicio'],
            'hora_final' => $dados['hora_final'],
            'cor' => $cor,
            'icone' => $icone,
            'nome' => $nome,
            'local' => $local,
            'url' => $url,
            'tipo' => $tipo
        );
    }

    echo json_encode($array);

    $mysqli->close();
?>
