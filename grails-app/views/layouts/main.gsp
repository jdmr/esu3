<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:message code="project.name"/> - <g:layoutTitle default="ESU"/></title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <r:require modules="base"/>
    <r:layoutResources/>
    <g:layoutHead/>
</head>

<body>
<!--[if lt IE 7]>
          <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
      <![endif]-->

<header class="navbar navbar-default navbar-fixed-top bs-docs-nav" role="banner">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </div>
        <a href="${createLink(controller: 'inicio')}" class="navbar-brand"><img
                src="${resource(dir: 'images', file: 'logo.jpg')}" alt="Escuela Sabática Universitaria"/></a>
        <!-- img id="anuncio" src="${resource(dir: 'images', file: 'ANUNCIOES.png')}" alt="Folleto Escuela Sabática"/ -->
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
                <li <g:if test="${request.getRequestURI().startsWith("/inicio")}">class="active"</g:if>><a
                        href="${createLink(controller: 'inicio')}"><g:message code="inicio.label"/></a></li>
                <li <g:if test="${request.getRequestURI().startsWith("/estudia")}">class="active"</g:if>><a
                        href="${createLink(controller: 'estudia')}"><g:message code="estudia.label"/></a></li>
                <li <g:if test="${request.getRequestURI().startsWith("/profundiza")}">class="active"</g:if>><a
                        href="${createLink(controller: 'profundiza')}"><g:message code="dialoga.label"/></a></li>
                <li <g:if test="${request.getRequestURI().startsWith("/comparte")}">class="active"</g:if>><a
                        href="${createLink(controller: 'comparte')}"><g:message code="comunica.label"/></a></li>
                <li <g:if test="${request.getRequestURI().startsWith("/conocenos")}">class="active"</g:if>><a
                        href="${createLink(controller: 'conocenos')}"><g:message code="conocenos.label"/></a></li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li <g:if test="${request.getRequestURI().startsWith("/trimestre")}">class="active"</g:if>><a
                            href="${createLink(controller: 'trimestre')}"><g:message code="trimestre.lista"/></a>
                    </li>
                </sec:ifAllGranted>
                <sec:ifAllGranted roles="ROLE_AUTOR">
                    <li <g:if test="${request.getRequestURI().startsWith("/articulo")}">class="active"</g:if>><a
                            href="${createLink(controller: 'articulo')}"><g:message code="articulo.lista"/></a></li>
                </sec:ifAllGranted>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li <g:if test="${request.getRequestURI().startsWith("/usuario")}">class="active"</g:if>><a
                            href="${createLink(controller: 'usuario')}"><g:message code="usuario.lista.title"/></a>
                    </li>
                </sec:ifAllGranted>
                <sec:ifLoggedIn>
                    <li><a href="${createLink(uri: '/logout')}"><g:message code="salir.label"/></a></li>
                </sec:ifLoggedIn>
            </ul>
            <g:form controller="buscar" action="articulo" method="get" class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="<g:message code='buscar.label'/>" id="filtro" name="filtro">
                </div>
            </g:form>
        </nav>
    </div>
</header>

<div class="container">

    <g:layoutBody/>

</div>

<div class="footer" role="contentinfo">
    <div class="container">
        <div class="row">
            <div class="col-sm-5 leftfooter">
                <h4><a href="${createLink(controller: 'conocenos')}">Acerca de Escuela Sabática Universitaria</a></h4>

                <p><a href="${createLink(controller: 'inicio')}">Inicio</a></p>

                <p><a href="${createLink(controller: 'estudia')}">Estudia</a></p>

                <p><a href="${createLink(controller: 'profundiza')}">Profundiza</a></p>

                <p><a href="${createLink(controller: 'comparte')}">Comparte</a></p>
            </div>

            <div class="col-sm-2 centerfooter">
                <h4>Redes Sociales</h4>

                <p><a href="${createLink(uri: 'http://www.facebook.com/EscuelaSabaticaUniversitaria')}"
                      target="_blank">Facebook</a></p>

                <p><a href="${createLink(uri: 'http://twitter.com/esuniversitaria')}" target="_blank">Twitter</a></p>

                <p><a href="${createLink(uri: '/rss')}">rss</a></p>
            </div>

            <div class="col-sm-5 rightfooter">
                <h4>Powered by <a href="www.um.edu.mx" target="_blank">Universidad de Montemorelos</a></h4>
                <sec:ifNotLoggedIn>
                    <a href="${createLink(uri: '/login/auth')}"><i class="icon-cog"></i></a>
                </sec:ifNotLoggedIn>
                <br/>
            </div>
        </div>
    </div>
</div>
<g:javascript library="application"/>
<r:script>

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-19803340-3']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();

</r:script>
<r:layoutResources/>
</body>
</html>
