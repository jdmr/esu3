package esu

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_AUTOR'])
class ArticuloController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def inicioService
    def springSecurityService

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort) {
            params.sort = 'lastUpdated'
            params.order = 'desc'
        }
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

        List<Publicacion> publicaciones = Publicacion.findAll('from Publicacion p where p.es.id = :articuloId', [articuloId: articuloInstance.id])
        [articuloInstance: articuloInstance, publicaciones: publicaciones]
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

                def hoy = Calendar.instance
                def tags = inicioService.inicio(hoy)
                Publicacion publicacion = new Publicacion(anio: new Integer(tags.anio), trimestre: tags.trimestre, leccion: tags.leccion)
                List<Publicacion> publicaciones = Publicacion.findAll('from Publicacion p where p.es.id = :articuloId', [articuloId: articuloInstance.id])
                List<Integer> anios = []
                Integer anioActual = hoy.get(Calendar.YEAR)
                for (anio in 2011..(anioActual + 1)) {
                    anios << anio
                }
                [articuloInstance: articuloInstance, usuarios: usuarios, publicacion: publicacion, publicaciones: publicaciones, anios: anios]
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

    def nuevaPublicacion() {
        def articulo
        switch (request.method) {
            case 'GET':

                articulo = Articulo.get(params.id)
                if (!articulo) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'articulo.label', default: 'Articulo'), params.id])
                    redirect action: 'list'
                    return
                }

                def hoy = Calendar.instance
                def tags = inicioService.inicio(hoy)
                Publicacion publicacion = new Publicacion(anio: new Integer(tags.anio), trimestre: tags.trimestre, leccion: tags.leccion)
                List<Integer> anios = []
                Integer anioActual = hoy.get(Calendar.YEAR)
                for (anio in 2011..(anioActual + 1)) {
                    anios << anio
                }
                return [publicacion: publicacion, anios: anios, articulo: articulo]
            case 'POST':
                log.debug("Obteniendo trimestre")
                Trimestre trimestre = Trimestre.findByNombre("${params.anio}${params.trimestre}")
                log.debug("Obteniendo articulo ${params.articuloId}")
                articulo = Articulo.get(params.articuloId)
                log.debug(articulo)
                Publicacion publicacion = new Publicacion(params)
                publicacion.es = articulo
                publicacion.padre = trimestre
                publicacion.fecha = new Date()
                publicacion.editor = springSecurityService.currentUser
                log.debug("Creando publicacion ${publicacion}")
                publicacion.save()
                redirect(action: 'show', id: params.articuloId)
                break
        }
    }

    def eliminaPublicacion() {
        def publicacion = Publicacion.get(params.id)
        if (!publicacion) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicacion.label', default: 'Publicación'), params.id])
            redirect action: 'list'
            return
        }

        def articulo
        try {
            articulo = publicacion.es
            publicacion.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'publicacion.label', default: 'Publicación'), params.id])
            redirect action: 'show', id: articulo.id
        } catch(DataIntegrityViolationException e) {
            log.error("No se pudo eliminar la publicacion ${params.id}", e)
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'publicacion.label', default: 'Publicacion'), params.id])
            redirect action: 'show', id: articulo.id
        }
    }

    def buscar() {
        if (params.filter) {
            def articulos = Articulo.findAllByTituloIlike("%${params.filter}%")
            render view: 'list', model: [articuloInstanceList: articulos, articuloInstanceTotal: articulos.size()]
        } else {
            redirect(action: 'list', params: params)
        }
    }
}
