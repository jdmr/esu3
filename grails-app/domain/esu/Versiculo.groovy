package esu

class Versiculo {
    Integer capitulo
    Integer versiculo
    String texto
    String nombre

    static belongsTo = [libro: Libro]

    static transients = ['nombre']

    static constraints = {
    }

    static mapping = {
        table 'rv2000'
        version(false)
    }

    public Versiculo() {}

    public Versiculo(Long id, String nombre, Integer capitulo, Integer versiculo, String texto) {
        this.id = id
        this.nombre = nombre
        this.capitulo = capitulo
        this.versiculo = versiculo
        this.texto = texto
    }

}
