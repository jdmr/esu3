<%@ page import="esu.Trimestre" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trimestre.label', default: 'Trimestre')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
                    <li class="active">
                        <g:link class="create" action="create">
                            <i class="icon-plus icon-white"></i>
                            <g:message code="default.create.label" args="[entityName]" />
                        </g:link>
                    </li>
                </ul>
			</div>
			
			<div class="col-sm-9">

				<div class="page-header">
					<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${trimestreInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${trimestreInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

                <g:form action="create" >
                    <g:render template="form" />
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="icon-ok icon-white"></i>
                            <g:message code="default.button.create.label" default="Create" />
                        </button>
                    </div>
                </g:form>

			</div>

		</div>
	</body>
</html>
