package esu

class UsuarioService {

    def sessionFactory

    Map lista(params) {
        return [lista: Usuario.list(params), total: Usuario.count()]
    }

    Usuario obtiene(id) {
        return Usuario.get(id)
    }

    Usuario obtienePorUsername(String email) {
        return Usuario.findByUsername(email)
    }

    Usuario crea(Usuario usuario, List roles) {
        usuario.save(flush: true)
        for(rol in roles) {
            UsuarioRol.create(usuario, rol, true)
        }
        return usuario
    }

    Usuario actualiza(Usuario usuario, List roles) {
        usuario.save(flush: true)
        if (roles) {
            UsuarioRol.removeAll(usuario)
            sessionFactory.currentSession.flush()

            for(rol in roles) {
                UsuarioRol.create(usuario, rol, true)
            }
        }
        return usuario
    }

    String elimina(Long id) {
        Usuario usuario = Usuario.get(id)
        String nombre = usuario.username
        usuario.delete(flush: true)
        return nombre
    }
}
