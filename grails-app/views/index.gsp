<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="home.label" /></title>
        <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
	</head>
	<body>
        <div class="hero-unit">
          <h1><g:message code="apply.hero.title" /></h1>
          <p><g:message code="apply.hero.message" /></p>
          <p><a href="${createLink(uri: "/admission")}" class="btn btn-primary btn-large"><g:message code="apply.button.label" /></a></p>
        </div>
	</body>
</html>
