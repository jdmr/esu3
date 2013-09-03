<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="buscar.label" /></title>
	</head>
	<body>
        <g:if test="${publicacion}">
            <div class="row">
                <div class="col-sm-8">
                    <div class="row-fluid">
                        <div class="col-sm-12">
                            <h1>${publicacion.titulo}</h1>
                            <h3>Por ${publicacion.autor.nombreCompleto}</h3>
                            ${publicacion.contenido}
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div id="comentarios" class="col-sm-12">
                            <!-- AddThis Button BEGIN -->
                            <div class="addthis_toolbox addthis_default_style ">
                                <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                                <a class="addthis_button_tweet"></a>
                                <a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
                                <a class="addthis_counter addthis_pill_style"></a>
                            </div>
                            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4d8a78014d97ad87"></script>
                            <!-- AddThis Button END -->
                            <div class="fb-comments" data-href="${urlString}" data-width="700" data-num-posts="10"></div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <g:each in="${publicaciones}" var="otro">
                        <h3><g:link mapping="dialoga" params="[anio:otro.anio, trimestre:otro.trimestre, leccion:otro.leccion, tema:otro.tema]">${otro.titulo}</g:link></h3>
                        <h5>Por ${otro.autor.nombreCompleto}</h5>
                        ${otro.descripcion} <a href="${createLink(mapping: 'dialoga', params: [anio:otro.anio, trimestre: otro.trimestre, leccion: otro.leccion, tema:otro.tema])}"><g:message code="leer.mas.label"/></a>
                    </g:each>
                    <g:if test="${leccion}">
                        <h3><g:link mapping="estudia" params="[anio:leccion.anio, trimestre:leccion.trimestre, leccion:leccion.leccion, dia:leccion.dia]">${leccion.titulo}</g:link></h3>
                        <h5><g:formatDate date="${hoy}" format="EEEE dd/MMM/yyyy" locale="es" /></h5>
                        ${leccion.descripcion} <a href="${createLink(mapping: 'estudia', params: [anio:leccion.anio, trimestre: leccion.trimestre, leccion: leccion.leccion, dia: leccion.dia])}"><g:message code="leer.mas.label"/></a>
                    </g:if>
                    <g:if test="${articulos}">
                        <h3><g:message code="articulos.de.autor" args="[publicacion.autor.nombreCompleto]" /></h3>
                        <ul>
                            <g:each in="${articulos}" var="articulo">
                                <li><g:link mapping="${articulo.tipo}" params="[anio: articulo.anio, trimestre: articulo.trimestre, leccion:articulo.leccion, tema:articulo.tema]">${articulo.titulo}</g:link></li>
                            </g:each>
                        </ul>
                    </g:if>
                </div>
            </div>
        </g:if>
	</body>
</html>
