<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:message code="project.name" /> - <g:layoutTitle default="ESU"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        <r:require modules="base" />
		<r:layoutResources />
		<g:layoutHead/>
	</head>
	<body>
      <!--[if lt IE 7]>
          <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
      <![endif]-->

      <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="row">
                    <div class="span12">
                        <a class="brand" href="${createLink(controller:'inicio')}"><img src="${resource(dir:'images', file:'logo.jpg')}" alt="Escuela Sabática Universitaria" /></a>
                    </div>
                </div>
                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li <g:if test="${request.getRequestURI().startsWith("/inicio")}">class="active"</g:if>><a href="${createLink(controller:'inicio')}"><g:message code="inicio.label" /></a></li>
                        <li <g:if test="${request.getRequestURI().startsWith("/estudia")}">class="active"</g:if>><a href="${createLink(controller:'estudia')}"><g:message code="estudia.label" /></a></li>
                        <li <g:if test="${request.getRequestURI().startsWith("/profundiza")}">class="active"</g:if>><a href="${createLink(controller:'profundiza')}"><g:message code="dialoga.label" /></a></li>
                        <li <g:if test="${request.getRequestURI().startsWith("/comparte")}">class="active"</g:if>><a href="${createLink(controller:'comparte')}"><g:message code="comunica.label" /></a></li>
                        <li <g:if test="${request.getRequestURI().startsWith("/conocenos")}">class="active"</g:if>><a href="${createLink(controller:'conocenos')}"><g:message code="conocenos.label" /></a></li>
                        <sec:ifAllGranted roles="ROLE_AUTOR">
                            <li <g:if test="${request.getRequestURI().startsWith("/articulo")}">class="active"</g:if>><a href="${createLink(controller:'articulo')}"><g:message code="articulo.lista" /></a></li>
                        </sec:ifAllGranted>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li <g:if test="${request.getRequestURI().startsWith("/usuario")}">class="active"</g:if>><a href="${createLink(controller:'usuario')}"><g:message code="usuario.lista.title" /></a></li>
                        </sec:ifAllGranted>
                        <sec:ifLoggedIn>
                            <li><a href="${createLink(uri:'/logout')}"><g:message code="salir.label" /></a></li>
                        </sec:ifLoggedIn>
                    </ul>
                </div>
                <g:form controller="buscar" action="articulo" method="get" class="navbar-search pull-right">
                    <input type="text" id="filtro" name="filtro" class="search-query" placeholder="<g:message code='buscar.label' />" />
                </g:form>
            </div>
        </div>
      </div>
      <div class="container">

          <g:layoutBody/>

      </div>

      <div class="footer" role="contentinfo">
          <div class="container">
              <div class="row">
                  <div class="span5">
                      <h4><a href="${createLink(controller: 'conocenos')}">Acerca de Escuela Sabática Universitaria</a></h4>
                      <p><a href="${createLink(controller: 'inicio')}">Inicio</a></p>
                      <p><a href="${createLink(controller: 'estudia')}">Estudia</a></p>
                      <p><a href="${createLink(controller: 'profundiza')}">Profundiza</a></p>
                      <p><a href="${createLink(controller: 'comparte')}">Comparte</a></p>
                  </div>
                  <div class="span2" style="text-align: center;">
                      <h4>Redes Sociales</h4>
                      <p><a href="${createLink(uri: 'http://www.facebook.com/EscuelaSabaticaUniversitaria')}" target="_blank">Facebook</a></p>
                      <p><a href="${createLink(uri: 'http://twitter.com/esuniversitaria')}" target="_blank">Twitter</a></p>
                  </div>
                  <div class="span5" style="text-align: right;">
                      <h4>Powered by <a href="www.um.edu.mx" target="_blank">Universidad de Montemorelos</a></h4>
                      <sec:ifNotLoggedIn>
                          <a href="${createLink(uri:'/login/auth')}"><i class="icon-cog"></i></a>
                      </sec:ifNotLoggedIn>
                  </div>
              </div>
          </div>
      </div>
      <g:javascript library="application"/>
      <r:layoutResources />
	</body>
</html>
