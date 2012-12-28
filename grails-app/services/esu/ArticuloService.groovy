package esu

class ArticuloService {

    def lista(params) {
        return [articulos: Articulo.list(params), total: Articulo.count()]
    }

    def profundiza(params) {

    }

    def tema(String tipo, String anio, String trimestre, String leccion, String tema) {
        Integer aniol = new Integer(anio)
        Publicacion publicacion = Publicacion.find("from Publicacion where anio = :anio and trimestre = :trimestre and leccion = :leccion and tema = :tema and tipo = :tipo and estatus = 'PUBLICADO'", [anio: aniol, trimestre: trimestre, leccion: leccion, tipo: tipo, tema: tema])
        if (publicacion) {
            publicacion.titulo = publicacion.es.titulo
            publicacion.descripcion = publicacion.es.descripcion
            publicacion.contenido = publicacion.es.contenido
            publicacion.autor = publicacion.es.autor
        }
        return [publicacion: publicacion]
    }

}
