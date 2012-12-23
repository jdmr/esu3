<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="usuario.ver.title" /></title>
    <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
</head>
<body>
    <div class="row">
        <div class="span12">
            <h1><g:message code="usuario.ver.title" /></h1>
        </div>
    </div>
    <div class="row">
        <div class="span12 well">
            <a href="${createLink(action:'lista')}" class="btn btn-primary btn-large"><i class="icon-list icon-white"></i> <g:message code="usuario.lista.button" /></a>
            <a href="${createLink(action:'nuevo')}" class="btn btn-primary btn-large"><i class="icon-plus icon-white"></i> <g:message code="usuario.nuevo.title" /></a>
        </div>
    </div>
    <div class="row">
        <div class="span12 control-group">
            <h4><g:message code="usuario.username.label" /></h4>
            <h3>${usuario.username}</h3>
        </div>
    </div>
</body>
</html>
