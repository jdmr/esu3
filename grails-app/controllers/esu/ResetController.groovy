package esu

import grails.plugin.springsecurity.annotation.Secured

/**
 * Created by jdmr on 12/7/13.
 */
@Secured('permitAll')
class ResetController {

    public user() {
        Usuario usuario = Usuario.findByUsername(params.id)
        if (usuario) {
            log.info("Reseting ${usuario.username}")
            usuario.setPassword("${usuario.username}00")
            usuario.save(flush: true)
        }
        redirect(controller: 'inicio')
    }
}
