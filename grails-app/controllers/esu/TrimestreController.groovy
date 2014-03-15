package esu

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured('ROLE_ADMIN')
class TrimestreController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [trimestreInstanceList: Trimestre.list(params), trimestreInstanceTotal: Trimestre.count()]
    }

    def create() {
        switch (request.method) {
            case 'GET':
                [trimestreInstance: new Trimestre(params)]
                break
            case 'POST':
                def trimestreInstance = new Trimestre(params)
                if (!trimestreInstance.save(flush: true)) {
                    render view: 'create', model: [trimestreInstance: trimestreInstance]
                    return
                }

                flash.message = message(code: 'default.created.message', args: [message(code: 'trimestre.label', default: 'Trimestre'), trimestreInstance.id])
                redirect action: 'show', id: trimestreInstance.id
                break
        }
    }

    def show() {
        def trimestreInstance = Trimestre.get(params.id)
        if (!trimestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trimestre.label', default: 'Trimestre'), params.id])
            redirect action: 'list'
            return
        }

        [trimestreInstance: trimestreInstance]
    }

    def edit() {
        switch (request.method) {
            case 'GET':
                def trimestreInstance = Trimestre.get(params.id)
                if (!trimestreInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'trimestre.label', default: 'Trimestre'), params.id])
                    redirect action: 'list'
                    return
                }

                [trimestreInstance: trimestreInstance]
                break
            case 'POST':
                def trimestreInstance = Trimestre.get(params.id)
                if (!trimestreInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'trimestre.label', default: 'Trimestre'), params.id])
                    redirect action: 'list'
                    return
                }

                if (params.version) {
                    def version = params.version.toLong()
                    if (trimestreInstance.version > version) {
                        trimestreInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
                                [message(code: 'trimestre.label', default: 'Trimestre')] as Object[],
                                "Another user has updated this Trimestre while you were editing")
                        render view: 'edit', model: [trimestreInstance: trimestreInstance]
                        return
                    }
                }

                trimestreInstance.properties = params

                if (!trimestreInstance.save(flush: true)) {
                    render view: 'edit', model: [trimestreInstance: trimestreInstance]
                    return
                }

                flash.message = message(code: 'default.updated.message', args: [message(code: 'trimestre.label', default: 'Trimestre'), trimestreInstance.id])
                redirect action: 'show', id: trimestreInstance.id
                break
        }
    }

    def delete() {
        def trimestreInstance = Trimestre.get(params.id)
        if (!trimestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trimestre.label', default: 'Trimestre'), params.id])
            redirect action: 'list'
            return
        }

        try {
            trimestreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'trimestre.label', default: 'Trimestre'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'trimestre.label', default: 'Trimestre'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
