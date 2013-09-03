<%@ page import="esu.Articulo" %>


<div class="form-group">
    <div class="fieldcontain ${hasErrors(bean: articuloInstance, field: 'titulo', 'error')} required">
        <label for="titulo">
            <g:message code="articulo.titulo.label" default="Titulo" />
            <col-sm- class="required-indicator">*</col-sm->
        </label>
        <g:textField name="titulo" required="true" value="${articuloInstance?.titulo}" class="form-control" />
    </div>
</div>

<div class="form-group">
    <div class="fieldcontain ${hasErrors(bean: articuloInstance, field: 'descripcion', 'error')} ">
        <label for="descripcion">
            <g:message code="articulo.descripcion.label" default="Descripcion" />
        </label>
        <g:textArea name="descripcion" cols="40" rows="5" maxlength="10000" value="${articuloInstance?.descripcion}" class="form-control" />
    </div>
</div>

<div class="form-group">
    <div class="fieldcontain ${hasErrors(bean: articuloInstance, field: 'contenido', 'error')} required">
        <label for="contenido">
            <g:message code="articulo.contenido.label" default="Contenido" />
            <col-sm- class="required-indicator">*</col-sm->
        </label>
        <ckeditor:editor name="contenido" height="400px" width="98%">
            ${articuloInstance?.contenido}
        </ckeditor:editor>
    </div>
</div>

<div class="form-group">
    <div class="fieldcontain ${hasErrors(bean: articuloInstance, field: 'autor', 'error')} required">
        <label for="autor">
            <g:message code="articulo.autor.label" default="Autor" />
            <col-sm- class="required-indicator">*</col-sm->
        </label>
        <g:select id="autor" name="autor.id" from="${usuarios}" optionKey="id" required="true" value="${articuloInstance?.autor?.id}" class="form-control"/>
    </div>
</div>
