package esu

class BuscarController {

    def articuloService

    def index() {
        redirect(action:'articulo', params: params)
    }

    def articulo() {
        log.debug("Buscando por ${params.filtro}")
        def searchResult = Articulo.search(properties: ['titulo','descripcion','contenido'], max:(params.max?params.max:10), offset: (params.offset?params.offset:0)) {
            must(queryString(params.filtro))
        }
        searchResult.filtro = params.filtro
        return searchResult
    }

    def ver() {
        log.debug("Obteniendo articulo ${params.id}")
        Publicacion publicacion = articuloService.obtienePorId(new Long(params.id))
        switch(publicacion.tipo) {
            case 'dialoga':
                redirect(mapping: 'dialoga', params: [anio:publicacion.anio,trimestre:publicacion.trimestre,leccion:publicacion.leccion,tema:publicacion.tema])
                break;
            case 'comunica':
                redirect(mapping: 'comunica', params: [anio:publicacion.anio,trimestre:publicacion.trimestre,leccion:publicacion.leccion,tema:publicacion.tema])
                break;
            case 'leccion':
                redirect(mapping: 'estudia', params: [anio:publicacion.anio,trimestre: publicacion.trimestre, leccion: publicacion.leccion, dia: publicacion.dia])
                break;
        }
        return
    }
}
