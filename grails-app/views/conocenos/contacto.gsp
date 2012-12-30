<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="conocenos.label" /></title>
        <r:require modules="bootstrap,bootstrap-responsive-css,modernizr" />
	</head>
	<body>
        <div class="row">
            <div class="span3">
                <div class="well" style="padding: 8px 0;">
                    <ul class="nav nav-list">
                        <li class="nav-header">Conócenos</li>
                        <li><a href="${createLink(controller:'conocenos')}">Acerca de Nosotros</a></li>
                        <li><a href="${createLink(action:'equipo')}">Equipo</a></li>
                        <li class="active"><a href="${createLink(action:'contacto')}">Contacto</a></li>
                    </ul>
                </div>
            </div>
            <div class="span6">
                <h1>Contacto</h1>
                <p>Nos encanta saber tu opinión. Puedes encontrarnos en</p>
                <ul>
                    <li><a href="http://www.facebook.com/EscuelaSabaticaUniversitaria" target="_blank">Facebook</a></li>
                    <li><a href="http://twitter.com/#!/esuniversitaria" target="_blank">Twiiter</a></li>
                    <li><a href="mailto:contactoesu@um.edu.mx">contactoesu@um.edu.mx</a></li>
                </ul>
            </div>
            <div class="span3">
                <iframe allowtransparency="true" frameborder="0" scrolling="no"
                        src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FEscuela-Sab%C3%A1tica-Universitaria%2F231697236855248&amp;width=300&amp;colorscheme=light&amp;show_faces=true&amp;border_color&amp;stream=true&amp;header=true&amp;height=600"
                        style="border:none; overflow:hidden; width:300px; height:600px;">
                </iframe>
            </div>
        </div>
	</body>
</html>
