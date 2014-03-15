package esu

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
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

    def rss() {
        def resultado = inicioService.inicio(params)
        def entradas = inicioService.inicio(resultado.anio, resultado.trimestre, resultado.leccion, resultado.dia)
        render(feedType:"rss") {
            title = "EscuelaSabaticaUniversitaria.ORG"
            link = "${createLink(absolute: true, uri:'/rss')}"
            description = "Lección diaria de la Escuela Sabática de la Iglesia Adventista del Séptimo Día y Temas Semanales basados en las lecciones."
            entry("Versículo de Memoria") {
                link = "${createLink(mapping: 'estudia', absolute: true, params: [anio: entradas.leccion.anio, trimestre: entradas.leccion.trimestre, leccion: entradas.leccion.leccion, dia: entradas.leccion.dia])}"
                entradas.versiculo.contenido
            }
            entry(entradas.leccion.titulo) {
                link = "${createLink(mapping: 'estudia', absolute: true, params: [anio: entradas.leccion.anio, trimestre: entradas.leccion.trimestre, leccion: entradas.leccion.leccion, dia: entradas.leccion.dia])}"
                entradas.leccion.descripcion
            }
            for(Publicacion publicacion in entradas.dialoga) {
                entry(publicacion.titulo) {
                    link = "${createLink(mapping: 'dialoga', absolute: true, params: [anio: publicacion.anio, trimestre: publicacion.trimestre, leccion: publicacion.leccion, tema: publicacion.tema])}"
                    author = publicacion.autor
                    publicacion.descripcion
                }
            }
            for(Publicacion publicacion in entradas.comunica) {
                entry(publicacion.titulo) {
                    link = "${createLink(mapping: 'comunica', absolute: true, params: [anio: publicacion.anio, trimestre: publicacion.trimestre, leccion: publicacion.leccion, tema: publicacion.tema])}"
                    author = publicacion.autor
                    publicacion.descripcion
                }
            }
        }
    }

    def channel() {
        def cacheExpire = 60*60*24*365;
        response.setHeader("Pragma","public")
        response.setHeader("Cache-Control","max-age=${cacheExpire}")
        render "<script src='//connect.facebook.net/en_US/all.js'></script>"
    }
}
