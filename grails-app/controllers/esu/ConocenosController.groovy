package esu

class ConocenosController {

    static defaultAction = "nosotros"

    def nosotros() {
    }

    def equipo() {
        List<Perfil> perfiles = Perfil.list()
        for(Perfil perfil : perfiles) {
            List articulos = Publicacion.executeQuery("select new map(p.es.titulo as titulo, p.fecha as fecha, p.anio as anio, p.trimestre as trimestre, p.leccion as leccion, p.tema as tema, p.es.id as id, p.tipo as tipo) from Publicacion p where p.es.autor.id = :autorId and p.estatus = 'PUBLICADO' and (p.tipo = 'comunica' or p.tipo = 'dialoga')",[autorId: perfil.usuario.id])
            perfil.articulos = articulos
        }
        return [perfiles: perfiles]
    }

    def contacto() {}

}
