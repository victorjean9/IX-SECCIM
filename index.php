<?php
    include "includes/conexao.inc";
    function completa_blocos($tipo) {
        include "includes/conexao.inc";

        $sql = "SELECT nome, url, img FROM patrocinador WHERE tipo = ".$tipo." ORDER BY ordem;";
        $query = $mysqli->query($sql);
        while ($dados = $query->fetch_assoc()) {
            echo '
                <div class="bloco_patrocinador">
                    <div class="coluna_a_patrocinador">
                        <a href="http://'.$dados['url'].'" target="_new">
                            <div class="foto_patrocinador" alt="'.$dados['nome'].'" title="'.$dados['nome'].'" style="background-image: url(img/patrocinadores/'.$dados['img'].');"></div>
                        </a>
                    </div>
                </div>
            ';
        }

        $mysqli->close();
    }
?>
<html>
    <head>
        <?php include "includes/header.inc"; ?>
        <script>
            if ('serviceWorker' in navigator) {
                navigator.serviceWorker.register('service-worker.js').then(function () {
                    console.log('service worker registered');
                }).catch(function () {
                    console.warn('service worker failed');
                });
            }
        </script>
        <meta name="DC.title" content="SECCIM - Semana Acadêmica de Ciência da Computação - UFRRJ" />
		<meta id="SiteKeywords" content="SECCIM, Semana Acadêmica, Computação, UFRRJ, IM, Tecnologia, Programação" name="keywords"/>
		<meta name="DC.subject" content="SECCIM, Semana Acadêmica, Computação, UFRRJ, IM, Tecnologia, Programação" />
		<meta name="description" content="Semana Acadêmica de Ciência da Computação - UFRRJ" />
		<meta name="DC.description" content="Semana Acadêmica de Ciência da Computação - UFRRJ" />
        <meta property="og.url" content="<?php echo $site_url ?>" />
        <meta property="og.title" content="SECCIM - Semana Acadêmica de Ciência da Computação - UFRRJ" />
		<meta property="og.description" content="Semana Acadêmica de Ciência da Computação - UFRRJ" />
		<meta property="og:image" content="img/banner-site.jpg" />
		<meta property="og:image:type" content="image/jpeg">
		<meta property="og:image:width" content="1024">
		<meta property="og:image:height" content="720">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-title" content="IX SECCIM">
        <link rel="apple-touch-icon" href="/img/icons/icon-152x152.png">
        <meta name="description" content="Semana Acadêmica de Ciência da Computação - UFRRJ">
        <meta name="theme-color" content="black">
        <script type="text/javascript">
            var peso = 2;
            var urlPalestraMinicurso = "<?php echo $palestra_minicurso; ?>";
        </script>
        <title>Home - IX SECCIM</title>
        <link rel='manifest' href='public/manifest.json'>
        <link rel="stylesheet" type="text/css" href="css/index.css?v=8">
        <link rel="stylesheet" href="css/slider.css?v=1">
        <script src="js/index.js"></script>
        <script src="js/slider.js"></script>
    </head>
    <body>
        <div id="pusher_index">
            <?php include "includes/menu.inc"; ?>
            <div id="div_slider" class="slider-container">
                <div class="slider">
                    <div class="slider__item">
                        <div class="slider_page" style="background-image : url(img/cidades.jpg);"></div>
                        <span class="slider__caption__title fonte_titulo">IX SECCIM</a> </span>
                        <span class="slider__caption__subtitle fonte_titulo">IX Semana Acadêmica de Ciência da Computação.</a> </span>
                        <span class="slider__caption__tag fonte_titulo">Dos dias 7 à 11 de Outubro de 2019</a> </span>
                    </div>
                    <?php
                        $socket = fsockopen('udp://pool.ntp.br', 123, $err_no, $err_str, 1);
                        $hora = 0;
                        $minuto = 0;
                        $mes = 0;
                        $dia = 0;
                        if ($socket){
                            if (fwrite($socket, chr(bindec('00'.sprintf('%03d', decbin(3)).'011')).str_repeat(chr(0x0), 39).pack('N', time()).pack("N", 0))){
                                stream_set_timeout($socket, 1);
                                $unpack0 = unpack("N12", fread($socket, 48));
                                $hora = date('H', $unpack0[7]);
                                $hora -= 3;
                                $minuto = date('i', $unpack0[7]);
                                $mes = date('m', $unpack0[7]);
                                $dia = date('d', $unpack0[7]);
                            }

                            fclose($socket);
                        }

                        if (($dia >= "07") && ($dia <= "11") && ($mes == "10")) {
                            $sql_agora = "SELECT mp.id AS id_evento, titulo, tipo, foto, resumo, conteudo, cr.data AS data_evento, hora_inicio, hora_final, url FROM minicurso_palestra AS mp INNER JOIN cronograma AS cr WHERE cr.id_evento = mp.id AND cr.id_evento != 0 AND cr.data = '" . $dia . "/" . $mes ."'  GROUP BY cr.id_evento ORDER BY cr.ordem;";
                            $query_agora = $mysqli->query($sql_agora);
                            while ($dados_agora = $query_agora->fetch_assoc()) {
                                $hora_inicio = $dados_agora['hora_inicio'];
                                $hora_inicio_hora = $hora_inicio[0].$hora_inicio[1];
                                $hora_inicio_minutos = $hora_inicio[3].$hora_inicio[4];
                                $hora_final = $dados_agora['hora_final'];
                                $hora_final_hora = $hora_final[0].$hora_final[1];
                                $hora_final_minutos = $hora_final[3].$hora_final[4];

                                $entrou = false;

                                if((intval($hora) >= intval($hora_inicio_hora)) && (intval($hora) <= intval($hora_final_hora)))  {

                                    if(intval($hora_inicio_hora) == intval($hora)){
                                        if(intval($hora_inicio_minutos) <= intval($minuto)) {
                                            $entrou = true;
                                        } else {
                                            $entrou = false;
                                        }
                                    } else if(intval($hora_final_hora) == intval($hora)){
                                        if(intval($hora_final_minutos) >= intval($minuto)) {
                                            $entrou = true;
                                        } else {
                                            $entrou = false;
                                        }
                                    } else {
                                        $entrou = true;
                                    }
                                }

                                if($entrou) {
                                    echo '
                                        <div class="slider__item">
                                            <div class="slider_page" style="background-image : url(img/capa/'.$dados_agora['foto'].');"></div>
                                            <span class="slider__caption__title fonte_titulo"><a href="'.$palestra_minicurso.$dados_agora['url'].'" style="color:white;">Agora!</a> </span>
                                            <span class="slider__caption__subtitle fonte_titulo"><a href="'.$palestra_minicurso.$dados_agora['url'].'" style="color:white;">'.$dados_agora['titulo'].'. </a> </span>
                                            <span class="slider__caption__tag fonte_titulo"><a href="'.$palestra_minicurso.$dados_agora['url'].'" style="color:white;">Clique para ver informações.</a></span>
                                        </div>
                                    ';
                                }
                            }
                        }

                        $sql_aleat = "SELECT foto FROM minicurso_palestra ORDER BY rand() LIMIT 1;";
                        $query_aleat = $mysqli->query($sql_aleat);
                        $dados_aleat = $query_aleat->fetch_assoc();
                    ?>
                    <div class="slider__item">
                        <div class="slider_page" style="background-image : url(img/slider/cronograma.jpg);"></div>
                        <span class="slider__caption__title fonte_titulo slider_cronograma">Se liga!</span>
                        <span class="slider__caption__subtitle fonte_titulo slider_cronograma">Fique atento sobre a nossa programação.</span>
                    </div>
                    <div class="slider__item">
                        <div class="slider_page" style="background-image : url(img/capa/<?php echo $dados_aleat['foto']; ?>);"></div>
                        <span class="slider__caption__title fonte_titulo">Aprenda!</span>
                        <span class="slider__caption__subtitle fonte_titulo">Veja abaixo nossa programação de palestras e minicursos!</span>
                    </div>
                    <div class="slider__item">
                        <div class="slider_page" style="background-image : url(img/slider/pyladies.jpg);"></div>
                        <span class="slider__caption__title fonte_titulo pyladies_button">Pyladies Rural</span>
                        <span class="slider__caption__subtitle fonte_titulo pyladies_button">II Workshop Pyladies Rural: No dia 9 de outubro de 8h às 18h, você tem um encontro marcado com um time incrível de grandes mulheres da Computação</span>
                    </div>
                    <div class="slider__item">
                        <div class="slider_page" style="background-image : url(img/slider/maratona.jpg);"></div>
                        <span class="slider__caption__title fonte_titulo ">Maratona!</span>
                        <span class="slider__caption__subtitle fonte_titulo inscreva_button">A Maratona de Programação, que ocorrerá no dia 11/10, é uma competição onde trios de programador@s se reúnem para resolver diversos desafios de programação. O grupo que conseguir resolver o maior número de problemas, vence!</span>
                    </div>
                    <div class="slider__item">
                        <div class="slider_page" style="background-image : url(img/slider/cinecomp.jpeg);"></div>
                        <span class="slider__caption__title fonte_titulo inscreva_button">CineComp</span>
                        <span class="slider__caption__subtitle fonte_titulo inscreva_button">O Jogo da Imitação, filme que conta a história de Allan Turing, será exibido no dia 11/09 às 14hrs no auditório da Pós-graduação.</span>
                    </div>
                </div>
                <div class="slider__switch slider__switch--prev" data-ikslider-dir="prev">
                    <span><svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 20 20"><path d="M13.89 17.418c.27.272.27.71 0 .98s-.7.27-.968 0l-7.83-7.91c-.268-.27-.268-.706 0-.978l7.83-7.908c.268-.27.7-.27.97 0s.267.71 0 .98L6.75 10l7.14 7.418z"/></svg></span>
                </div>
                <div class="slider__switch slider__switch--next" data-ikslider-dir="next">
                    <span><svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 20 20"><path d="M13.25 10L6.11 2.58c-.27-.27-.27-.707 0-.98.267-.27.7-.27.968 0l7.83 7.91c.268.27.268.708 0 .978l-7.83 7.908c-.268.27-.7.27-.97 0s-.267-.707 0-.98L13.25 10z"/></svg></span>
                </div>
            </div>
            <div id="background_fading"></div>
            <div id="botoes_publicacoes_div" class="ui stackable three column grid">
                <div class="column"></div>
                <div class="column">
                    <div class="ui grid">
                        <div id="botoes_publicacoes" class="three column row">
                            <div id="btn_sub_menu_todos" class="column sub_menu active fonte_titulo">Todos</div>
                            <div id="btn_sub_menu_palestra" class="column sub_menu fonte_titulo">Palestra</div>
                            <div id="btn_sub_menu_minicurso" class="column sub_menu fonte_titulo">Minicurso</div>
                        </div>
                    </div>
                </div>
                <div class="column"></div>
            </div>
            <div class="ui container">
                <br/>

                <div id="pool_palestras_minicursos" class="ui stackable three column grid">
                    <?php
                        $i = 0;
                        while($i < 6){
                            echo '
                                <div class="column bloco_carregando">
                                    <div class="coluna_a">
                                        <div class="ui placeholder placeholder_bloco">
                                            <div class="image"></div>
                                        </div>
                                        <div>
                                            <h3 class="ui header fonte_titulo titulo_bloco">
                                                <div class="ui placeholder">
                                                    <div class="header">
                                                        <div class="line"></div>
                                                    </div>
                                                </div>
                                            </h3>
                                            <div class="ui placeholder">
                                                <div class="line"></div>
                                                <div class="line"></div>
                                                <div class="line"></div>
                                                <div class="line"></div>
                                                <div class="line"></div>
                                            </div>
                                            <div class="ui divider"></div>
                                            <div>
                                                <p class="fonte_titulo">
                                                    <div class="ui placeholder">
                                                        <div class="line"></div>
                                                    </div>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>';
                            $i++;
                        }
                    ?>
                </div>
                <br/>
                <h4 id="part_patrocinadores" class="ui horizontal divider inverted header">
                    <i class="bullhorn icon"></i>
                    Patrocinadores
                </h4>
                <center>
                    <?php completa_blocos(1); ?>
                </center>
                <h4 id="part_parceiros" class="ui horizontal divider inverted header">
                    <i class="handshake outline icon"></i>
                    Parceiros
                </h4>
                <center>
                    <?php completa_blocos(2); ?>
                </center>
                <h4 id="part_apoiadores" class="ui horizontal divider inverted header">
                    <i class="thumbs up outline icon"></i>
                    Apoiadores
                </h4>
                <center>
                    <?php completa_blocos(3); ?>
                </center>
            </div>
            <?php include "includes/footer.inc" ?>
        </div>

    </body>
</html>
