<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="comunica.label" /></title>
        <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
	</head>
	<body>
        <g:if test="${publicacion}">
            <div class="row">
                <div class="span8">
                    <h1>${publicacion.titulo}</h1>
                    <h3>Por ${publicacion.autor.nombreCompleto}</h3>
                    ${publicacion.contenido}
                </div>
                <div class="span4">
                    <g:each in="${publicaciones}" var="otro">
                        <h3><g:link mapping="comunica" params="[anio:otro.anio, trimestre:otro.trimestre, leccion:otro.leccion, tema:otro.tema]">${otro.titulo}</g:link></h3>
                        <h5>Por ${otro.autor.nombreCompleto}</h5>
                        ${otro.descripcion} <a href="${createLink(mapping: 'comunica', params: [anio:otro.anio, trimestre: otro.trimestre, leccion: otro.leccion, tema:otro.tema])}"><g:message code="leer.mas.label"/></a>
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
