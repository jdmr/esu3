package esu

class ArticuloService {

    def lista(params) {
        return [articulos: Articulo.list(params), total: Articulo.count()]
    }

    def profundiza(params) {

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

            articulos = Publicacion.executeQuery("select new map(p.es.titulo as titulo, p.fecha as fecha, p.anio as anio, p.trimestre as trimestre, p.leccion as leccion, p.tema as tema) from Publicacion p where p.es.autor.id = :autorId",[autorId: publicacion.es.autor.id])
        }
        return [publicacion: publicacion, articulos: articulos]
    }

    def leccion(String anio, String trimestre, String leccion, String dia) {
        Publicacion versiculo
        Integer aniol = new Integer(anio)
        Publicacion publicacion = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and dia = :dia and tipo = 'leccion' and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, dia: dia])
        if (publicacion) {
            publicacion.titulo = publicacion.es.titulo
            publicacion.descripcion = publicacion.es.descripcion
            publicacion.contenido = publicacion.es.contenido
            publicacion.autor = publicacion.es.autor

            versiculo = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tipo = 'versiculo' and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion])
            versiculo.contenido = versiculo.es.contenido
        }

        return [publicacion: publicacion, versiculo: versiculo]
    }

}
