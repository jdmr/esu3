package esu

class Publicacion implements Serializable {
    Integer anio
    String trimestre
    String leccion
    String dia
    String tipo
    String tema
    String estatus = 'PUBLICADO'
    Date fecha
    Date dateCreated
    Date lastUpdated
    String titulo
    String descripcion
    String contenido
    Usuario autor

    static searchable = true

    static belongsTo = [editor: Usuario, es: Articulo, padre: Trimestre]

    static transients = ['titulo', 'descripcion', 'contenido', 'autor']

    static constraints = {
        anio min: 2011
        trimestre blank: false, maxSize: 2, inList: ['t1', 't2', 't3', 't4']
        leccion blank: false, maxSize: 3, inList: ['l01', 'l02', 'l03', 'l04', 'l05', 'l06', 'l07', 'l08', 'l09', 'l10', 'l11', 'l12', 'l13', 'l14']
        dia nullable: true, maxSize: 10, inList: ['domingo', 'lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado']
        tipo blank: false, maxSize: 10, inList: ['comunica', 'dialoga', 'leccion', 'versiculo', 'video', 'imagen', 'jovenes']
        tema nullable: true, inList: ['tema1','tema2','tema3','tema4','tema5']
        estatus blank: false, maxSize: 10, inList: ['PUBLICADO', 'PENDIENTE', 'RECHAZADO']
    }

    static mapping = {
        table 'publicaciones'
    }

    String toString() {
        return "$anio $trimestre $leccion $dia $tipo"
    }

    static namedQueries = {
        def buscaPorDia = { a, t, l, d, tipo ->
            eq('anio', a)
            eq('trimestre', t)
            eq('leccion', l)
            eq('dia', l)
            eq('tipo', tipo)
            eq('estatus', 'PUBLICADO')
        }
    }
}
