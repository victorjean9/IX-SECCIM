<?php include "includes/conexao.inc"; ?>
<html>
    <head>
        <script type="text/javascript"> var peso = 3; </script>
        <?php include "includes/header.inc"; ?>
        <meta name="DC.title" content="Organizadores - IX SECCIM" />
		<meta id="SiteKeywords" content="SECCIM, Semana Acadêmica, Computação, UFRRJ, IM, Tecnologia, Programação, Organizadores" name="keywords"/>
		<meta name="DC.subject" content="SECCIM, Semana Acadêmica, Computação, UFRRJ, IM, Tecnologia, Programação, Organizadores" />
		<meta name="description" content="Equipe de Organizadores da IX SECCIM - UFRRJ" />
		<meta name="DC.description" content="Equipe de Organizadores da IX SECCIM - UFRRJ" />
        <meta property="og.url" content="<?php echo $site_url.$organizadores_url ?>" />
        <meta property="og.title" content="Organizadores - IX SECCIM" />
        <meta property="og.description" content="Equipe de Organizadores da IX SECCIM - UFRRJ" />
		<meta property="og:image" content="img/organizadores.png" />
		<meta property="og:image:type" content="image/png">
		<meta property="og:image:width" content="1916">
		<meta property="og:image:height" content="534">
        <link rel="stylesheet" type="text/css" href="css/organizadores.css?v=1">
        <script src="js/organizadores.js"></script>
        <title>Organizadores - IX SECCIM</title>
    </head>
    <body>
        <div id="background_fading"></div>
        <div id="filtro_background">
            <?php include "includes/menu.inc"; ?>

            <h1 id="titulo_imagem" class="fonte_titulo">Organizadores</h1>
            <div id="titulo_spacing"></div>
            <div id="div_texto">
                <div class="ui container">
                    <div class="ui stackable three column grid">
                        <div class="column">
                            <div class="nome_organizadores">
                                <p class="fonte_titulo titulo_organizadores"><i class="gem icon"></i> Comissão Organizadora</p>
                                <p class="linha_organizadores1"></p>
                                <p class="linha_organizadores2"></p>
                            </div>
                            <div class="card_organizadores">
                                Julia Robaina
                                <br/>
                                Khiara Shantala
                                <br/>
                                Ramon Machado
                            </div>
                        </div>
                        <div class="column">
                            <div class="nome_organizadores">
                                <p class="fonte_titulo titulo_organizadores"><i class="code icon"></i> Comissão de Desenvolvimento Web</p>
                                <p class="linha_organizadores1"></p>
                                <p class="linha_organizadores2"></p>
                            </div>
                            <div class="card_organizadores">
                                <b>Victor Jean Pimentel Lima (Líder)</b>
                                <br/>
                                Roberto de Oliveira Faria
                                <br/>
                                Michael Bruno
                                <br/>
                                Mariana Mendes
                            </div>
                        </div>
                        <div class="column">
                            <div class="nome_organizadores">
                                <p class="fonte_titulo titulo_organizadores"><i class="dollar sign icon"></i> Comissão Finanças</p>
                                <p class="linha_organizadores1"></p>
                                <p class="linha_organizadores2"></p>
                            </div>
                            <div class="card_organizadores">
                                <b>Maria Eduarda (Líder)</b>
                                <br/>
                                Franklin Anderson Brito de Oliveira
                                <br/>
                                Edson Neves
                                <br/>
                                Sérgio Felipe
                            </div>
                        </div>
                        <div class="column">
                            <div class="nome_organizadores">
                                <p class="fonte_titulo titulo_organizadores"><i class="chart line icon"></i> Comissão de Secretariado</p>
                                <p class="linha_organizadores1"></p>
                                <p class="linha_organizadores2"></p>
                            </div>
                            <div class="card_organizadores">
                                <b>Allan Sette (Líder)</b>
                                <br/>
                                Diana Nogueira
                                <br/>
                                Elias Seixas
                                <br/>
                                Marina Hamann da Rosa Ribeiro Cordeiro
                            </div>
                        </div>
                        <div class="column">
                            <div class="nome_organizadores">
                                <p class="fonte_titulo titulo_organizadores"><i class="coffee icon"></i> Comissão do Coffee Break</p>
                                <p class="linha_organizadores1"></p>
                                <p class="linha_organizadores2"></p>
                            </div>
                            <div class="card_organizadores">
                                <b>Gustavo de Souza (Líder)</b>
                                <br/>
                                Aline Araujo
                                <br/>
                                Jessica Ruel
                                <br/>
                                Gabriel Moraes
                                <br/>
                                Icaro
                            </div>
                        </div>
                        <div class="column">
                            <div class="nome_organizadores">
                                <p class="fonte_titulo titulo_organizadores"><i class="plug icon"></i> Comissão de Infraestrutura</p>
                                <p class="linha_organizadores1"></p>
                                <p class="linha_organizadores2"></p>
                            </div>
                            <div class="card_organizadores">
                                <b>Herbert de Souza (Líder)</b>
                                <br/>
                                Ana Luiza
                                <br/>
                                Leonardo Santos
                            </div>
                        </div>
                        <div class="column">
                            <div class="nome_organizadores">
                                <p class="fonte_titulo titulo_organizadores"><i class="laptop icon"></i> Comissão da Maratona</p>
                                <p class="linha_organizadores1"></p>
                                <p class="linha_organizadores2"></p>
                            </div>
                            <div class="card_organizadores">
                                <b>Elyda Rodrigues (Líder)</b>
                                <br/>
                                Gabriel Henrique
                                <br/>
                                Joao Pedro
                            </div>
                        </div>
                        <div class="column">
                            <div class="nome_organizadores">
                                <p class="fonte_titulo titulo_organizadores"><i class="comments icon"></i> Comissão de Divulgação</p>
                                <p class="linha_organizadores1"></p>
                                <p class="linha_organizadores2"></p>
                            </div>
                            <div class="card_organizadores">
                                <b>Natália Silva (Líder)</b>
                                <br/>
                                Rodolfo dos Santos
                                <br/>
                                Daniel Nogueira
                                <br/>
                                Thales Zarzar
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </body>
    <?php include "includes/footer.inc" ?>
</html>
<?php $mysqli->close(); ?>
