package esu

class Articulo implements Serializable {
    String titulo
    String contenido
    Date dateCreated
    Date lastUpdated

    static belongsTo = [autor: Usuario]

    static constraints = {
        titulo blank: false
        contenido blank: false
    }

    static mapping = {
        table 'articulos'
    }

    String toString() {
        return titulo
    }
}
