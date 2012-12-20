<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="usuario.lista.title" /></title>
    <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
</head>
<body>
    <h1><g:message code="usuario.lista.title" /></h1>
    <g:if test="${flash.message}">
        <div class="alert alert-block alert-info" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-striped">
        <thead>
            <tr>

                <g:sortableColumn property="username" title="${message(code: 'usuario.username.label')}" />

                <g:sortableColumn property="enabled" title="${message(code: 'usuario.enabled.label')}" />

            </tr>
        </thead>
        <tbody>
        <g:each in="${lista}" status="i" var="usuario">
            <tr>

                <td><g:link action="ver" id="${usuario.id}">${fieldValue(bean: usuario, field: "username")}</g:link></td>

                <td>${fieldValue(bean: usuario, field: "enabled")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${total}" />
    </div>
</body>
</html>
