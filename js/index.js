$(document).on("scroll",function(){
    if($(document).scrollTop() <= $("#background_fading").height()){
        var scrollPosition = $(document).scrollTop();
        var windowPosition = $("#background_fading").height();
        var porcentagemAlpha = ((scrollPosition*100)/windowPosition)/100;

        var porcentagemOpacity = 1 - porcentagemAlpha;
        if(porcentagemOpacity >= 0.1){
            $("#div_slider").css({'opacity':porcentagemOpacity, 'z-index':'0'});
        } else {
            $("#div_slider").css({'opacity':'0.1', 'z-index':'-1'});
        }

        var porcentagemBotoesOpacity = porcentagemAlpha * 2.5;

        if(porcentagemBotoesOpacity <= 0.8){
            if(porcentagemBotoesOpacity == 0){
                $("#botoes_publicacoes_div").hide();
            } else {
                $("#botoes_publicacoes_div").show();
                $("#botoes_publicacoes_div").css({'opacity':porcentagemBotoesOpacity});
            }
        } else {
            $("#botoes_publicacoes_div").show();
            $("#botoes_publicacoes_div").css({'opacity':'1'});
        }

    } else {
        $("#botoes_publicacoes_div").show();
        $("#botoes_publicacoes_div").css({'opacity':'1'});
        $("#div_slider").css({'opacity':'0.1', 'z-index':'-1'});
    }
});

$(document).ready(function(){
    arrumaIndex();
    $.ajax({
        url: "includes/carregar_palestra_minicurso.php",
        dataType: "JSON",
        success: function(res){
            $(".bloco_carregando").remove();
            var aux = 0;
            while (aux < res.length) {
                var tipo = "palestra";
                var tipo_html = '<i class="bullhorn icon"></i> PALESTRA';
                if (res[aux].tipo == 0) {
                    tipo = "minicurso";
                    tipo_html = '<i class="graduation cap icon"></i> MINICURSO';
                }

                var auxPalestrantes = 0;
                var tagPalestrantes = '';
                var isUm = true;
                if(res[aux].palestrantes.length > 1){
                    isUm = false;
                }

                while(auxPalestrantes < res[aux].palestrantes.length){
                    var palestrante = res[aux].palestrantes[auxPalestrantes];
                    var nomeArray = palestrante.nome.split(' ');

                    var nomePalestrante = nomeArray[0];
                    var nomePalestranteClasse = nomeArray[0];
                    if(isUm){
                        nomePalestrante += " " + nomeArray[1];
                    }

                    tagPalestrantes += `<a class="ui image label to_right" href="`+ urlPalestraMinicurso + res[aux].url +`#`+ nomePalestranteClasse +`">
                                                <img src="img/palestrantes/`+ palestrante.foto +`">
                                                `+ nomePalestrante +`
                                            </a>`;
                    auxPalestrantes++;
                }
                var fotoColab = ``;
                if (res[aux].colab != null) {
                    fotoColab = `<img data-content="II Workshop PyLadies Rural" class="icon_colab" src="img/colab/`+ res[aux].img_colab +`">`;
                }
                var conteudo = `
                    <div class="column `+ tipo +`">
                        <div class="coluna_a">
                            <a href="`+ urlPalestraMinicurso + res[aux].url +`">
                                <div class="foto_bloco" style="background-image : url(img/capa-600/`+ res[aux].foto +`);">`+ fotoColab +`</div>
                                <div class="tipo_bloco">
                                    ` + tipo_html + `
                                </div>
                                <div>
                                    <h3 class="ui header fonte_titulo titulo_bloco">`+ res[aux].titulo +`</h3>
                                    <p style="color : gray; font-size: 15;" class="fonte_texto">`+ res[aux].resumo +` <span style="color:black;">Continue Lendo...</span></p>
                                    <div class="ui divider"></div>
                                    <div>
                                        <div class="ui label fonte_titulo to_left">
                                          <i class="clock icon"></i> `+ res[aux].data +` às `+ res[aux].hora +`
                                        </div>
                                        `+tagPalestrantes+`
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>`;

                $("#pool_palestras_minicursos").append(conteudo);
                if(!window.matchMedia("(any-pointer: coarse)").matches) {
                    $('.icon_colab').popup({
                        inline: true,
                        position: 'bottom left'
                    });
                }
                aux++;
            }
        }
    });
    $('.slider_cronograma').click(function(){
        $('#cronograma_modal').modal('show');
    });

    $(".slider-container").ikSlider({
      speed: 500
    });
    $(".slider-container").on('changeSlide.ikSlider', function (evt) {
         console.log(evt.currentSlide);
     });

     $("#btn_sub_menu_todos").click(function(){
         $(this).removeClass("active");
         $("#btn_sub_menu_palestra").removeClass("active");
         $("#btn_sub_menu_minicurso").removeClass("active");
         $(this).addClass("active");

         $(".palestra").fadeIn();
         $(".minicurso").fadeIn();
     });
     $("#btn_sub_menu_palestra").click(function(){
         $(this).removeClass("active");
         $("#btn_sub_menu_todos").removeClass("active");
         $("#btn_sub_menu_minicurso").removeClass("active");
         $(this).addClass("active");

         $(".minicurso").fadeOut("fast", function(){
             $(".palestra").fadeIn();
         });
     });
     $("#btn_sub_menu_minicurso").click(function(){
         $(this).removeClass("active");
         $("#btn_sub_menu_palestra").removeClass("active");
         $("#btn_sub_menu_todos").removeClass("active");
         $(this).addClass("active");

         $(".palestra").fadeOut("fast", function(){
             $(".minicurso").fadeIn();
         });
     });
});

$(window).resize(function(){
    arrumaIndex();
});

function arrumaIndex(){
    var docWidth = $(window).width();
    //alert(docWidth);
	if((docWidth >= 750) && (docWidth <= 1200)){
        $("#pool_palestras_minicursos").removeClass("ui stackable three column grid");
        $("#pool_palestras_minicursos").removeClass("ui stackable two column grid");
        $("#pool_palestras_minicursos").addClass("ui stackable two column grid");
    } else {
        $("#pool_palestras_minicursos").removeClass("ui stackable three column grid");
        $("#pool_palestras_minicursos").removeClass("ui stackable two column grid");
        $("#pool_palestras_minicursos").addClass("ui stackable three column grid");
    }
}
