package esu

class Articulo implements Serializable {
    String titulo
    String descripcion
    String contenido
    Date dateCreated
    Date lastUpdated

    static belongsTo = [autor: Usuario]

    static constraints = {
        titulo blank: false
        descripcion nullable: true, maxSize: 10000
        contenido blank: false, maxSize: 1000000
    }

    static mapping = {
        table 'articulos'
    }

    String toString() {
        return titulo
    }
}
