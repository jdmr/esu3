package esu

class Perfil implements Serializable {
    String texto
    String nombreImagen
    String tipoContenido
    Long tamano
    byte[] archivo

    static constraints = {
        texto nullable: true, maxSize: 1000
        nombreImagen nullable: true
        tipoContenido nullable: true
        tamano nullable: true
        archivo nullable: true
    }

    static mapping = {
        table 'perfiles'
    }
}
