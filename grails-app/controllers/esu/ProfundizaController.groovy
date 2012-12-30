package esu

class ProfundizaController {

    def articuloService
    def inicioService

    def index() {
        log.debug("Profundiza")
        if (session.anio) {
            redirect(mapping: 'dialoga', params: [anio: session.anio, trimestre: session.trimestre, leccion: session.leccion, tema: 'tema1'])
        } else {
            def resultado = inicioService.inicio(params)
            resultado.remove('dia')
            resultado.'tema' = 'tema1'
            redirect(mapping: 'dialoga', params: resultado)
        }
    }

    def ver() {
        log.debug("Ver Profundiza $params")
        def resultado = articuloService.tema('dialoga', params.anio, params.trimestre, params.leccion, params.tema)
        return resultado
    }
}
