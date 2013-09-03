
<%@ page import="esu.Trimestre" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trimestre.label', default: 'Trimestre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			
			<div class="col-sm-3">
					<ul class="nav esu-sidenav">
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
						
							<g:sortableColumn property="nombre" title="${message(code: 'trimestre.nombre.label', default: 'Nombre')}" />
						
							<g:sortableColumn property="inicia" title="${message(code: 'trimestre.inicia.label', default: 'Inicia')}" />
						
							<g:sortableColumn property="publicado" title="${message(code: 'trimestre.publicado.label', default: 'Publicado')}" />
						
							<g:sortableColumn property="termina" title="${message(code: 'trimestre.termina.label', default: 'Termina')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${trimestreInstanceList}" var="trimestreInstance">
						<tr>
						
							<td>${fieldValue(bean: trimestreInstance, field: "nombre")}</td>
						
							<td><g:formatDate date="${trimestreInstance.inicia}" /></td>
						
							<td><g:formatBoolean boolean="${trimestreInstance.publicado}" /></td>
						
							<td><g:formatDate date="${trimestreInstance.termina}" /></td>
						
							<td class="link">
								<g:link action="show" id="${trimestreInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
                <g:paginate total="${trimestreInstanceTotal}" />
			</div>

		</div>
	</body>
</html>
