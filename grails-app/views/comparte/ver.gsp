<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
        <g:if test="${publicacion}">
            <title>${raw(publicacion.titulo)}</title>
        </g:if>
        <g:else>
            <title><g:message code="comunica.label" /></title>
        </g:else>
	</head>
	<body>
        <g:if test="${publicacion}">
            <div class="row">
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1>${raw(publicacion.titulo)}</h1>
                            <h3>Por ${publicacion.autor.nombreCompleto}</h3>
                            ${raw(publicacion.contenido)}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            ${publicacion.vistas} Visitas
                        </div>
                    </div>
                    <div class="row">
                        <div id="comentarios" class="col-sm-12">
                            <!-- AddThis Button BEGIN -->
                            <div class="addthis_toolbox addthis_default_style ">
                                <a class="addthis_button_facebook_like" fb:like:layout="button_count" fb:like:width="115"></a>
                                <a class="addthis_button_tweet"></a>
                                <a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
                                <a class="addthis_button_pinterest_pinit"></a>
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
                            <a href="http://disqus.com" class="dsq-brlink">comments powered by <col-sm- class="logo-disqus">Disqus</col-sm-></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <g:each in="${publicaciones}" var="otro">
                        <h3><g:link mapping="comunica" params="[anio:otro.anio, trimestre:otro.trimestre, leccion:otro.leccion, tema:otro.tema]">${raw(otro.titulo)}</g:link></h3>
                        <h5>Por ${otro.autor.nombreCompleto}</h5>
                        ${raw(otro.descripcion)} <a href="${createLink(mapping: 'comunica', params: [anio:otro.anio, trimestre: otro.trimestre, leccion: otro.leccion, tema:otro.tema])}"><g:message code="leer.mas.label"/></a>
                    </g:each>
                    <g:if test="${leccion}">
                        <h3><g:link mapping="estudia" params="[anio:leccion.anio, trimestre:leccion.trimestre, leccion:leccion.leccion, dia:leccion.dia]">${leccion.titulo}</g:link></h3>
                        <h5><g:formatDate date="${hoy}" format="EEEE dd/MMM/yyyy" locale="es" /></h5>
                        ${raw(leccion.descripcion)} <a href="${createLink(mapping: 'estudia', params: [anio:leccion.anio, trimestre: leccion.trimestre, leccion: leccion.leccion, dia: leccion.dia])}"><g:message code="leer.mas.label"/></a>
                    </g:if>
                    <g:if test="${articulos}">
                        <h3><g:message code="articulos.de.autor" args="[publicacion.autor.nombreCompleto]" /></h3>
                        <ul>
                            <g:each in="${articulos}" var="articulo">
                                <li><g:link mapping="${articulo.tipo}" params="[anio: articulo.anio, trimestre: articulo.trimestre, leccion:articulo.leccion, tema:articulo.tema]">${raw(articulo.titulo)}</g:link></li>
                            </g:each>
                        </ul>
                    </g:if>
                    <g:each in="${dialoga}" var="otro">
                        <h3><g:link mapping="dialoga" params="[anio:otro.anio, trimestre:otro.trimestre, leccion:otro.leccion, tema:otro.tema]">${raw(otro.titulo)}</g:link></h3>
                        <h5>Por ${otro.autor.nombreCompleto}</h5>
                        ${raw(otro.descripcion)} <a href="${createLink(mapping: 'dialoga', params: [anio:otro.anio, trimestre: otro.trimestre, leccion: otro.leccion, tema:otro.tema])}"><g:message code="leer.mas.label"/></a>
                    </g:each>
                </div>
            </div>
        </g:if>
	</body>
</html>
