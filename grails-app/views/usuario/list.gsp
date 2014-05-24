
<%@ page import="esu.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			
			<div class="col-sm-3">
                <ul class="nav esu-sidenav">
                    <li class="nav-header">Trimestre</li>
                    <li>
                        <g:link class="list" controller="trimestre" action="list">
                            <i class="icon-list icon-white"></i>
                            <g:message code="default.list.label" args="['Trimestre']" />
                        </g:link>
                    </li>
                    <li>
                        <g:link class="create" controller="trimestre" action="create">
                            <i class="icon-plus"></i>
                            <g:message code="default.create.label" args="['Trimestre']" />
                        </g:link>
                    </li>
                    <li class="nav-header">${entityName}</li>
                    <li class="active">
                        <g:link class="list" action="list">
                            <i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />
						
							<g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
						
							<g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${usuarioInstanceList}" var="usuarioInstance">
						<tr>
						
							<td>${fieldValue(bean: usuarioInstance, field: "username")}</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>

							<td class="link">
								<g:link action="show" id="${usuarioInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
                <g:paginate total="${usuarioInstanceTotal}" />
			</div>

		</div>
	</body>
</html>
