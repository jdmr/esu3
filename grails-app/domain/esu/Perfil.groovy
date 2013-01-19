package esu

class Perfil implements Serializable {
    String texto
    String nombreImagen
    String tipoContenido
    Long tamano
    byte[] archivo
    List articulos = []

    static belongsTo = [usuario: Usuario]

    static transients = ['articulos']

    static constraints = {
        texto nullable: true, maxSize: 2000
        nombreImagen nullable: true
        tipoContenido nullable: true
        tamano nullable: true
        archivo nullable: true
    }

    static mapping = {
        table 'perfiles'
    }
}
