package esu

class ArticuloController {

    static defaultAction = "lista"

    def articuloService

    def lista() {
        log.debug("Lista de articulos")
        return articuloService.lista(params)
    }

}
