class UrlMappings {

    static excludes = ["/images/*", "/css/*", "/js/*"]

    static mappings = {

        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        name inicio: "/inicio/$anio/$trimestre/$leccion/$dia"(controller: "inicio", action: "ver")

        name estudia: "/estudia/$anio/$trimestre/$leccion/$dia"(controller: "estudia", action: "ver")

        name dialoga: "/profundiza/$anio/$trimestre/$leccion/$tema"(controller: "profundiza", action: "ver")

        name comunica: "/comparte/$anio/$trimestre/$leccion/$tema"(controller: "comparte", action: "ver")

        name biblia: "/biblia/$libro/$capitulo?/$versiculo?"(controller: "biblia", action: "ver")

        "/biblia/vers/$id"(controller: 'biblia', action: 'vers')

        "/"(controller: "inicio")

        "500"(view: '/error')
    }
}
