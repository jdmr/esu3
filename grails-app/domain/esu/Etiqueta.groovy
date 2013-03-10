package esu

class Etiqueta implements Serializable {
    String nombre
    Integer articulos

    static searchable = true

    static constraints = {
    }

    static mapping = {
        table('etiquetas')
    }

}
