<div id="menu_principal">
    <a href="<?php echo $index_url; ?>"><img class="nome_menu nome_menu_grande" src="img/logo.png"></a>
    <a class="btn_menu btn_menu_grande fonte_titulo btn_pc inscreva_button">Inscreva-se</a>
    <a class="btn_menu btn_menu_grande fonte_titulo btn_pc cronograma_button">Cronograma</a>
    <a class="btn_menu btn_menu_grande fonte_titulo btn_pc" href="<?php echo $palestrantes_url; ?>">Palestrantes/Ministradores</a>
    <a class="btn_menu btn_menu_grande fonte_titulo btn_pc" href="<?php echo $index_url; ?>#part_patrocinadores">Colaboradores</a>
    <a class="btn_menu btn_menu_grande fonte_titulo btn_pc" href="<?php echo $organizadores_url; ?>">Organizadores</a>
    <a class="btn_menu btn_menu_grande fonte_titulo btn_pc pyladies_button">Pyladies Rural</a>
    <a id="menu_hamburguer" class="btn_menu btn_menu_grande fonte_titulo"><i class="bars icon"></i></a>
</div>
<div id="remove_espaço_menu"></div>
<?php
    // Pega todos os dias exceto *
    $array_dias = array();

    $sql_dias = "SELECT data FROM cronograma WHERE data != '*' ORDER BY data;";
    $query_dias = $mysqli->query($sql_dias);
    while ($dados_dias = $query_dias->fetch_assoc()) {
        if (!in_array($dados_dias['data'], $array_dias)) {
            $array_dias[] = $dados_dias['data'];
        }
    }
?>
<div id="cronograma_modal" class="ui tiny modal">
    <i class="close icon"></i>
    <div class="header">Cronograma</div>
    <div id="cronograma_modal_content" class="content">
        <p>Clique nos blocos para ver a duração e o local dos eventos.</p>
        <p>Selecione um dia:
            <select id="select_cronograma" class="ui dropdown" style="width:100px;">
                <?php
                    $hoje_dia_mes = date("d/m");
                    foreach ($array_dias as &$dia) {
                        $aux_html = "";
                        if($hoje_dia_mes == $dia) {
                            $aux_html = " selected";
                        }
                        echo '<option value="' . $dia . '"' . $aux_html . '>' . $dia . '</option>';
                    }
                ?>
            </select>
        </p>
        <div>
            <div id="pool_cronograma"></div>
            <div id="placeholder_cronograma" class="ui placeholder">
                <div class="ui active dimmer">
                    <div class="ui text loader">Carregando</div>
                </div>
            </div>
        </div>
    </div>
    <div class="actions">
        <div class="ui cancel button">Fechar</div>
    </div>
</div>

