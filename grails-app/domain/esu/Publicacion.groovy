package esu

class Publicacion {
    Long anio
    String trimestre
    String leccion
    String dia
    String tipo
    String tema
    String estatus = 'PUBLICADO'
    Date fecha
    Date dateCreated
    Date lastUpdated

    static belongsTo = [editor: Usuario, es:Articulo, padre: Trimestre]

    static constraints = {
        anio min: 2011l
        trimestre blank: false, maxSize: 2, inList: ['t1','t2','t3','t4']
        leccion blank: false, maxSize: 3, inList: ['l01','l02','l03','l04','l05','l06','l07','l08','l09','l10','l11','l12','l13','l14']
        dia nullable: true, maxSize: 10, inList: ['domingo','lunes','martes','miercoles','jueves','viernes','sabado']
        tipo blank: false, maxSize: 10, inList: ['comunica','dialoga','leccion','versiculo','video','imagen','jovenes']
        tema nullable: true
        estatus blank: false, maxSize: 10, inList: ['PUBLICADO','PENDIENTE','RECHAZADO']
    }

    static mapping = {
        table 'publicaciones'
    }

    String toString() {
        return "$anio $trimestre $leccion $dia $tipo"
    }
}
