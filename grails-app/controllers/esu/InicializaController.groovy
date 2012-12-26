package esu

class InicializaController {

    def inicializaService

    def index() {
        log.info('Inicializando esu')
        inicializaService.editores()
        redirect(uri: '/')
    }
}
