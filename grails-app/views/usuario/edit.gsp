<%@ page import="esu.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${usuarioInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${usuarioInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="edit" id="${usuarioInstance?.id}" >
						<g:hiddenField name="version" value="${usuarioInstance?.version}" />
						<fieldset>
							<g:render template="form" />
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.update.label" default="Update" />
								</button>
								<button type="submit" class="btn btn-danger" name="_action_delete" formnovalidate>
									<i class="icon-trash icon-white"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

			</div>

		</div>
	</body>
</html>
