<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="dialoga.label" /></title>
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
                    <g:if test="${articulos}">
                        <h3><g:message code="articulos.de.autor" args="[publicacion.autor.nombreCompleto]" /></h3>
                        <ul>
                            <g:each in="${articulos}" var="articulo">
                                <li><g:link mapping="dialoga" params="[anio: articulo.anio, trimestre: articulo.trimestre, leccion:articulo.leccion, tema:articulo.tema]">${articulo.titulo}</g:link></li>
                            </g:each>
                        </ul>
                    </g:if>
                </div>
            </div>
        </g:if>
	</body>
</html>
