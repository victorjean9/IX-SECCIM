<?php
    include "includes/conexao.inc";

    if(!isset($_GET["url"])) {
        header("location:error.php");
    }

    $url = $_GET["url"];

    $test_url = preg_match_all('/^[a-zA-Z0-9-\d]+$/' , $url);

    if (!$test_url) {
        header("location:error.php");
    }

    $sql = "SELECT id, titulo, tipo, foto, resumo, conteudo FROM minicurso_palestra WHERE url = '".$url."';";
    $query = $mysqli->query($sql);
    $dados = $query->fetch_assoc();

    $tipo = "Palestra";
    $sujeito = "Palestrante";
    $sujeito_plural = "Palestrantes";
    if ($dados["tipo"] == 0) {
        $tipo = "Minicurso";
        $sujeito = "Ministrador";
        $sujeito_plural = "Ministradores";
    }

    $tags = str_replace("-", ", ", $url);

    $primeira_hora= '';
    $dia_palestra = '';
    $dia_palestra_nome = '';
    $tabela = '';

    $sql_hora = "SELECT hora_inicio, hora_final, data FROM cronograma WHERE id_evento = ".$dados['id']." ORDER BY ordem;";
    $query_hora = $mysqli->query($sql_hora);
    while($dados_hora = $query_hora->fetch_assoc()){
        if($primeira_hora == ''){
            $primeira_hora = $dados_hora['hora_inicio'];
            $dia_palestra = $dados_hora['data'];
        }

        $dia_palestra_nome_aux = '';
        switch ($dados_hora['data']) {
            case '08/10':
                $dia_palestra_nome_aux = 'Terça-feira';
                break;
            case '09/10':
                $dia_palestra_nome_aux = 'Quarta-feira';
                break;
            case '10/10':
                $dia_palestra_nome_aux = 'Quinta-feira';
                break;
            case '11/10':
                $dia_palestra_nome_aux = 'Sexta-feira';
                break;

            default: //07/10
                $dia_palestra_nome_aux = 'Segunda-feira';
                break;
        }

        $tabela .= '<tr>';
        $tabela .= '<td>'.$dia_palestra_nome_aux.' ('.$dados_hora['data'].')</td>';
        $tabela .= '<td>'.$dados_hora['hora_inicio'].'</td>';
        $tabela .= '<td>'.$dados_hora['hora_final'].'</td>';
        $tabela .= '</tr>';
    }

    switch ($dia_palestra) {
        case '08/10':
            $dia_palestra_nome = 'Terça-feira';
            break;
        case '09/10':
            $dia_palestra_nome = 'Quarta-feira';
            break;
        case '10/10':
            $dia_palestra_nome = 'Quinta-feira';
            break;
        case '11/10':
            $dia_palestra_nome = 'Sexta-feira';
            break;

        default: //07/10
            $dia_palestra_nome = 'Segunda-feira';
            break;
    }
