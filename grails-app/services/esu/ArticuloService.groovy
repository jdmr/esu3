package esu

import java.text.NumberFormat

class ArticuloService {

    def inicioService

    def lista(params) {
        return [articulos: Articulo.list(params), total: Articulo.count()]
    }

    def tema(String tipo, String anio, String trimestre, String leccion, String tema, String dia) {
        List<Map> articulos = []
        Integer aniol = new Integer(anio)
        Publicacion publicacion = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tema = :tema and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: tipo, tema: tema])
        if (publicacion) {
            publicacion.titulo = publicacion.es.titulo
            publicacion.descripcion = publicacion.es.descripcion
            publicacion.contenido = publicacion.es.contenido
            publicacion.autor = publicacion.es.autor

            articulos = Publicacion.executeQuery("select new map(p.es.titulo as titulo, p.fecha as fecha, p.anio as anio, p.trimestre as trimestre, p.leccion as leccion, p.tema as tema, p.es.id as id, p.tipo as tipo) from Publicacion p where p.es.autor.id = :autorId and p.estatus = 'PUBLICADO'",[autorId: publicacion.es.autor.id])
        }
        Map<Long, Long> filtro = [:]
        List<Map> resultado = []
        for(articulo in articulos) {
            Integer id = filtro.get(articulo.id)
            if (!id) {
                resultado << articulo
                filtro.put(articulo.id, articulo.id)
            }
        }

        List<Publicacion> publicaciones = Publicacion.findAll("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tema != :tema and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: tipo, tema: tema])
        for(otro in publicaciones) {
            otro.titulo = otro.es.titulo
            otro.descripcion = otro.es.descripcion
            otro.autor = otro.es.autor
        }

        Publicacion leccion1 = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and dia = :dia and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'leccion', dia: dia])
        log.debug("Leccion: $leccion1")
        if (leccion1) {
            leccion1.titulo = leccion1.es.titulo
            leccion1.descripcion = leccion1.es.descripcion
            leccion1.contenido = leccion1.es.contenido
        }

        log.debug("FECHAS")
        NumberFormat nf = NumberFormat.instance
        Trimestre t = Trimestre.find("from Trimestre where nombre = :nombre",[nombre:"${anio}${trimestre}"])
        log.debug("TRIMESTRE: $t")
        Calendar cal = new GregorianCalendar()
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
        log.debug("HOY3: ${cal.time}")


        return [publicacion: publicacion, articulos: resultado, publicaciones: publicaciones, leccion: leccion1, hoy: hoy]
    }

    def leccion(String anio, String trimestre, String leccion, String dia) {
        Map ayer
        Map manana
        List<Publicacion> dialoga
        List<Publicacion> comunica
        Date hoy
        Publicacion versiculo
        Integer aniol = new Integer(anio)
        Publicacion publicacion = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and dia = :dia and tipo = 'leccion' and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, dia: dia])
        if (publicacion) {
            publicacion.titulo = publicacion.es.titulo
            publicacion.descripcion = publicacion.es.descripcion
            publicacion.contenido = publicacion.es.contenido
            publicacion.autor = publicacion.es.autor

            log.debug("FECHAS")
            NumberFormat nf = NumberFormat.instance
            Trimestre t = Trimestre.find("from Trimestre where nombre = :nombre",[nombre:"${anio}${trimestre}"])
            log.debug("TRIMESTRE: $t")
            Calendar cal = new GregorianCalendar()
            cal.time = t.inicia
            log.debug("HOY1: ${cal.time}")
            cal.add(Calendar.SECOND, 1)
            cal.set(Calendar.DAY_OF_WEEK, obtieneDia(dia))
            log.debug("HOY2: ${cal.time} : ${leccion}")
            int weeks = ((Long)nf.parse(leccion.substring(1))).intValue()
            if (dia.equals('domingo')) {
                weeks--
            }
            log.debug("WEEKS3: ${cal.get(Calendar.WEEK_OF_YEAR)} + $weeks")
            cal.add(Calendar.WEEK_OF_YEAR, weeks)
            log.debug("WEEKS4: ${cal.get(Calendar.WEEK_OF_YEAR)}")
            hoy = cal.time
            log.debug("HOY3: ${cal.time}")


            cal.add(Calendar.DAY_OF_MONTH, -1)
            Date fechaAyer = cal.time
            log.debug("Hoy: $hoy | Ayer: $fechaAyer")
            ayer = inicioService.inicio(cal)
            log.debug("Ayer: $ayer")

            cal.add(Calendar.DAY_OF_MONTH, 2)
            Date fechaManana = cal.time
            log.debug("Hoy: $hoy | Manana: $fechaManana")
            manana = inicioService.inicio(cal)
            log.debug("Manana: $manana")

            versiculo = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = 'versiculo' and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion])
            versiculo.contenido = versiculo.es.contenido

            dialoga = Publicacion.findAll("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'dialoga'])
            for(articulo in dialoga) {
                articulo.titulo = articulo.es.titulo
                articulo.descripcion = articulo.es.descripcion
                articulo.contenido = articulo.es.contenido
                articulo.autor = articulo.es.autor
            }

            comunica = Publicacion.findAll("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'comunica'])
            for(articulo in comunica) {
                articulo.titulo = articulo.es.titulo
                articulo.descripcion = articulo.es.descripcion
                articulo.contenido = articulo.es.contenido
                articulo.autor = articulo.es.autor
            }
            
        }

        return [publicacion: publicacion, versiculo: versiculo, hoy: hoy, dialoga:dialoga, comunica:comunica, ayer: ayer, manana: manana]
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
        }
    }

    def obtienePorId(id) {
        Publicacion publicacion = Publicacion.find("from Publicacion where es.id = :articuloId",[articuloId: id])
        return publicacion
    }
}
