<%@ page import="esu.Articulo" %>
<!doctype html>
<html>
	<head>
        <meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'articulo.label', default: 'Artículo')}" />
		<title><g:message code="publicacion.nueva.label" args="[articulo.titulo]" /></title>
        <ckeditor:resources/>
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
						<li class="active">
							<g:link class="create" action="create">
								<i class="icon-plus icon-white"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="publicacion.nueva.label" args="[articulo.titulo]" /> </h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${publicacion}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${publicacion}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="nuevaPublicacion" method="post" >
                        <input type="hidden" name="articuloId" value="${articulo.id}" />
						<fieldset>
                            <div class="row-fluid">
                                <div class="span2">
                                    <g:select id="anio" name="anio" from="${anios}" value="${publicacion.anio}" class="span12" />
                                </div>
                                <div class="span1">
                                    <g:select name="trimestre" from="${publicacion.constraints.trimestre.inList}" id="trimestre" value="${publicacion.trimestre}" class="span12" />
                                </div>
                                <div class="span1">
                                    <g:select name="leccion" from="${publicacion.constraints.leccion.inList}" id="leccion" value="${publicacion.leccion}" class="span12" />
                                </div>
                                <div class="span2">
                                    <g:select name="tipo" from="${publicacion.constraints.tipo.inList}" id="tipo" value="${publicacion.tipo}" class="span12" />
                                </div>
                                <div class="span2">
                                    <g:select name="dia" from="${publicacion.constraints.dia.inList}" id="dia" value="${publicacion.dia}" class="span12" noSelection="['':'-Día-']" />
                                </div>
                                <div class="span2">
                                    <g:select name="tema" from="${publicacion.constraints.tema.inList}" id="tema" value="${publicacion.tema}" class="span12" noSelection="['':'-Tema-']" />
                                </div>
                                <div class="span2">
                                    <g:select name="estatus" from="${publicacion.constraints.estatus.inList}" id="estatus" value="${publicacion.estatus}" class="span12" />
                                </div>
                            </div>

                            <div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.create.label" default="Create" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>
				
			</div>

		</div>
	</body>
</html>
