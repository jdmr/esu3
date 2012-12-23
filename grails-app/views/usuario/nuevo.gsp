<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="usuario.nuevo.title" /></title>
    <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
</head>
<body>
    <div class="row">
        <div class="span12">
            <h1><g:message code="usuario.nuevo.title" /></h1>
        </div>
    </div>
    <g:hasErrors bean="${usuario}">
      <div class="alert alert-block alert-error">
        <h1><g:message code="errors.title" /></h1>
        <g:eachError bean="${usuario}">
            <p><g:message error="${error}" /></p>
        </g:eachError>
      </div>
    </g:hasErrors>
    <g:form action="crea">
        <filedset>
            <g:render template="form" />
        </filedset>
    </g:form>
</body>
</html>
