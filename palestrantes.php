<?php include "includes/conexao.inc"; ?>
<html>
    <head>
        <script type="text/javascript"> var peso = 3; </script>
        <?php include "includes/header.inc"; ?>
        <meta name="DC.title" content="Palestrantes e Ministradores- IX SECCIM - UFRRJ" />
		<meta id="SiteKeywords" content="SECCIM, Semana Acadêmica, Computação, UFRRJ, IM, Tecnologia, Programação, Palestrantes, Ministradores" name="keywords"/>
		<meta name="DC.subject" content="SECCIM, Semana Acadêmica, Computação, UFRRJ, IM, Tecnologia, Programação, Palestrantes, Ministradores" />
		<meta name="description" content="Equipe de Palestrantes e Ministradores da IX SECCIM - UFRRJ" />
		<meta name="DC.description" content="Equipe de Palestrantes e Ministradores da IX SECCIM - UFRRJ" />
        <meta property="og.url" content="<?php echo $site_url.$palestrantes_url ?>" />
        <meta property="og.title" content="Palestrantes e Ministradores- IX SECCIM - UFRRJ" />
        <meta property="og.description" content="Equipe de Palestrantes e Ministradores da IX SECCIM - UFRRJ" />
		<meta property="og:image" content="img/auditorio.jpg" />
		<meta property="og:image:type" content="image/jpeg">
		<meta property="og:image:width" content="1600">
		<meta property="og:image:height" content="1204">
        <link rel="stylesheet" type="text/css" href="css/palestrantes.css?v=1">
        <script src="js/palestrantes.js"></script>
        <title>Palestrantes e Ministradores - IX SECCIM</title>
    </head>
    <body>
        <div id="background_fading"></div>
        <div id="filtro_background">
            <?php include "includes/menu.inc"; ?>

            <h1 id="titulo_imagem" class="fonte_titulo">Palestrantes e Ministradores</h1>
            <div id="titulo_spacing"></div>
            <div id="div_texto">
                <div class="ui container">
                    <?php
                    $sql = "SELECT foto, nome, posicao, descricao, id_evento, linkedin, instagram FROM palestrante ORDER BY nome;";
                    $query = $mysqli->query($sql);
                    while ($dados = $query->fetch_assoc()) {
                        $evento_tag = "";
                        if($dados['id_evento'] != NULL){
                            $sql_evento = "SELECT titulo, url, tipo, colab FROM minicurso_palestra WHERE id = ". $dados['id_evento'];
                            $query_evento = $mysqli->query($sql_evento);
                            $dados_evento = $query_evento->fetch_assoc();

                            $evento = "Palestra";
                            if($dados_evento['tipo'] == 0){
                                $evento = "Minicurso";
                            }

                            $evento_tag = '<b>'.$evento.':</b> <a href="'.$palestra_minicurso.$dados_evento['url'].'">'.$dados_evento['titulo'].'</a>';
                        }

                        $aux_buttons = "";

                        if(($dados['linkedin'] != NULL) && ($dados['instagram'] != NULL)) {
                            $aux_buttons = '<div class="ui icon buttons social_button">
                                                <a href="https://linkedin.com/in/' . $dados['linkedin'] . '" target="_new" class="ui linkedin button">
                                                    <i class="linkedin icon"></i>
                                                </a>
                                                <a href="https://instagram.com/' . $dados['instagram'] . '" target="_new" class="ui instagram button">
                                                    <i class="instagram icon"></i>
                                                </a>
                                            </div>';
                        } else {
                            $linkedin = "";
                            if($dados['linkedin'] != NULL){
                                $linkedin = '<a href="https://linkedin.com/in/' . $dados['linkedin'] . '" target="_new" class="ui labeled icon linkedin button social_button">
                                                <i class="linkedin icon"></i>
                                                LinkedIn
                                            </a>';
                            }

                            $instagram = "";
                            if($dados['instagram'] != NULL){
                                $instagram = '<a href="https://instagram.com/' . $dados['instagram'] . '" target="_new" class="ui labeled icon instagram button social_button">
                                                <i class="instagram icon"></i>
                                                Instagram
                                            </a>';
                            }

                            $aux_buttons = $linkedin . $instagram;
                        }
                        $img_colab = '';
                        $url_colab = '';
                        if ($dados_evento['colab'] != null) {
                            $sql_colab = "SELECT img, url FROM patrocinador WHERE id = ". $dados_evento['colab'] .";";
                            $query_colab = $mysqli->query($sql_colab);
                            $dados_colab = $query_colab->fetch_assoc();
                            $img_colab = $dados_colab['img'];
                            $url_colab = $dados_colab['url'];
                        }
                        $foto_colab = '';
                        if ($dados_evento['colab'] != null) {
                            $foto_colab = '<img data-content="II Workshop PyLadies Rural" class="icon_colab" src="img/colab/'. $img_colab .'">';
                        }
                        echo '
                            <div class="nome_palestrante">
                                <p class="fonte_titulo titulo_palestrante">'. $dados["nome"] .'</p>
                                <p class="linha_palestrante1"></p>
                                <p class="linha_palestrante2"></p>
                            </div>
                            <div class="card_palestrante">
                                <div class="coluna_img">
                                    <div class="ui card">
                                        <div class="image">
                                            '. $foto_colab .'
                                            <img src="img/palestrantes/'. $dados["foto"] .'">
                                        </div>
                                    </div>

                                    '.$aux_buttons.'

                                </div>
                                <div class="coluna_content">
                                    <div class="linha2_palestrante fonte_texto">'. $dados["posicao"] .'</div>
                                    <div class="description fonte_texto">
                                        <p>'. $dados["descricao"] .'</p>
                                        '.$evento_tag.'
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
<?php $mysqli->close(); ?>
