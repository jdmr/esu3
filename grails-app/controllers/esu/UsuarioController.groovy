package esu

class UsuarioController {

    static defaultAction = 'lista'

    def usuarioService

    def lista() {
        return usuarioService.lista(params)
    }

    def ver() {
        log.debug("Params: ${params}")
        def usuario = usuarioService.obtiene(params.id)
        return [usuario: usuario]
    }

    def username() {
        def usuario = usuarioService.obtienePorUsername(params.id)
        render (view: 'ver', model: [usuario: usuario])
    }

    def nuevo() {
        log.debug("Nuevo usuario")
        def roleMap = obtieneRoles(null)
        Usuario usuario = new Usuario()
        return [usuario: usuario, roles: roleMap]
    }

    def obtieneRoles = { usuario ->
        List roles = Rol.list()
        roles.sort { r1, r2 ->
            r1.authority <=> r2.authority
        }
        Set userRoleNames = []
        for (role in usuario?.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<Rol, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }
    }
}
