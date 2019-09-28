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
    var modalNaoBasica = true;

    var isChromium = window.chrome;
    var winNav = window.navigator;
    var vendorName = winNav.vendor;
    var isOpera = typeof window.opr !== "undefined";
    var isIEedge = winNav.userAgent.indexOf("Edge") > -1;
    var isIOSChrome = winNav.userAgent.match("CriOS");

    if (isIOSChrome) {
        modalNaoBasica = true;
    } else if(
        isChromium !== null &&
        typeof isChromium !== "undefined" &&
        vendorName === "Google Inc." &&
        isOpera === false &&
        isIEedge === false
    ) {
        modalNaoBasica = true;
    } else {
        modalNaoBasica = false;
    }

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

    $('.cronograma_button').click(function(){
        if(window.matchMedia("(any-pointer: coarse)").matches) { //se touch
            if(!modalNaoBasica){
                $("#cronograma_modal").addClass("basic");
                $("#cronograma_modal_content").removeClass("scrolling");
            }

            $('#cronograma_modal').modal({
                onVisible:function(){
                    $('.bloco_cronograma').popup({
                        on: 'click',
                        inline: true
                    });
                }
            }).modal('show');
        } else {
            $('#cronograma_modal').modal({
                onVisible:function(){
                    $('.bloco_cronograma').popup({
                         inline: true
                    });
                }
            }).modal('show');
        }


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
});
