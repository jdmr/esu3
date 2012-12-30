package esu

class Etiqueta implements Serializable {
    String nombre
    Integer articulos

    static constraints = {
    }

    static mapping = {
        table('etiquetas')
    }

}
