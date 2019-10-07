$(document).on("scroll",function(){
    if($(document).scrollTop() > ($("#background_fading").height()/peso)){ //QUANDO O SCROLL PASSAR DOS 100px DO TOPO
        $(".nome_menu").removeClass("nome_menu_grande").addClass("nome_menu_pequeno"); //TROCA P CLASSE MENOR
        $(".btn_menu").removeClass("btn_menu_grande").addClass("btn_menu_pequeno"); //TROCA P CLASSE MENOR
        $("#menu_principal").removeClass("menu_principal_desceu").addClass("menu_principal_desceu");
        $("#menu_principal img").css({"height":"55px"});

    } else{
        $(".nome_menu").removeClass("nome_menu_pequeno").addClass("nome_menu_grande"); //TROCA P CLASSE MENOR
        $(".btn_menu").removeClass("btn_menu_pequeno").addClass("btn_menu_grande");
        $("#menu_principal").removeClass("menu_principal_desceu");
        $("#menu_principal img").css({"height":"100px"});
    }
});

$(document).ready(function(){
    $('.ui.accordion').accordion({
        onOpen: function(){
            $('#inscreva_modal').modal('refresh');
        }
    });

    $('.inscreva_button').click(function(){

        $('#inscreva_modal').modal('show');

    });
    $('.pyladies_button').click(function(){

        $('#pyladies_modal').modal('show');

    });

    var abreSelectUmaVez = 0;
    $('.cronograma_button').click(function(){
        $('#cronograma_modal').modal({
            onVisible:function(){
                if(abreSelectUmaVez == 0){
                    CarregaCronograma("");
                    abreSelectUmaVez++;
                }
            }
        }).modal('show');
    });

    $('#menu_hamburguer').click(function(){
        $('#pusher_index').addClass("pusher");
        $("#menu_vertical").sidebar({
            'onVisible': function(){
                $('body').addClass("pushable");
            },
            'onHidden': function(){
                $('body').removeClass("pushable");
                $('#pusher_index').removeClass("pusher");
            }
        }).sidebar('setting', 'transition', 'overlay').sidebar('toggle');
    });
    if(!window.matchMedia("(any-pointer: coarse)").matches) {
        $('.icon_colab').popup({
            inline: true,
            position: 'bottom left'
        });
    }

    $("#select_cronograma").change(function(){
        var dia_selecionado = $(this).val();
        CarregaCronograma(dia_selecionado);
    });
});

function CarregaCronograma(dia){
    $("#pool_cronograma").empty();
    $("#placeholder_cronograma").show();
    $.ajax({
        url: "includes/carrega_cronograma.php",
        method: 'POST',
        data: "&dia=" + dia,
        dataType: "JSON",
        success: function(res){
            var aux = 0;
            while (aux < res.length) {
                var data = res[aux].data;
                var horaInicio = res[aux].hora_inicio;
                var horaFinal = res[aux].hora_final;
                var cor = res[aux].cor;
                var icone = res[aux].icone;
                var nome = res[aux].nome;
                var local = res[aux].local;
                var url = res[aux].url;
                var tipo = res[aux].tipo;

                var localHtml = '';
                if(local != ""){
                    localHtml = 'data-content="Local: ' + local + '"';
                }

                var urlHtml = '';
                if(url != ""){
                    urlHtml = 'href="' + url + '"';
                }

                var detalheHtml = '';
                if(tipo == 1){
                    detalheHtml = '(Palestra) ';
                } else if (tipo == 2){
                    detalheHtml = '(Minicurso) ';
                }

                var html = `
                    <a class="ui right pointing basic label">` + horaInicio + ` - ` + horaFinal + `</a>
                    <a `+ urlHtml +` class="ui ` + cor + ` label bloco_cronograma" data-title="Das ` + horaInicio + ` às ` + horaFinal + `" `+localHtml+`>
                        <i class="` + icone + ` icon"></i>
                        ` + detalheHtml + nome + `
                    </a><br/>

                `;

                $("#pool_cronograma").append(html);
                $("#placeholder_cronograma").slideUp();
                $('#cronograma_modal').modal('refresh');
                aux++;
            }
            $('.bloco_cronograma').popup({
                 inline: true
            });

            if(window.matchMedia("(any-pointer: coarse)").matches) { //se touch
                $('.bloco_cronograma').popup({
                    on: 'click',
                    inline: true
                });
            } else {
                $('.bloco_cronograma').popup({
                     inline: true
                });
            }
        }
    });
}
