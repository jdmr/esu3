<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
        <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
		<g:if env="development"><link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css"></g:if>
	</head>
	<body>
		<g:if env="development">
            <div class="row">
                <div class="span12">
                    <g:renderException exception="${exception}" />
                </div>
            </div>
		</g:if>
		<g:else>
            <div class="row">
                <div class="span12">
                    <ul class="errors">
                        <li>An error has occurred</li>
                    </ul>
                </div>
            </div>
		</g:else>
	</body>
</html>
