<?php include "includes/conexao.inc"; ?>
<html>
    <head>
        <script type="text/javascript"> var peso = 3; </script>
        <?php include "includes/header.inc"; ?>
        <style type="text/css">
            #background_fading {
                background-image : url(img/error.jpg);
                background-position: center;
                background-color : black;
                background-size: cover;
                background-repeat: no-repeat;
                height : calc(100% - 39px);
                width : 100%;
            }
        </style>
        <title>Error - IX SECCIM</title>
    </head>
    <body>
        <?php include "includes/menu.inc"; ?>
        <div id="background_fading"></div>
        <?php include "includes/footer.inc" ?>
    </body>

</html>
<?php $mysqli->close(); ?>
