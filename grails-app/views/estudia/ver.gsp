<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
        <g:if test="${publicacion}">
            <title>${publicacion.titulo}</title>
        </g:if>
        <g:else>
            <title><g:message code="estudia.label" /></title>
        </g:else>
        <r:require modules="jquery-ui" />
	</head>
	<body>
            <div class="row">
                <div class="span8">
                    <g:if test="${publicacion}">
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
                            <div class="span12">
                                ${publicacion.vistas} Visitas
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div id="comentarios" class="span12">
                                <!-- AddThis Button BEGIN -->
                                <div class="addthis_toolbox addthis_default_style ">
                                    <a class="addthis_button_facebook_like" fb:like:layout="button_count" fb:like:width="115"></a>
                                    <a class="addthis_button_tweet"></a>
                                    <a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
                                    <a class="addthis_counter addthis_pill_style"></a>
                                </div>
                                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4d8a78014d97ad87"></script>
                                <!-- AddThis Button END -->
                                <div id="disqus_thread"></div>
                                <script type="text/javascript">
                                    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                                    var disqus_shortname = 'esuniversitaria'; // required: replace example with your forum shortname
                                    var disqus_identifier = '${publicacion.id}';
                                    var disqus_title = '${publicacion.titulo}';

                                    /* * * DON'T EDIT BELOW THIS LINE * * */
                                    (function() {
                                        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                                        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                                        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                                    })();
                                </script>
                                <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                                <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
                            </div>
                        </div>
                    </g:if>
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
                        ${otro.descripcion} <a href="${createLink(mapping: 'dialoga', params: [anio:otro.anio, trimestre: otro.trimestre, leccion: otro.leccion, tema:otro.tema])}"><g:message code="leer.mas.label"/></a>
                    </g:each>
                    <g:each in="${comunica}" var="otro">
                        <h3><g:link mapping="comunica" params="[anio:otro.anio, trimestre:otro.trimestre, leccion:otro.leccion, tema:otro.tema]">${otro.titulo}</g:link></h3>
                        <h5>Por ${otro.autor.nombreCompleto}</h5>
                        ${otro.descripcion} <a href="${createLink(mapping: 'comunica', params: [anio:otro.anio, trimestre: otro.trimestre, leccion: otro.leccion, tema:otro.tema])}"><g:message code="leer.mas.label"/></a>
                    </g:each>
                </div>
            </div>
        <r:script>
            $(function() {

                $('div#fechaNavega').datepicker({
                    altField:"input#fechaNavegaTxt",
                    altFormat:"dd/mm/yy",
                    dateFormat:"dd/mm/yy",
                    defaultDate:"<g:formatDate date="${hoy}" format="dd/MM/yyyy" />",
                    firstDay: 0,
                    closeText: 'Cerrar',
                    prevText: '&#x3c;Ant',
                    nextText: 'Sig&#x3e;',
                    currentText: 'Hoy',
                    monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
                    'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                    monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
                    'Jul','Ago','Sep','Oct','Nov','Dic'],
                    dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
                    dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
                    dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
                    weekHeader: 'Sm',
                    showButtonPanel: true,
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
