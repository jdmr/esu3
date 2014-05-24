
<%@ page import="esu.Articulo" %>
<!doctype html>
<html>
	<head>
        <meta name="layout" content="main"/>
		<g:set var="entityName" value="${message(code: 'articulo.label', default: 'Articulo')}" />
		<title>Análisis</title>
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
                    <li class="nav-header">Usuario</li>
                    <li>
                        <g:link class="list" controller="usuario" action="list">
                            <i class="icon-list icon-white"></i>
                            <g:message code="default.list.label" args="['Usuario']" />
                        </g:link>
                    </li>
                    <li>
                        <g:link class="create" controller="usuario" action="create">
                            <i class="icon-plus"></i>
                            <g:message code="default.create.label" args="['Usuario']" />
                        </g:link>
                    </li>
                    <li class="nav-header">Análisis</li>
                    <li class="active">
                        <g:link class="list" action="articulos">
                            <i class="icon-list icon-white"></i>
                            Artículos
                        </g:link>
                    </li>
                </ul>
			</div>

			<div class="col-sm-9">
				
				<div class="page-header">
					<h1>Análisis de Articulos</h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<table class="table table-striped table-hover">
					<thead>
						<tr>

                            <th class="header"><g:message code="articulo.titulo.label" default="Titulo" /></th>

							<th class="header"><g:message code="articulo.autor.label" default="Autor" /></th>

                            <th class="header"><g:message code="articulo.vistas.label" default="Vistas" /></th>
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${articulos}" var="articulo">
						<tr>
						
							<td>${articulo.titulo}</td>

                            <td>${articulo.autor}</td>

                            <td>${articulo.vistas}</td>

						</tr>
					</g:each>
					</tbody>
				</table>
                <g:paginate total="${totalDeArticulos}" />
			</div>

		</div>
	</body>
</html>
