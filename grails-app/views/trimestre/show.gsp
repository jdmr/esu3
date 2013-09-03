
<%@ page import="esu.Trimestre" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trimestre.label', default: 'Trimestre')}" />
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
				
					<g:if test="${trimestreInstance?.nombre}">
						<dt><g:message code="trimestre.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${trimestreInstance}" field="nombre"/></dd>
						
					</g:if>
				
					<g:if test="${trimestreInstance?.inicia}">
						<dt><g:message code="trimestre.inicia.label" default="Inicia" /></dt>
						
							<dd><g:formatDate date="${trimestreInstance?.inicia}" /></dd>
						
					</g:if>
				
					<g:if test="${trimestreInstance?.publicado}">
						<dt><g:message code="trimestre.publicado.label" default="Publicado" /></dt>
						
							<dd><g:formatBoolean boolean="${trimestreInstance?.publicado}" /></dd>
						
					</g:if>
				
					<g:if test="${trimestreInstance?.termina}">
						<dt><g:message code="trimestre.termina.label" default="Termina" /></dt>
						
							<dd><g:formatDate date="${trimestreInstance?.termina}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${trimestreInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn btn-default" action="edit" id="${trimestreInstance?.id}">
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
