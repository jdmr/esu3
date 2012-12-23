<div class="row">
    <div class="span4 control-group">
        <label>
          <g:message code="usuario.username.label" />
          <g:textField name="username" required="" value="${usuario?.username}" class="span4" />
        </label>
    </div>
</div>

<g:if test="${roles}">
  <div class="row">
    <div class="span4 control-group">
      <label><g:message code="rol.lista" /></label>
      <g:each var="entry" in="${roles}">
        <label class="checkbox">
          <g:checkBox name="${entry.key.authority}" value="${entry.value}" />
          ${entry.key.authority}
        </label>
      </g:each>
    </div>
  </div>
</g:if>
