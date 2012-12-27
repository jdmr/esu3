<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="home.label" /></title>
        <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
	</head>
	<body>
        <div class="row">
            <div class="span6">
                <g:if test="${video}">
                    <iframe src="${video.contenido}" width="100%" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
                </g:if>
            </div>
            <div class="span6">
                <g:if test="${leccion}">
                    <h2><g:link mapping="estudia" params="[anio:leccion.anio, trimestre:leccion.trimestre, leccion:leccion.leccion, dia:leccion.dia]">${leccion.titulo}</g:link></h2>
                    <p>${leccion.descripcion}</p>
                </g:if>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <g:each in="${dialoga}" var="publicacion">
                    <div class="row-fluid">
                        <div class="span12">
                            <h2><g:link mapping="dialoga" params="[anio:publicacion.anio, trimestre:publicacion.trimestre, leccion:publicacion.leccion, tema:publicacion.tema]">${publicacion.titulo}</g:link></h2>
                            <h4>Por ${publicacion.autor.nombreCompleto}</h4>
                            <p>${publicacion.descripcion}</p>
                        </div>
                    </div>
                </g:each>
            </div>
            <div class="span6">
                <g:each in="${comunica}" var="publicacion">
                    <div class="row-fluid">
                        <div class="span12">
                            <h2><g:link mapping="comunica" params="[anio:publicacion.anio, trimestre:publicacion.trimestre, leccion:publicacion.leccion, tema:publicacion.tema]">${publicacion.titulo}</g:link></h2>
                            <h4>Por ${publicacion.autor.nombreCompleto}</h4>
                            <p>${publicacion.descripcion}</p>
                        </div>
                    </div>
                </g:each>
            </div>
        </div>
	</body>
</html>
