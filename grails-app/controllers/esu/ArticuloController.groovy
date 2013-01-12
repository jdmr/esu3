package esu

import org.springframework.dao.DataIntegrityViolationException

class ArticuloController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.sort = 'lastUpdated'
        params.order = 'desc'
        [articuloInstanceList: Articulo.list(params), articuloInstanceTotal: Articulo.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
            def usuarios = Usuario.list()
        	[articuloInstance: new Articulo(params), usuarios: usuarios]
			break
		case 'POST':
	        def articuloInstance = new Articulo(params)
	        if (!articuloInstance.save(flush: true)) {
	            render view: 'create', model: [articuloInstance: articuloInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'articulo.label', default: 'Articulo'), articuloInstance.id])
	        redirect action: 'show', id: articuloInstance.id
			break
		}
    }

    def show() {
        def articuloInstance = Articulo.get(params.id)
        if (!articuloInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'articulo.label', default: 'Articulo'), params.id])
            redirect action: 'list'
            return
        }

        [articuloInstance: articuloInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def articuloInstance = Articulo.get(params.id)
	        if (!articuloInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'articulo.label', default: 'Articulo'), params.id])
	            redirect action: 'list'
	            return
	        }

            def usuarios = Usuario.list()
            [articuloInstance: articuloInstance, usuarios: usuarios]
			break
		case 'POST':
	        def articuloInstance = Articulo.get(params.id)
	        if (!articuloInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'articulo.label', default: 'Articulo'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (articuloInstance.version > version) {
	                articuloInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'articulo.label', default: 'Articulo')] as Object[],
	                          "Another user has updated this Articulo while you were editing")
	                render view: 'edit', model: [articuloInstance: articuloInstance]
	                return
	            }
	        }

	        articuloInstance.properties = params

	        if (!articuloInstance.save(flush: true)) {
	            render view: 'edit', model: [articuloInstance: articuloInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'articulo.label', default: 'Articulo'), articuloInstance.id])
	        redirect action: 'show', id: articuloInstance.id
			break
		}
    }

    def delete() {
        def articuloInstance = Articulo.get(params.id)
        if (!articuloInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'articulo.label', default: 'Articulo'), params.id])
            redirect action: 'list'
            return
        }

        try {
            articuloInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'articulo.label', default: 'Articulo'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'articulo.label', default: 'Articulo'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
