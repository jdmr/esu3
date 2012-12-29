package esu

class EstudiaController {

    def articuloService

    def index() {}

    def ver() {
        def resultado = articuloService.leccion(params.anio, params.trimestre, params.leccion, params.dia)
        return resultado
    }
}
