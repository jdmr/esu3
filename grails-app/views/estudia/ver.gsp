<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="estudia.label" /></title>
        <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
	</head>
	<body>
        <g:if test="${publicacion}">
            <div class="row">
                <div class="span8">
                    <blockquote>
                        <p>${versiculo.contenido}</p>
                    </blockquote>
                </div>
            </div>
            <div class="row">
                <div class="span8">
                    <h1>${publicacion.titulo}</h1>
                    ${publicacion.contenido}
                </div>
                <div class="span4">
                </div>
            </div>
        </g:if>
	</body>
</html>