<div id="inscreva_modal" class="ui tiny modal">
    <i class="close icon"></i>
    <div class="header fonte_titulo">Inscreva-se</div>
    <div class="content">
        <div class="ui styled fluid accordion">
            <div class="title fonte_texto">
                <i class="dropdown icon"></i>
                <i class="university icon"></i> Palestras e Minicursos
            </div>
            <div class="content">
                <p class="fonte_texto">
                    <ul class="ui list">
                        <li>Preencha os dados solicitados, como CPF, nome, telefone, e-mail e vínculo.</li>
                        <li>Para realizar a inscrição em algum MINICURSO, realize o seguinte procedimento:
                            <ol>
                                <li>No menu CARACTERIZAÇÃO, selecione MINICURSO.</li>
                                <li>No menu AÇÃO / EVENTO selecione o minicurso desejado.</li>
                                <li>OBS: todos os nossos minicursos tem o prefixo "IX SECCIM - MINICURSO:"</li>
                            </ol>
                        </li>
                        <li>Já para realizar a inscrição nas PALESTRAS:
                            <ol>
                                <li>no menu CARACTERIZAÇÃO selecione SEMANA ACADÊMICA.</li>
                                <li>no menu AÇÃO / EVENTO selecione "IX SECCIM - IX Semana Acadêmica de Ciência da Computação". Pronto! Você estará inscrito em todas as palestras disponíveis na nossa programação.</li>
                            </ol>
                        </li>
                    </ul>
                </p>
                <br/>
                <div class="ui three stackable column grid">
                    <div class="column coluna_inscricao_vazia"></div>
                    <div class="column coluna_inscricao_btn">
                        <a class="ui labeled icon button" href="http://graduacao.im.ufrrj.br/inscricoes/" target="_blank">
                            <i class="sign-in icon"></i>
                            Inscreva-se
                        </a>
                    </div>
                    <div class="column coluna_inscricao_vazia"></div>
                </div>
            </div>
            <div class="title fonte_texto">
                <i class="dropdown icon"></i>
                <i class="globe icon"></i> II Workshop Pyladies Rural (Todas as atividades do dia 09/10)
            </div>
            <div class="content">
                <div class="ui three stackable column grid">
                    <div class="column coluna_inscricao_vazia"></div>
                    <div class="column coluna_inscricao_btn">
                        <a class="ui labeled icon button" href="https://doity.com.br/ii-workshop-pyladies-rural" target="_blank">
                            <i class="sign-in icon"></i>
                            Inscreva-se
                        </a>
                    </div>
                    <div class="column coluna_inscricao_vazia"></div>
                </div>
            </div>
            <div class="title fonte_texto">
                <i class="dropdown icon"></i>
                <i class="laptop icon"></i> Maratona
            </div>
            <div class="content">
                <p class="fonte_texto">
                    A maratona será realizada no dia 11/10, no Instituto Multidisciplinar (IM) da UFRRJ em Nova Iguaçu, com um warm up de 11:00 a 12:00, com uma pausa para o almoço antes de seu início às 14:00.<br/>
                    As linguagens permitidas na maratona são C, C++ e Java, a prova terá 9 questões e duração de 3 horas (14:00 as 17:00) com um período de blind na última meia hora. Os participantes não poderão em hipotese alguma portar qualquer tipo de utensílio eletrônico durante a prova (exceto relógio, que não seja smart watch), porém poderão levar material escrito para consulta, tal como livros/apostila.
                </p>
                <div class="ui three stackable column grid">
                    <div class="column coluna_inscricao_vazia"></div>
                    <div class="column coluna_inscricao_btn">
                        <a class="ui labeled icon button" href="https://forms.gle/iCS4oYHNqmzWG3N56" target="_blank">
                            <i class="sign-in icon"></i>
                            Inscreva seu time!
                        </a>
                    </div>
                    <div class="column coluna_inscricao_vazia"></div>
                </div>
            </div>
            <div class="title fonte_texto">
                <i class="dropdown icon"></i>
                <i class="film icon"></i> CineComp
            </div>
            <div class="content">
                <p class="fonte_texto">
                    <ul class="ui list">
                        <li><b>Filme</b>: O Jogo da Imitação.</li>
                        <li><b>Local</b>: Auditório da Pós-Graduação.</li>
                        <li><b>Data e horário</b>: 11/10 às 14:00</li>
                    </ul>
                    <iframe class="youtube_iframe" src="https://www.youtube.com/embed/YIkKbMcJL_4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </p>
                <br/>
                <div class="ui three stackable column grid">
                    <div class="column coluna_inscricao_vazia"></div>
                    <div class="column coluna_inscricao_btn">
                        <a class="ui labeled icon button" href="https://doity.com.br/cinecomp-seccim" target="_blank">
                            <i class="sign-in icon"></i>
                            Inscreva-se
                        </a>
                    </div>
                    <div class="column coluna_inscricao_vazia"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="actions">
        <div class="ui cancel button">Fechar</div>
    </div>
</div>

<div id="pyladies_modal" class="ui tiny modal">
    <i class="close icon"></i>
    <div class="header">Pyladies Rural</div>
    <div class="content">
        <p>O II Workshop do PyLadies Rural é um evento satélite da SECCIM, realizado pelo grupo PyLadies Rural, com o intuito de promover um dia inteiro de atividades ministradas somente por mulheres da área da Computação de modo a inspirar e motivar outras meninas que estejam curiosas com a área ou começando, e até mesmo aquelas que já estão por aqui há algum tempo, o que também é o objetivo geral do grupo PyLadies Rural.<br/>O evento ocorrerá no dia 9 de outubro de 8h às 18h e sera aberto para todxs!<br/><br/>E fique atento: Todos os minicursos e palestras marcados com a logo do PyLadies Rural (<img align="middle" style="width: 30px; margin-top: -10px " src="img/colab/pyladies.png">) farão parte do workshop. Mais detalhes você encontra nas nossas redes sociais: @pyladiesrural no facebook e instagram.<br/><br/>Esperamos você lá!</p>
    </div>
    <div class="actions">
        <a class="ui facebook button" href="https://www.facebook.com/pyladiesrural" target="_new">
            <i class="facebook icon"></i>
            Facebook
        </a>
        <a class="ui instagram button" href="https://www.instagram.com/pyladiesrural/" target="_new">
            <i class="instagram icon"></i>
            Instagram
        </a>
        <div class="ui cancel button">Fechar</div>
    </div>
</div>

<div id="menu_vertical" class="ui right sidebar inverted vertical menu">
    <a class="fonte_titulo item inscreva_button">Inscreva-se</a>
    <a class="fonte_titulo item cronograma_button">Cronograma</a>
    <a class="fonte_titulo item" href="<?php echo $palestrantes_url; ?>">Palestrantes/Ministradores</a>
    <a class="fonte_titulo item" href="<?php echo $index_url; ?>#part_patrocinadores">Colaboradores</a>
    <a class="fonte_titulo item" href="<?php echo $organizadores_url; ?>">Organizadores</a>
    <a class="fonte_titulo item pyladies_button">Pyladies Rural</a>
</div>
