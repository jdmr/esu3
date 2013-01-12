<!doctype html>
<html>
	<head>
		<title>Grails Runtime Exception</title>
        <meta name="layout" content="main">
        <r:require modules="bootstrap,bootstrap-responsive-css,modernizr,jquery-ui" />
	</head>
	<body>
		<g:renderException exception="${exception}" />
	</body>
</html>