<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="conocenos.label" /></title>
	</head>
	<body>
        <div class="row">
            <div class="span3">
                <div class="well" style="padding: 8px 0;">
                    <ul class="nav nav-list">
                        <li class="nav-header">Conócenos</li>
                        <li><a href="${createLink(controller:'conocenos')}">Acerca de Nosotros</a></li>
                        <li class="active"><a href="${createLink(action:'equipo')}">Equipo</a></li>
                        <li><a href="${createLink(action:'contacto')}">Contacto</a></li>
                    </ul>
                </div>
            </div>
            <div class="span9">
                <h1>Equipo</h1>
                <g:each in="${perfiles}" var="perfil">
                    <hr/>
                    <div class="row-fluid">
                        <div class="span3">${perfil.usuario.nombreCompleto}<br/>${perfil.usuario.username}</div>
                        <div class="span9">
                            <g:if test="${perfil.texto}">
                                <p>${perfil.texto}</p>
                            </g:if>
                            <g:if test="${perfil.articulos}">
                                <h3><g:message code="articulos.label" args="[perfil.usuario.nombreCompleto]" /></h3>
                                <ul>
                                    <g:set var="articuloId" value="0" />
                                    <g:each in="${perfil.articulos}" var="articulo">
                                        <g:if test="${articulo.id != articuloId}">
                                            <li><g:link mapping="${articulo.tipo}" params="[anio: articulo.anio, trimestre: articulo.trimestre, leccion:articulo.leccion, tema:articulo.tema]">${articulo.titulo}</g:link></li>
                                        </g:if>
                                        <g:set var="articuloId" value="${articulo.id}" />
                                    </g:each>
                                </ul>
                            </g:if>
                        </div>
                    </div>
                </g:each>
            </div>
        </div>
	</body>
</html>
