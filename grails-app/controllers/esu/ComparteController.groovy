package esu

class ComparteController {

    def articuloService
    def inicioService

    def index() {
        if (session.anio) {
            redirect(mapping: 'comunica', params: [anio: session.anio, trimestre: session.trimestre, leccion: session.leccion, tema: 'tema1'])
        } else {
            def resultado = inicioService.inicio(params)
            resultado.remove('dia')
            resultado.'tema' = 'tema1'
            redirect(mapping: 'comunica', params: resultado)
        }
    }

    def ver() {
        log.debug("Ver Comparte $params")
        def resultado = articuloService.tema('comunica', params.anio, params.trimestre, params.leccion, params.tema)
        return resultado
    }

}
