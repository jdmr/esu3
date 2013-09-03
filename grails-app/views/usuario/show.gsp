
<%@ page import="esu.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			
			<div class="col-sm-3">
					<ul class="nav esu-sidenav">
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
			
			<div class="col-sm-9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${usuarioInstance?.username}">
						<dt><g:message code="usuario.username.label" default="Username" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="username"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.nombre}">
						<dt><g:message code="usuario.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="nombre"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.apellido}">
						<dt><g:message code="usuario.apellido.label" default="Apellido" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="apellido"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.accountExpired}">
						<dt><g:message code="usuario.accountExpired.label" default="Account Expired" /></dt>
						
							<dd><g:formatBoolean boolean="${usuarioInstance?.accountExpired}" /></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.accountLocked}">
						<dt><g:message code="usuario.accountLocked.label" default="Account Locked" /></dt>
						
							<dd><g:formatBoolean boolean="${usuarioInstance?.accountLocked}" /></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.articulos}">
						<dt><g:message code="usuario.articulos.label" default="Articulos" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="articulos"/></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.dateCreated}">
						<dt><g:message code="usuario.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${usuarioInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.enabled}">
						<dt><g:message code="usuario.enabled.label" default="Enabled" /></dt>
						
							<dd><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.lastUpdated}">
						<dt><g:message code="usuario.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${usuarioInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${usuarioInstance?.passwordExpired}">
						<dt><g:message code="usuario.passwordExpired.label" default="Password Expired" /></dt>
						
							<dd><g:formatBoolean boolean="${usuarioInstance?.passwordExpired}" /></dd>
						
					</g:if>

                    <g:if test="${usuarioInstance?.authorities}">
                        <dt><g:message code="usuario.authorities.label" default="Roles" /></dt>
                        <g:each in="${usuarioInstance.authorities}" var="rol">
                            <dd>${rol.authority}</dd>
                        </g:each>
                    </g:if>
				
					<g:if test="${usuarioInstance?.publicaciones}">
						<dt><g:message code="usuario.publicaciones.label" default="Publicaciones" /></dt>
						
							<dd><g:fieldValue bean="${usuarioInstance}" field="publicaciones"/></dd>
						
					</g:if>

				</dl>

				<g:form>
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn btn-default" action="edit" id="${usuarioInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
