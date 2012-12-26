package esu

class Trimestre {
    String nombre
    Date fecha
    Boolean publicado = true

    static constraints = {
        nombre size: 6..6, blank: false
    }

    static mapping = {
        table 'trimestres'
    }
}
