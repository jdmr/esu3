package esu

class ComparteController {

    def articuloService

    def index() {}

    def ver() {
        log.debug("Ver Comparte $params")
        def resultado = articuloService.tema('comunica', params.anio, params.trimestre, params.leccion, params.tema)
        return resultado
    }

}
