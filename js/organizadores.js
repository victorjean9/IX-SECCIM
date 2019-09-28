$(document).on("scroll",function(){
    arrumaTitulo();
});

$(document).ready(function(){
    arrumaTitulo();
});

function arrumaTitulo() {
    var espacoTitulo = $("#titulo_imagem").height();
    $("#titulo_spacing").height(espacoTitulo + 240);
}
