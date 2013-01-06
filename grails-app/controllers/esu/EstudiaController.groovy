package esu

import java.text.SimpleDateFormat

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
        session.anio = params.anio
        session.trimestre = params.trimestre
        session.leccion = params.leccion
        session.dia = params.dia
        def resultado = articuloService.leccion(params.anio, params.trimestre, params.leccion, params.dia)

        String urlString = /http:\/\/escuelasabaticauniversitaria.org\/estudia\/${params.anio}\/${params.trimestre}\/${params.leccion}\/${params.dia}/
        resultado.put('urlString', urlString)

        return resultado
    }

    def buscaFecha() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy")
        Calendar cal = new GregorianCalendar()
        cal.time = sdf.parse(params.fechaNavegaTxt)
        cal.add(Calendar.SECOND, 1)
        def resultado = inicioService.inicio(cal)
        redirect(mapping: 'estudia', params: resultado)
    }
}
