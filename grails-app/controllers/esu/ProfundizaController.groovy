package esu

class ProfundizaController {

    def articuloService

    def index() {
        log.debug("Profundiza")

    }

    def ver() {
        log.debug("Ver Profundiza $params")
        def resultado = articuloService.profundiza(params.anio, params.trimestre, params.leccion, params.tema)
        return resultado
    }
}
