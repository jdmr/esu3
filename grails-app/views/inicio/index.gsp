<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="home.label" /></title>
	</head>
	<body>
        <div class="row">
            <div class="span6">
                <g:if test="${video}">
                    <iframe src="${video.contenido}" width="100%" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
                </g:if>
                <g:else>
                    <img src="${resource(dir: "images", file: "home3.jpg")}" alt="EscuelaSabaticaUniversitaria.ORG" />
                </g:else>
            </div>
            <div class="span6">
                <g:if test="${leccion}">
                    <h2><g:link mapping="estudia" params="[anio:leccion.anio, trimestre:leccion.trimestre, leccion:leccion.leccion, dia:leccion.dia]">${leccion.titulo}</g:link></h2>
                    <h4><g:formatDate date="${hoy}" format="EEEE dd/MMM/yyyy" locale="es" /></h4>
                    <p>${leccion.descripcion}</p>
                    <p><a href="${createLink(mapping: 'estudia', params: [anio:leccion.anio, trimestre: leccion.trimestre, leccion: leccion.leccion, dia: leccion.dia])}" class="btn btn-primary btn-large"><g:message code="estudia.label"/></a></p>
                </g:if>
            </div>
        </div>
        <g:if test="${versiculo}">
            <div class="row">
                <div class="span12 well versiculo" style="margin-bottom: 0px;margin-top: 10px;">
                    ${versiculo.contenido}
                </div>
            </div>
        </g:if>
        <div class="row">
            <div class="span6">
                <g:each in="${dialoga}" var="publicacion">
                    <h2><g:link mapping="dialoga" params="[anio:publicacion.anio, trimestre:publicacion.trimestre, leccion:publicacion.leccion, tema:publicacion.tema]">${publicacion.titulo}</g:link></h2>
                    <h4>Por ${publicacion.autor.nombreCompleto}</h4>
                    <p>${publicacion.descripcion} <a href="${createLink(mapping: 'dialoga', params: [anio:publicacion.anio, trimestre: publicacion.trimestre, leccion: publicacion.leccion, tema:publicacion.tema])}"><g:message code="leer.mas.label"/></a></p>
                </g:each>
            </div>
            <div class="span6">
                <g:each in="${comunica}" var="publicacion">
                    <h2><g:link mapping="comunica" params="[anio:publicacion.anio, trimestre:publicacion.trimestre, leccion:publicacion.leccion, tema:publicacion.tema]">${publicacion.titulo}</g:link></h2>
                    <h4>Por ${publicacion.autor.nombreCompleto}</h4>
                    <p>${publicacion.descripcion} <a href="${createLink(mapping: 'comunica', params: [anio:publicacion.anio, trimestre: publicacion.trimestre, leccion: publicacion.leccion, tema:publicacion.tema])}"><g:message code="leer.mas.label"/></a></p>
                </g:each>
            </div>
        </div>
	</body>
</html>
