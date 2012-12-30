package esu

import java.text.NumberFormat

class InicioService {

    def inicio(String anio, String trimestre, String leccion, String dia = 'sabado') {
        Integer aniol = new Integer(anio)
        Publicacion leccion1 = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and dia = :dia and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'leccion', dia: dia])
        log.debug("Publicacion: $leccion1")
        if (leccion1) {
            leccion1.titulo = leccion1.es.titulo
            leccion1.descripcion = leccion1.es.descripcion
            leccion1.contenido = leccion1.es.contenido
            log.debug(leccion1.es)
        }

        Publicacion versiculo = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'versiculo'])
        log.debug("Versiculo: $versiculo")
        if (versiculo) {
            versiculo.titulo = versiculo.es.titulo
            versiculo.descripcion = versiculo.es.descripcion
            versiculo.contenido = versiculo.es.contenido
        }

        Publicacion video = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'video'])
        log.debug("Video: $video")
        if (video) {
            video.titulo = video.es.titulo
            video.descripcion = video.es.descripcion
            video.contenido = video.es.contenido
        }

        List<Publicacion> dialoga = Publicacion.findAll("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'dialoga'])
        for(publicacion in dialoga) {
            log.debug("$publicacion $publicacion.es")
            publicacion.titulo = publicacion.es.titulo
            publicacion.descripcion = publicacion.es.descripcion
            publicacion.contenido = publicacion.es.contenido
            publicacion.autor = publicacion.es.autor
        }

        List<Publicacion> comunica = Publicacion.findAll("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'comunica'])
        for(publicacion in comunica) {
            log.debug("$publicacion $publicacion.es")
            publicacion.titulo = publicacion.es.titulo
            publicacion.descripcion = publicacion.es.descripcion
            publicacion.contenido = publicacion.es.contenido
            publicacion.autor = publicacion.es.autor
        }

        return [leccion: leccion1, dialoga: dialoga, comunica: comunica, video: video, versiculo: versiculo]
    }

    def inicio(params) {
        def hoy = new GregorianCalendar(2012, Calendar.DECEMBER, 29, 0, 0, 1)
        log.debug("HOY: $hoy.time")
        Trimestre trimestre = Trimestre.find('from Trimestre where :hoy between inicia and termina and publicado = true', [hoy: hoy.time])
        log.debug(trimestre)

        Calendar a = new GregorianCalendar()
        a.time = trimestre.inicia
        int weeks = hoy.get(Calendar.WEEK_OF_YEAR) - a.get(Calendar.WEEK_OF_YEAR)
        if (hoy.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
            weeks++
        }
        if (weeks < 0) {
            weeks = 1
        }
        NumberFormat numberFormat = NumberFormat.getInstance()
        numberFormat.minimumIntegerDigits = 2
        String leccion = "l${numberFormat.format(weeks)}"
        log.debug("leccion: ${leccion}")
        return [anio: trimestre.nombre.substring(0,4), trimestre: trimestre.nombre.substring(4), leccion: leccion, dia: obtieneDia(hoy.get(Calendar.DAY_OF_WEEK))]
    }

    String obtieneDia(int dia) {
        switch(dia) {
            case Calendar.SUNDAY:
                return 'domingo'
            case Calendar.MONDAY:
                return 'lunes'
            case Calendar.TUESDAY:
                return 'martes'
            case Calendar.WEDNESDAY:
                return 'miercoles'
            case Calendar.THURSDAY:
                return 'jueves'
            case Calendar.FRIDAY:
                return 'viernes'
            case Calendar.SATURDAY:
                return 'sabado'
        }
    }
}
