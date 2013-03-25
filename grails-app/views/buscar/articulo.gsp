<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="busqueda.label" /></title>
    <r:require modules="base"/>
</head>
<body>
    <div class="row">
        <div class="span12">
            <g:each in="${results}" var="articulo">
                <a href="${createLink(action:'ver', id:articulo.id)}"><h3>${articulo.titulo}</h3></a>
                <p>${articulo.descripcion}</p>
            </g:each>
            <div class="pagination">
                <g:paginate total="${total}" params="[filtro:filtro]" />
            </div>
        </div>
    </div>
</body>
</html>