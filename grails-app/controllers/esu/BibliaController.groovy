package esu

import grails.converters.JSON

class BibliaController {

    def index() {
    }

    def ver() {
        log.debug("Buscando por $params")
        Long libro = new Long(params.libro)
        Integer capitulo = (params.capitulo)?new Integer(params.capitulo):1
        Integer versiculo = (params.versiculo)?new Integer(params.versiculo):1

        Long id
        List<Versiculo> versiculos
        List<Map> ids = Versiculo.executeQuery("select new map(id as id) from Versiculo where libro.id = :libro and capitulo = :capitulo and versiculo = :versiculo", [libro:libro, capitulo:capitulo, versiculo:versiculo])
        for(key in ids) {
            id = key.id
            break;
        }
        redirect(action: 'vers', id: id)
    }

    def vers() {
        Long id = new Long(params.id)
        List<Versiculo> versiculos = Versiculo.executeQuery("select new map(v.id as id, v.libro.nombre as nombre, v.capitulo as capitulo, v.versiculo as versiculo, v.texto as texto) from Versiculo v where v.id between :inicio and :fin order by v.id", [inicio:id, fin:id+4])
        render versiculos as JSON
    }
}
