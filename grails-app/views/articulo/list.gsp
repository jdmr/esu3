
<%@ page import="esu.Articulo" %>
<!doctype html>
<html>
	<head>
        <meta name="layout" content="main"/>
		<g:set var="entityName" value="${message(code: 'articulo.label', default: 'Articulo')}" />
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

                <form id="searchForm" name="searchForm" action="${createLink(action: 'buscar')}" method="post" class="form-inline">
                    <div class="form-group">
                        <input type="text" name="filter" id="filter" value="${params.filter}" class="input-large search-query" />
                    </div>
                    <button type="submit" name="searchBtn" id="searchBtn" class="btn btn-default"><i class="icon-search"></i> Buscar Por Título</button>
                </form>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="titulo" title="${message(code: 'articulo.titulo.label', default: 'Titulo')}" />
						
							<g:sortableColumn property="descripcion" title="${message(code: 'articulo.descripcion.label', default: 'Descripcion')}" />
						
							<th class="header"><g:message code="articulo.autor.label" default="Autor" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'articulo.dateCreated.label', default: 'Date Created')}" />
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'articulo.lastUpdated.label', default: 'Last Updated')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${articuloInstanceList}" var="articuloInstance">
						<tr>
						
							<td>${fieldValue(bean: articuloInstance, field: "titulo")}</td>
						
							<td>${fieldValue(bean: articuloInstance, field: "descripcion")}</td>
						
							<td>${fieldValue(bean: articuloInstance, field: "autor")}</td>
						
							<td><g:formatDate date="${articuloInstance.dateCreated}" /></td>
						
							<td><g:formatDate date="${articuloInstance.lastUpdated}" /></td>
						
							<td class="link">
								<g:link action="show" id="${articuloInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
                <g:paginate total="${articuloInstanceTotal}" />
			</div>

		</div>
	</body>
</html>
