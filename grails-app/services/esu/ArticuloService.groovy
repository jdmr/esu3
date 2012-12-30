package esu

import java.text.NumberFormat

class ArticuloService {

    def lista(params) {
        return [articulos: Articulo.list(params), total: Articulo.count()]
    }

    def tema(String tipo, String anio, String trimestre, String leccion, String tema) {
        List<Map> articulos
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
        return [publicacion: publicacion, articulos: resultado, publicaciones: publicaciones]
    }

    def leccion(String anio, String trimestre, String leccion, String dia) {
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

            NumberFormat nf = NumberFormat.instance
            Trimestre t = Trimestre.find("from Trimestre where nombre = :nombre",[nombre:"${anio}${trimestre}"])
            Calendar cal = new GregorianCalendar()
            cal.time = t.inicia
            cal.set(Calendar.DAY_OF_WEEK, obtieneDia(dia))
            if (dia.equals('sabado')) {
                cal.add(Calendar.WEEK_OF_YEAR, ((Long)nf.parse(leccion.substring(1) + 1)).intValue())
            } else {
                cal.add(Calendar.WEEK_OF_YEAR, ((Long)nf.parse(leccion.substring(1))).intValue())
            }
            hoy = cal.time

            versiculo = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = 'versiculo' and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion])
            versiculo.contenido = versiculo.es.contenido

            dialoga = Publicacion.findAll("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'dialoga'])
            for(articulo in dialoga) {
                log.debug("$articulo $articulo.es")
                articulo.titulo = articulo.es.titulo
                articulo.descripcion = articulo.es.descripcion
                articulo.contenido = articulo.es.contenido
                articulo.autor = articulo.es.autor
            }

            comunica = Publicacion.findAll("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: 'comunica'])
            for(articulo in comunica) {
                log.debug("$articulo $articulo.es")
                articulo.titulo = articulo.es.titulo
                articulo.descripcion = articulo.es.descripcion
                articulo.contenido = articulo.es.contenido
                articulo.autor = articulo.es.autor
            }
            
        }

        return [publicacion: publicacion, versiculo: versiculo, hoy: hoy, dialoga:dialoga, comunica:comunica]
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

}
