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
		<div class="row">
			
			<div class="col-sm-12">

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

					<g:form action="nuevaPublicacion" method="post" >
                        <input type="hidden" name="articuloId" value="${articulo.id}" />
                            <div class="row">
                                <div class="col-sm-2">
                                    <g:select id="anio" name="anio" from="${anios}" value="${publicacion.anio}" class="form-control" />
                                </div>
                                <div class="col-sm-1">
                                    <g:select name="trimestre" from="${publicacion.constraints.trimestre.inList}" id="trimestre" value="${publicacion.trimestre}" class="form-control" />
                                </div>
                                <div class="col-sm-1">
                                    <g:select name="leccion" from="${publicacion.constraints.leccion.inList}" id="leccion" value="${publicacion.leccion}" class="form-control" />
                                </div>
                                <div class="col-sm-2">
                                    <g:select name="tipo" from="${publicacion.constraints.tipo.inList}" id="tipo" value="${publicacion.tipo}" class="form-control" />
                                </div>
                                <div class="col-sm-2">
                                    <g:select name="dia" from="${publicacion.constraints.dia.inList}" id="dia" value="${publicacion.dia}" class="form-control" noSelection="['':'-Día-']" />
                                </div>
                                <div class="col-sm-2">
                                    <g:select name="tema" from="${publicacion.constraints.tema.inList}" id="tema" value="${publicacion.tema}" class="form-control" noSelection="['':'-Tema-']" />
                                </div>
                                <div class="col-sm-2">
                                    <g:select name="estatus" from="${publicacion.constraints.estatus.inList}" id="estatus" value="${publicacion.estatus}" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group" style="padding-top: 10px;">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.create.label" default="Create" />
								</button>
                                <g:link class="btn btn-default" action="show" id="${articulo?.id}">
                                    <i class="icon-remove"></i>
                                    <g:message code="default.button.back.label" default="Back" />
                                </g:link>
							</div>
					</g:form>

			</div>

		</div>
	</body>
</html>
