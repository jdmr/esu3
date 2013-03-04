<%@ page import="esu.Articulo" %>


<div class="row-fluid">
    <div class="span12 fieldcontain ${hasErrors(bean: articuloInstance, field: 'titulo', 'error')} required">
        <label for="titulo">
            <g:message code="articulo.titulo.label" default="Titulo" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="titulo" required="true" value="${articuloInstance?.titulo}" class="span12" />
    </div>
</div>

<div class="row-fluid">
    <div class="span12 fieldcontain ${hasErrors(bean: articuloInstance, field: 'descripcion', 'error')} ">
        <label for="descripcion">
            <g:message code="articulo.descripcion.label" default="Descripcion" />
        </label>
        <g:textArea name="descripcion" cols="40" rows="5" maxlength="10000" value="${articuloInstance?.descripcion}" class="span12" />
    </div>
</div>

<div class="row-fluid">
    <div class="span12 fieldcontain ${hasErrors(bean: articuloInstance, field: 'contenido', 'error')} required">
        <label for="contenido">
            <g:message code="articulo.contenido.label" default="Contenido" />
            <span class="required-indicator">*</span>
        </label>
        <ckeditor:editor name="contenido" height="400px" width="98%">
            ${articuloInstance?.contenido}
        </ckeditor:editor>
    </div>
</div>

<div class="row-fluid">
    <div class="span12 fieldcontain ${hasErrors(bean: articuloInstance, field: 'autor', 'error')} required">
        <label for="autor">
            <g:message code="articulo.autor.label" default="Autor" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="autor" name="autor.id" from="${usuarios}" optionKey="id" required="true" value="${articuloInstance?.autor?.id}" class="many-to-one span12"/>
    </div>
</div>

<div class="row-fluid" style="margin-top: 10px;">
    <div class="span12">
        <legend><g:message code="publicacion.lista.label" /></legend>
    </div>
</div>

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
        <g:select name="dia" from="${publicacion.constraints.dia.inList}" id="dia" value="${publicacion.dia}" class="span12" />
    </div>
    <div class="span2">
        <g:select name="tema" from="${publicacion.constraints.tema.inList}" id="tema" value="${publicacion.tema}" class="span12" />
    </div>
    <div class="span2">
        <g:select name="estatus" from="${publicacion.constraints.estatus.inList}" id="estatus" value="${publicacion.estatus}" class="span12" />
    </div>
</div>

<g:if test="${publicaciones}">
    <hr/>
    <g:each in="${publicaciones}" var="p">
        <div class="row-fluid">
            <div class="span2"><button class="btn btn-danger eliminaPublicacion" name="elimina${p.id}" id="elimina${p.id}" data-publicacion="${p.id}"><i class="icon-remove icon-white"></i></button> <span class="pull-right">${p.anio}</span></div>
            <div class="span1">${p.trimestre}</div>
            <div class="span1">${p.leccion}</div>
            <div class="span2">${p.tipo}</div>
            <div class="span2">${p.dia}</div>
            <div class="span2">${p.tema}</div>
            <div class="span2">${p.estatus}</div>
        </div>
    </g:each>
</g:if>
<r:script>
$(function() {
    $(".eliminaPublicacion").click(function(e) {
        e.preventDefault();
        var publicacionId = $(this).data("publicacion");
        console.log("PublicacionId: "+publicacionId);
    });
});
</r:script>
