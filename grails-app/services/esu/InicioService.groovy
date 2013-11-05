package esu

import org.joda.time.DateTime
import org.joda.time.Weeks

import java.text.NumberFormat
import java.text.SimpleDateFormat

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

        Publicacion podcast = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'podcast'])
        log.debug("Podcast: $podcast")
        if (podcast) {
            podcast.titulo = podcast.es.titulo
            podcast.descripcion = podcast.es.descripcion
            podcast.contenido = podcast.es.contenido
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

        NumberFormat nf = NumberFormat.instance
        Trimestre t = Trimestre.find("from Trimestre where nombre = :nombre",[nombre:"${anio}${trimestre}"])
        log.debug("TRIMESTRE: $t")
        Calendar cal = new GregorianCalendar(Locale.ENGLISH)
        cal.time = t.inicia
        log.debug("HOY1: ${cal.time}")
        cal.add(Calendar.SECOND, 1)
        cal.set(Calendar.DAY_OF_WEEK, obtieneDia(dia))
        log.debug("HOY2: ${cal.time} : ${leccion}")
        int weeks = ((Long)nf.parse(leccion.substring(1))).intValue()
        if (dia.equals('sabado')) {
            weeks--
        }
        log.debug("WEEKS3: ${cal.get(Calendar.WEEK_OF_YEAR)} + $weeks")
        cal.add(Calendar.WEEK_OF_YEAR, weeks)
        log.debug("WEEKS4: ${cal.get(Calendar.WEEK_OF_YEAR)}")
        Date hoy = cal.time

        return [leccion: leccion1, dialoga: dialoga, comunica: comunica, video: video, podcast: podcast, versiculo: versiculo, hoy: hoy]
    }

    def inicio(params) {
        def hoy = new GregorianCalendar(Locale.ENGLISH)
        return inicio(hoy)
    }

    def inicio(Calendar hoy) {
        log.debug("HOY: $hoy.time")

        Trimestre trimestre = Trimestre.find('from Trimestre where :hoy between inicia and termina and publicado = true', [hoy: hoy.time])
        log.debug(trimestre)

        DateTime a = new DateTime(trimestre.inicia)
        DateTime b = new DateTime(hoy)
        Weeks c = Weeks.weeksBetween(a, b)
        int weeks = c.weeks
        log.debug("WEEKS: $weeks")
        weeks++
        log.debug("WEEKS: $weeks")
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
            default:
                return 'sabado'
        }
    }

    Integer obtieneDia(String dia) {
        switch(dia) {
            case 'domingo':
                return Calendar.SUNDAY
            case 'lunes':
                return Calendar.MONDAY
            case 'martes':
                return Calendar.TUESDAY
            case 'miercoles':
                return Calendar.WEDNESDAY
            case 'jueves':
                return Calendar.THURSDAY
            case 'viernes':
                return Calendar.FRIDAY
            case 'sabado':
                return Calendar.SATURDAY
            default :
                return Calendar.SATURDAY
        }
    }

}
