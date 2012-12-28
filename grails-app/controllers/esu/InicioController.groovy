package esu

class InicioController {

    def inicioService

    def index() {
        log.debug("Cargando inicio")

        if (session.anio) {
            redirect(mapping: 'inicio', params: [anio: session.anio, trimestre: session.trimestre, leccion: session.leccion, dia: session.dia])
        } else {
            def resultado = inicioService.inicio(params)
            redirect(mapping: 'inicio', params: resultado)
        }
    }

    def ver() {
        log.debug("Ver: $params")
        session.anio = params.anio
        session.trimestre = params.trimestre
        session.leccion = params.leccion
        session.dia = params.dia
        def resultado = inicioService.inicio(params.anio, params.trimestre, params.leccion, params.dia)
        render(view: 'index', model: resultado)
    }
}
