package esu

import grails.plugin.springsecurity.annotation.Secured

/**
 * Created by jdmr on 3/15/14.
 */
@Secured(['ROLE_ADMIN'])
class AnalisisController {

    def articuloService
    def usuarioService

    def index() {
       redirect(action:'articulos', params: params)
    }

    def articulos() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = 'vistas'
            params.order = 'desc'
        }
        return articuloService.analisis(params)
    }

    def autores() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def resultado = usuarioService.analisis(params)
        log.debug("Resultado: $resultado")
        return resultado
    }
}
