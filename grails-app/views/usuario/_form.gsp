<%@ page import="esu.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="usuario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="username" id="username" required="" value="${usuarioInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value="${usuarioInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${usuarioInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled" class="checkbox">
        <g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
		<g:message code="usuario.enabled.label" default="Enabled" />
	</label>
</div>

<div class="fieldcontain">
    Roles
    <g:each in="${esu.Rol.list()}" var="rol">
        <label class="checkbox">
            <input type="checkbox"
                name="authorities"
                value="${rol.id}"
                <g:if test="${usuarioInstance?.id != null && usuarioInstance?.authorities.contains(rol)}">checked="checked" </g:if>
                />
            ${rol.authority}
        </label>
    </g:each>
</div>

<r:script>
    $(function() {
        $("#username").focus();
    });
</r:script>
