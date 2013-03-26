<%@ page import="esu.Trimestre" %>



<div class="fieldcontain ${hasErrors(bean: trimestreInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="trimestre.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="6" required="" value="${trimestreInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trimestreInstance, field: 'inicia', 'error')} required">
	<label for="inicia">
		<g:message code="trimestre.inicia.label" default="Inicia" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicia" precision="day"  value="${trimestreInstance?.inicia}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: trimestreInstance, field: 'publicado', 'error')} ">
	<label for="publicado">
		<g:message code="trimestre.publicado.label" default="Publicado" />
		
	</label>
	<g:checkBox name="publicado" value="${trimestreInstance?.publicado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: trimestreInstance, field: 'termina', 'error')} required">
	<label for="termina">
		<g:message code="trimestre.termina.label" default="Termina" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="termina" precision="day"  value="${trimestreInstance?.termina}"  />
</div>

