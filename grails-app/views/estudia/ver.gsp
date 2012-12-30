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
                    <div class="row-fluid">
                        <div class="span12">
                            <blockquote>
                                <p>${versiculo.contenido}</p>
                            </blockquote>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span3"><g:link mapping="estudia" params="[anio:ayer.anio, trimestre:ayer.trimestre, leccion:ayer.leccion, dia:ayer.dia]"><i class="icon-chevron-left"></i> Anterior</g:link></div>
                        <div class="span6" style="text-align: center;"><g:formatDate date="${hoy}" format="EEEE dd/MM/yyyy" locale="es" /></div>
                        <div class="span3" style="text-align: right;"><g:link mapping="estudia" params="[anio:manana.anio, trimestre:manana.trimestre, leccion:manana.leccion, dia:manana.dia]">Siguiente <i class="icon-chevron-right"></i></g:link></div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <h1 style="text-align: center;">${publicacion.titulo}</h1>
                            ${publicacion.contenido}
                        </div>
                    </div>
                </div>
                <div class="span4">
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
	</body>
</html>
