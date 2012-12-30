package esu

class EstudiaController {

    def articuloService
    def inicioService

    def index() {
        if (session.anio) {
            redirect(mapping: 'estudia', params: [anio: session.anio, trimestre: session.trimestre, leccion: session.leccion, dia: session.dia])
        } else {
            def resultado = inicioService.inicio(params)
            redirect(mapping: 'estudia', params: resultado)
        }
    }

    def ver() {
        def resultado = articuloService.leccion(params.anio, params.trimestre, params.leccion, params.dia)
        return resultado
    }
}
