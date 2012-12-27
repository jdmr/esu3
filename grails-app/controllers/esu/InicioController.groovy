package esu

class InicioController {

    def inicioService

    def index() {
        log.debug("Cargando inicio")
        def resultado = inicioService.inicio(params)
        redirect(mapping: 'inicio', params: resultado)
    }

    def ver() {
        log.debug("Ver: $params")
        def resultado = inicioService.inicio(params.anio, params.trimestre, params.leccion, params.dia)
        render(view: 'index', model: resultado)
    }
}
