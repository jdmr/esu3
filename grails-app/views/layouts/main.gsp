<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:message code="project.name" /> - <g:layoutTitle default="SWAU"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<r:layoutResources />
    <link href="${resource(dir: 'css', file: 'app.css')}" type="text/css" rel="stylesheet" media="screen, projection" />
		<g:layoutHead/>
	</head>
	<body>
      <!--[if lt IE 7]>
          <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
      <![endif]-->

      <div class="container">
          <div id="logo" role="banner"><a href="${createLink(uri:'/')}"><img src="${resource(dir: 'images', file: 'logo.jpg')}" alt="Escuela Sabática Universitaria"/></a></div>
          <g:layoutBody/>
          <div class="footer" role="contentinfo">
              <p>&copy; 2012 Universidad de Montemorelos</p>
          </div>
      </div>
      <g:javascript library="application"/>
      <r:layoutResources />
	</body>
</html>
