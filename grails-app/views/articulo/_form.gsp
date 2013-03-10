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
