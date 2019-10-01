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

<div id="cronograma_modal" class="ui large modal">
    <i class="close icon"></i>
    <div class="header">Cronograma</div>
    <div id="cronograma_modal_content" class="scrolling content">
        <p>Clique nos blocos para ver a duração e o local dos eventos.</p>
        <table class="ui celled table unstackable">
            <thead>
                <tr>
                    <th>Horários</th>
                    <th>Segunda - 07/10</th>
                    <th>Terça - 08/10</th>
                    <th>Quarta - 09/10</th>
                    <th>Quinta - 10/10</th>
                    <th>Sexta - 11/10</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    function carrega_dia($hora){
                        include "conexao.inc";
                        include "links.php";
                        $sql = "SELECT id, data, hora_inicio, hora_final, id_evento, nome FROM cronograma WHERE hora_inicio='". $hora ."' ORDER BY ordem;";
                        $query = $mysqli->query($sql);
                        $linha_cronograma = "<tr>";
                        $linha_cronograma .= "<td>". $hora ."</td>";
                        $ultima_data = "06/10";

                        while ($dados = $query->fetch_assoc()) {
                            if($dados['data'] == "*"){
                                $auxEtc = 0;
                                while ($auxEtc < 5) {
                                    $icone_bloco = 'coffee';
                                    $cor_bloco = 'brown';
                                    if ($dados['nome'] == 'Almoço') {
                                        $icone_bloco = 'utensils';
                                        $cor_bloco = 'red';
                                    } else if ($dados['nome'] == 'Encerramento') {
                                        $icone_bloco = 'power off';
                                        $cor_bloco = 'black';
                                    }

                                    $nome = '<a class="ui '.$cor_bloco.' label bloco_cronograma" data-title="Das '.$dados['hora_inicio'].' às '.$dados['hora_final'].'"><i class="'.$icone_bloco.' icon"></i>';
                                    $nome .= $dados['nome'];
                                    $nome .= '</a>';

                                    if (($dados['nome'] == 'Almoço') && ($auxEtc == 2)) {
                                        $nome = "";
                                    }

                                    $linha_cronograma .= "<td>". $nome;
                                    if($auxEtc != 4){
                                        $linha_cronograma .= "</td>";
                                    }

                                    $auxEtc++;
                                }
                            } else {
                                if($ultima_data != $dados['data']){
                                    $agora_data = $dados['data'];
                                    $seria_data = $ultima_data;
                                    $dia_agora = $agora_data[0].$agora_data[1];
                                    $dia_seria = $seria_data[0].$seria_data[1];

                                    $resultado = $dia_agora - $dia_seria;

                                    while($resultado > 1){
                                        $linha_cronograma .= "<td></td>";

                                        $resultado--;
                                    }
                                }

                                $icone_bloco = 'bullhorn';
                                $cor_bloco = 'blue';
                                $nome_val = $dados['nome'];
                                $url_bloco = '';
                                $data_content = '';
                                if ($dados['id_evento'] != 0) {
                                    $sql2 = "SELECT titulo, tipo, url FROM minicurso_palestra WHERE id='". $dados['id_evento'] ."';";
                                    $query2 = $mysqli->query($sql2);
                                    $dados_minicurso_palestra = $query2->fetch_assoc();
                                    $nome_val = $dados_minicurso_palestra['titulo'];

                                    $url_bloco = ' href="'.$palestra_minicurso.$dados_minicurso_palestra['url'].'"';

                                    if($dados_minicurso_palestra['tipo'] == 0){
                                        $icone_bloco = 'graduation cap';
                                        $cor_bloco = 'green';
                                    }

                                    $data_content = ' data-content="Local: Auditório Professor Bruno Rodrigues de Almeida, IM-UFRRJ"';
                                    if($dados_minicurso_palestra['tipo'] == 0) {
                                        $data_content = ' data-content="Local: 3ºAndar, sala 309 - Bloco Informática, IM-UFRRJ"';
                                    }
                                } else {
                                    $icone_bloco = 'star';
                                    $cor_bloco = 'orange';
                                    if ($dados['nome'] == 'Almoço') {
                                        $icone_bloco = 'utensils';
                                        $cor_bloco = 'red';
                                    }

                                    if ($dados['id'] == 36) {
                                        $icone_bloco = 'film';
                                        $cor_bloco = 'purple';
                                    }

                                    if (($dados['id'] >= 24) && ($dados['id'] <= 27)){
                                        $icone_bloco = 'laptop';
                                        $cor_bloco = 'teal';
                                    }
                                }

                                $nome = '<a'.$url_bloco.' class="ui '.$cor_bloco.' label bloco_cronograma" data-title="Das '.$dados['hora_inicio'].' às '.$dados['hora_final'].'"'.$data_content.'><i class="'.$icone_bloco.' icon"></i>';
                                $nome .= $nome_val;
                                $nome .= '</a>';
                                if ($dados['data'] == $ultima_data) {
                                    $linha_cronograma .= "<br/><br/>". $nome ."";
                                } else if ($ultima_data == "") {
                                    $linha_cronograma .= "<td>". $nome ."";
                                } else {
                                    $linha_cronograma .= "</td><td>". $nome ."";
                                }
                                $ultima_data = $dados['data'];
                            }
                        }
                        $linha_cronograma .= "</td></tr>";
                        echo $linha_cronograma;
                        $mysqli->close();
                    }
                    carrega_dia("08:00");
                    carrega_dia("09:30");
                    carrega_dia("09:50");
                    carrega_dia("10:00");
                    carrega_dia("10:50");
                    carrega_dia("11:00");
                    carrega_dia("11:40");
                    carrega_dia("12:00");
                    carrega_dia("12:30");
                    carrega_dia("13:40");
                    carrega_dia("14:00");
                    carrega_dia("14:30");
                    carrega_dia("15:10");
                    carrega_dia("15:20");
                    carrega_dia("16:10");
                    carrega_dia("16:25");
                    carrega_dia("17:30");

                ?>
            </tbody>
        </table>
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
                <p>
                    <ul class="ui list">
                        <li>Em breve...</li>
                    </ul>
                </p>
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
