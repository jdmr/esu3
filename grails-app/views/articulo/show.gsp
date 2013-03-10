
<%@ page import="esu.Articulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'articulo.label', default: 'Articulo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${articuloInstance?.titulo}">
						<dt><g:message code="articulo.titulo.label" default="Titulo" /></dt>
						
							<dd><g:fieldValue bean="${articuloInstance}" field="titulo"/></dd>
						
					</g:if>
				
					<g:if test="${articuloInstance?.descripcion}">
						<dt><g:message code="articulo.descripcion.label" default="Descripcion" /></dt>
						
							<dd><g:fieldValue bean="${articuloInstance}" field="descripcion"/></dd>
						
					</g:if>
				
					<g:if test="${articuloInstance?.contenido}">
						<dt><g:message code="articulo.contenido.label" default="Contenido" /></dt>
						
							<dd>${articuloInstance.contenido}</dd>
						
					</g:if>
				
					<g:if test="${articuloInstance?.autor}">
						<dt><g:message code="articulo.autor.label" default="Autor" /></dt>
						
							<dd><g:link controller="usuario" action="show" id="${articuloInstance?.autor?.id}">${articuloInstance?.autor?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${articuloInstance?.dateCreated}">
						<dt><g:message code="articulo.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${articuloInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${articuloInstance?.lastUpdated}">
						<dt><g:message code="articulo.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${articuloInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${articuloInstance?.vistas}">
						<dt><g:message code="articulo.vistas.label" default="Vistas" /></dt>
						
							<dd><g:fieldValue bean="${articuloInstance}" field="vistas"/></dd>
						
					</g:if>

                    <g:if test="${publicaciones}">
                        <dt><g:message code="publicacion.lista.label" default="Publicaciones" /></dt>
                        <dd>
                            <ul>
                                <g:each in="${publicaciones}" var="publicacion">
                                    <li>${publicacion.anio} ${publicacion.trimestre} ${publicacion.leccion} ${publicacion.tipo} ${publicacion.dia} ${publicacion.tema} <a href="${createLink(action:'eliminaPublicacion', id:publicacion.id)}" class="btn btn-danger"><i class="icon-remove icon-white"></i> <g:message code="eliminar.label" default="Eliminar" /></a> </li>
                                </g:each>
                            </ul>
                        </dd>
                    </g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${articuloInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${articuloInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
                        <g:link class="btn btn-primary" action="nuevaPublicacion" id="${articuloInstance?.id}">
                            <i class="icon-plus icon-white"></i>
                            <g:message code="nueva.publicacion.label" default="Nueva Publicación" />
                        </g:link>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
