package esu

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ComparteController {

    def articuloService
    def inicioService

    def index() {
        if (session.anio) {
            redirect(mapping: 'comunica', params: [anio: session.anio, trimestre: session.trimestre, leccion: session.leccion, tema: 'tema1'])
        } else {
            def resultado = inicioService.inicio(params)
            session.putAll(resultado)
            resultado.remove('dia')
            resultado.'tema' = 'tema1'
            redirect(mapping: 'comunica', params: resultado)
        }
    }

    def ver() {
        log.debug("Ver Comparte $params")
        if (!session.dia) {
            log.debug("Asignando valores a session")
            session.anio = params.anio
            session.trimestre = params.trimestre
            session.leccion = params.leccion
            session.dia = inicioService.obtieneDia(new GregorianCalendar().get(Calendar.DAY_OF_WEEK))
        }
        def resultado = articuloService.tema('comunica', params.anio, params.trimestre, params.leccion, params.tema, session.dia)

        String urlString = /http:\/\/escuelasabaticauniversitaria.org\/comunica\/${params.anio}\/${params.trimestre}\/${params.leccion}\/${params.tema}/
        resultado.put('urlString', urlString)

        return resultado
    }

}
