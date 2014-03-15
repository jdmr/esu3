package esu

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ProfundizaController {

    def articuloService
    def inicioService

    def index() {
        log.debug("Profundiza")
        if (session.anio) {
            redirect(mapping: 'dialoga', params: [anio: session.anio, trimestre: session.trimestre, leccion: session.leccion, tema: 'tema1'])
        } else {
            def resultado = inicioService.inicio(params)
            session.putAll(resultado)
            resultado.remove('dia')
            resultado.'tema' = 'tema1'
            redirect(mapping: 'dialoga', params: resultado)
        }
    }

    def ver() {
        log.debug("Ver Profundiza $params")
        if (!session.dia) {
            log.debug("Asignando valores a session")
            session.anio = params.anio
            session.trimestre = params.trimestre
            session.leccion = params.leccion
            session.dia = inicioService.obtieneDia(new GregorianCalendar().get(Calendar.DAY_OF_WEEK))
        }
        def resultado = articuloService.tema('dialoga', params.anio, params.trimestre, params.leccion, params.tema, session.dia)

        String urlString = /http:\/\/escuelasabaticauniversitaria.org\/profundiza\/${params.anio}\/${params.trimestre}\/${params.leccion}\/${params.tema}/
        resultado.put('urlString', urlString)

        return resultado
    }
}
