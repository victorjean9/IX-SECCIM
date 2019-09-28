<?php
    include "conexao.inc";

    //$id = $_POST["id"];
    $array = array();
    //$sql = "SELECT id, titulo, tipo, foto, resumo, conteudo, data, hora, url FROM minicurso_palestra;";
    $sql = "SELECT mp.id AS id_evento, titulo, tipo, foto, resumo, conteudo, cr.data AS data_evento, cr.hora_inicio AS hora_evento, url, colab FROM minicurso_palestra AS mp INNER JOIN cronograma AS cr WHERE cr.id_evento = mp.id AND cr.id_evento != 0 GROUP BY cr.id_evento ORDER BY cr.ordem;";
    $query = $mysqli->query($sql);
    while ($dados = $query->fetch_assoc()) {
        $arrayPalestrantes = array();
        $sql_palestrante = "SELECT nome, foto FROM palestrante WHERE id_evento = ". $dados['id_evento'].";";
        $query_palestrante = $mysqli->query($sql_palestrante);
        while($dados_palestrante = $query_palestrante->fetch_assoc()){
            $arrayPalestrantes[] = array(
                'foto' => $dados_palestrante['foto'],
                'nome' => $dados_palestrante['nome']
            );
        }
        $img_colab = '';
        $url_colab = '';
        if ($dados['colab'] != null) {
            $sql_colab = "SELECT img, url FROM patrocinador WHERE id = ". $dados['colab'] .";";
            $query_colab = $mysqli->query($sql_colab);
            $dados_colab = $query_colab->fetch_assoc();
            $img_colab = $dados_colab['img'];
            $url_colab = $dados_colab['url'];
        }
        $array[] = array(
            'titulo' => $dados['titulo'],
            'tipo' => $dados['tipo'],
            'palestrantes' => $arrayPalestrantes,
            'foto' => $dados['foto'],
            'resumo' => $dados['resumo'],
            'conteudo' => $dados['conteudo'],
            'data' => $dados['data_evento'],
            'hora' => $dados['hora_evento'],
            'url' => $dados['url'],
            'colab' => $dados['colab'],
            'img_colab' => $img_colab,
            'url_colab' => $url_colab
        );
    }

    echo json_encode($array);

    $mysqli->close();
?>
