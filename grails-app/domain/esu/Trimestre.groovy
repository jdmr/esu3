package esu

class Trimestre implements Serializable {
    String nombre
    Date inicia
    Date termina
    Boolean publicado = true

    static constraints = {
        nombre size: 6..6, blank: false
    }

    static mapping = {
        table 'trimestres'
    }

    String toString() {
        return nombre
    }
}