?>
<html>
    <head>
        <script type="text/javascript"> var peso = 3; </script>
        <?php include "includes/header.inc"; ?>
        <meta name="DC.title" content="<?php echo $dados["titulo"]; ?> - IX SECCIM - UFRRJ" />
		<meta id="SiteKeywords" content="SECCIM, Semana Acadêmica, Computação, UFRRJ, IM, Tecnologia, Programação, <?php echo $tags; ?>" name="keywords"/>
		<meta name="DC.subject" content="SECCIM, Semana Acadêmica, Computação, UFRRJ, IM, Tecnologia, Programação, <?php echo $tags; ?>" />
		<meta name="description" content="<?php echo $dados["resumo"]; ?>" />
		<meta name="DC.description" content="<?php echo $dados["resumo"]; ?>" />
        <meta property="og.url" content="<?php echo $site_url.$url ?>" />
        <meta property="og.title" content="<?php echo $dados["titulo"]; ?> - IX SECCIM - UFRRJ" />
		<meta property="og.description" content="<?php echo $dados["resumo"]; ?>" />
		<meta property="og:image" content="img/capa-og/<?php echo $dados["foto"]; ?>" />
		<meta property="og:image:type" content="image/jpeg">
		<meta property="og:image:width" content="800">
		<meta property="og:image:height" content="600">
        <title><?php echo $dados["titulo"]; ?> - IX SECCIM</title>
        <link rel="stylesheet" type="text/css" href="css/palestra-minicurso.css?v=1">
        <script src="js/palestra-minicurso.js"></script>
    </head>
    <body>
        <div id="background_fading" style="background-image : url(img/capa/<?php echo $dados["foto"]; ?>);"></div>
        <div id="filtro_background">
            <?php include "includes/menu.inc"; ?>

            <h1 id="titulo_imagem" class="fonte_titulo"><?php echo $dados["titulo"]; ?></h1>
            <div id="titulo_spacing"></div>
            <div id="div_texto">
                <h1 id="data-hora" class="fonte_titulo"><?php echo $dia_palestra; ?> às <?php echo $primeira_hora; ?></h1>
                <div class="ui container">
                    <p id="texto" class="fonte_texto"><?php echo $dados["conteudo"]; ?></p>
                    <p id="local_evento"><b>Local</b>: <?php if($dados['tipo'] == 0) { echo "3ºAndar, sala 309 - Bloco Informática, IM-UFRRJ"; } else { echo "Auditório Professor Bruno Rodrigues de Almeida, IM-UFRRJ"; } ?></p>
                    <h4 class="ui horizontal divider header">
                        <i class="clock icon"></i> Horários
                    </h4>
                    <table class="ui celled table unstackable">
                        <thead>
                            <tr>
                                <th class="five wide">Dia</th>
                                <th class="five wide">Iníco</th>
                                <th class="five wide">Fim</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php echo $tabela; ?>
                        </tbody>
                    </table>

                    <?php
                        $divider_sujeito = '<h4 class="ui horizontal divider header">
                                                <i class="address card icon"></i>';

                        $sql_count = "SELECT COUNT(*) FROM palestrante WHERE id_evento = ".$dados['id'].";";
                        $query_count = $mysqli->query($sql_count);
                        $dados_count = $query_count->fetch_row();

                        if($dados_count[0] > 1){
                            $divider_sujeito .= $sujeito_plural;
                        } else {
                            $divider_sujeito .= $sujeito;
                        }

                        $divider_sujeito .= '</h4>';

                        if($dados_count[0] != 0){
                            echo $divider_sujeito;
                        } else {
                            echo "<br/>";
                        }

                        $sql_palestrantes = "SELECT foto, nome, posicao, descricao, linkedin, instagram FROM palestrante WHERE id_evento = ".$dados['id'].";";
                        $query_palestrantes = $mysqli->query($sql_palestrantes);
                        while($dados_palestrantes = $query_palestrantes->fetch_assoc()){
                            $aux_buttons = "";

                            if(($dados_palestrantes['linkedin'] != NULL) && ($dados_palestrantes['instagram'] != NULL)) {
                                $aux_buttons = '<div class="ui icon buttons social_button">
                                                    <a href="https://linkedin.com/in/' . $dados_palestrantes['linkedin'] . '" target="_new" class="ui linkedin button">
                                                        <i class="linkedin icon"></i>
                                                    </a>
                                                    <a href="https://instagram.com/' . $dados_palestrantes['instagram'] . '" target="_new" class="ui instagram button">
                                                        <i class="instagram icon"></i>
                                                    </a>
                                                </div>';
                            } else {
                                $linkedin = "";
                                if($dados_palestrantes['linkedin'] != NULL){
                                    $linkedin = '<a href="https://linkedin.com/in/' . $dados_palestrantes['linkedin'] . '" target="_new" class="ui labeled icon linkedin button social_button">
                                                    <i class="linkedin icon"></i>
                                                    LinkedIn
                                                </a>';
                                }

                                $instagram = "";
                                if($dados_palestrantes['instagram'] != NULL){
                                    $instagram = '<a href="https://instagram.com/' . $dados_palestrantes['instagram'] . '" target="_new" class="ui labeled icon instagram button social_button">
                                                    <i class="instagram icon"></i>
                                                    Instagram
                                                </a>';
                                }

                                $aux_buttons = $linkedin . $instagram;
                            }
                            $nome_palestrante = explode(" ", $dados_palestrantes['nome']);
                            echo '
                                <div id="'. $nome_palestrante[0] .'" class="nome_palestrante">
                                    <p class="fonte_titulo titulo_palestrante">'. $dados_palestrantes["nome"] .'</p>
                                    <p class="linha_palestrante1"></p>
                                    <p class="linha_palestrante2"></p>
                                </div>
                                <div class="card_palestrante">
                                    <div class="coluna_img">
                                        <div class="ui card">
                                            <div class="image">
                                                <img src="img/palestrantes/'. $dados_palestrantes["foto"] .'">
                                            </div>
                                        </div>

                                        '.$aux_buttons.'

                                    </div>
                                    <div class="coluna_content">
                                        <div class="linha2_palestrante fonte_texto">'. $dados_palestrantes["posicao"] .'</div>
                                        <div class="description fonte_texto">
                                            <p>'. $dados_palestrantes["descricao"] .'</p>
                                        </div>
                                    </div>
                                </div>
                            ';
                        }
                    ?>
                </div>
            </div>
            <br/>
        </div>
        <?php include "includes/footer.inc" ?>
    </body>
</html>
<?php
    $mysqli->close();
?>
