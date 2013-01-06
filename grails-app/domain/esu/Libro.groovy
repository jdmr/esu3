package esu

class Libro {
    String nombre
    Integer capitulos

    static constraints = {
        nombre blank: false, unique: true
    }

    static mapping = {
        table 'libros'
        version(false)
    }

}
