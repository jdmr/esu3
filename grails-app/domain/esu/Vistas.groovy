package esu

class Vistas {

    int cantidad
    Date fecha

    static belongsTo = [articulo: Articulo]

    static constraints = {
    }

    String toString() {
        return "$articulo.titulo por $articulo.autor : $cantidad : $fecha"
    }
}
