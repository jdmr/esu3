<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="estudia.label" /></title>
        <r:require modules="bootstrap,bootstrap-responsive-css,modernizr,jquery-ui" />
        <meta property="fb:app_id" content="209484445730986">
        <meta property="fb:admins" content="jdmendozar@gmail.com"/>
        <meta property="og:title" content="Estudia"/>
        <meta property="og:type" content="article"/>
        <meta property="og:site_name" content="Escuela Sabática Universitaria"/>
        <meta property="og:image" content="http://escuelasabaticauniversitaria.org/images/logo.jpg">
	</head>
	<body>
    <div id="fb-root"></div>
        <script>(function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&appId=209484445730986";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
        <g:if test="${publicacion}">
            <div class="row">
                <div class="span8">
                    <div class="row-fluid">
                        <div class="span12">
                            <blockquote>
                                <p>${versiculo.contenido}</p>
                            </blockquote>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span3"><g:link mapping="estudia" params="[anio:ayer.anio, trimestre:ayer.trimestre, leccion:ayer.leccion, dia:ayer.dia]"><i class="icon-chevron-left"></i> Anterior</g:link></div>
                        <div class="span6" style="text-align: center;"><g:formatDate date="${hoy}" format="EEEE dd/MMM/yyyy" locale="es" /></div>
                        <div class="span3" style="text-align: right;"><g:link mapping="estudia" params="[anio:manana.anio, trimestre:manana.trimestre, leccion:manana.leccion, dia:manana.dia]">Siguiente <i class="icon-chevron-right"></i></g:link></div>
                    </div>
                    <div class="row-fluid leccion">
                        <div class="span12">
                            <h1 style="text-align: center;">${publicacion.titulo}</h1>
                            ${publicacion.contenido}
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div id="comentarios" class="span12">
                            <div class="fb-comments" data-href="${urlString}#comentarios" data-width="500" data-num-posts="10"></div>
                        </div>
                    </div>
                </div>
                <div class="span4">
                    <form id="navegaForm" name="navegaForm" action="${createLink(action: 'buscaFecha')}" method="post">
                        <input type="hidden" name="fechaNavegaTxt" id="fechaNavegaTxt" />
                        <div id="fechaNavega"></div>
                    </form>
                    <div id="contenidoVersiculo"></div>
                    <g:each in="${dialoga}" var="otro">
                        <h3><g:link mapping="dialoga" params="[anio:otro.anio, trimestre:otro.trimestre, leccion:otro.leccion, tema:otro.tema]">${otro.titulo}</g:link></h3>
                        <h5>Por ${otro.autor.nombreCompleto}</h5>
                        ${otro.descripcion}
                    </g:each>
                    <g:each in="${comunica}" var="otro">
                        <h3><g:link mapping="comunica" params="[anio:otro.anio, trimestre:otro.trimestre, leccion:otro.leccion, tema:otro.tema]">${otro.titulo}</g:link></h3>
                        <h5>Por ${otro.autor.nombreCompleto}</h5>
                        ${otro.descripcion}
                    </g:each>
                </div>
            </div>
        </g:if>
        <r:script>
            $(function() {

                $('div#fechaNavega').datepicker({
                    altField:"input#fechaNavegaTxt",
                    altFormat:"dd/mm/yy",
                    dateFormat:"dd/mm/yy",
                    defaultDate:"<g:formatDate date="${hoy}" format="dd/MM/yyyy" />",
                    firstDay: 0,
                    showOtherMonths: true,
                    selectOtherMonths: true,
                    minDate: "26/03/2011",
                    onSelect:function(dateText, inst) {
                        $("form#navegaForm").submit();
                    }
                });

                $('.leccion a').click(function(e){
                    e.preventDefault();

                    var link = $(this).attr('href');

                    $.ajax({
                        url: link
                        , dataType: 'json'
                        , success: function(data) {
                            $('div#contenidoVersiculo').slideUp(function() {
                                var contenido = buscaContenidoVersiculo(data);
                                $('div#contenidoVersiculo').html(contenido).slideDown();
                            });
                        }
                    });

                });

                $(document).on("click", 'a.anterior', function(e){
                    e.preventDefault();

                    var link = $(this).attr('href');

                    $.ajax({
                        url: link
                        , dataType: 'json'
                        , success: function(data) {
                            $('div#contenidoVersiculo').hide("slide",{direction:"right"}, function() {
                                var contenido = buscaContenidoVersiculo(data);
                                $('div#contenidoVersiculo').html(contenido).show("slide",{direction:'left'});
                            });
                        }
                    });

                });

                $(document).on("click", 'a.siguiente', function(e){
                    e.preventDefault();

                    var link = $(this).attr('href');

                    $.ajax({
                        url: link
                        , dataType: 'json'
                        , success: function(data) {
                            $('div#contenidoVersiculo').hide("slide",{direction:"left"}, function() {
                                var contenido = buscaContenidoVersiculo(data);
                                $('div#contenidoVersiculo').html(contenido).show("slide",{direction:'right'});
                            });
                        }
                    });

                });

                console.log("Cambiando ancho de iframe");
                container_width = $('#comentarios').width();
                console.log("width:"+container_width);
                $('iframe').each(function() {
                    console.log('iframe: '+$(this).attr('id'))
                    fb_style = $(this).attr('style').replace(/width:\s*\d+px/i, 'width: ' + container_width + 'px');
                    $(this).attr('style', fb_style);
                });
                console.log("listo! ahora debe ser de "+container_width);

            });

            function buscaContenidoVersiculo(data) {
                var items = [];
                var bandera = true;
                var versiculo = 0;
                var idInicio = 0;
                var idFinal = 0;
                $.each(data, function(i, item) {
                    if (bandera) {
                        items.push('<h3>'+item.nombre+' '+item.capitulo+':'+item.versiculo+'</h3>');
                        bandera = false;
                        idInicio = item.id;
                    }

                    if (item.versiculo < versiculo) {
                        items.push('<h3>'+item.nombre+' '+item.capitulo+'</h3>')
                    }
                    versiculo = item.versiculo;

                    items.push('<p><strong>'+item.versiculo+'</strong> '+item.texto+'</p>');
                    idFinal = item.id;

                });
                if (idInicio != idFinal) {
                    items.push('<p><a class="anterior" href="'
                        +'${createLink(controller:"biblia", action:"vers")}'
                        +'/'+(idInicio-5)+'"><i class="icon-chevron-left"></i> Anterior</a>'
                        +'<span class="pull-right"><a class="siguiente" href="'
                        +'${createLink(controller:"biblia", action:"vers")}'
                        +'/'+(idFinal+1)+'">Siguiente <i class="icon-chevron-right"></i></a></span></p>')
                }
                return items.join('');
            }
        </r:script>
	</body>
</html>
