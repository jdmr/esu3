import esu.Rol
import esu.Usuario
import esu.UsuarioRol

class BootStrap {

    def init = { servletContext ->
        log.info('Iniciando ESU')
        log.debug('Validando Roles')
        Rol admin = Rol.findByAuthority('ROLE_ADMIN')
        if (!admin) {
            admin = new Rol(authority: 'ROLE_ADMIN').save(flush: true)
        }
        Rol editor = Rol.findByAuthority('ROLE_EDITOR')
        if (!editor) {
            editor = new Rol(authority: 'ROLE_EDITOR').save(flush: true)
        }
        Rol autor = Rol.findByAuthority('ROLE_AUTOR')
        if (!autor) {
            autor = new Rol(authority: 'ROLE_AUTOR').save(flush: true)
        }
        Rol user = Rol.findByAuthority('ROLE_USER')
        if (!user) {
            user = new Rol(authority: 'ROLE_USER').save(flush: true)
        }

        Integer admins = Usuario.countByRole('ROLE_ADMIN')
        if (admins == 0) {
            Usuario usuarioAdmin = new Usuario(username: 'admin@um.edu.mx', password: 'admin').save(flush: true)
            UsuarioRol.create(usuarioAdmin, admin, true)
        }

        Integer editores = Usuario.countByRole('ROLE_EDITOR')
        if (editores == 0) {
            Usuario usuarioEditor = new Usuario(username: 'editor@um.edu.mx', password: 'editor').save(flush: true)
            UsuarioRol.create(usuarioEditor, editor, true)
        }

        Integer autores = Usuario.countByRole('ROLE_AUTOR')
        if (autores == 0) {
            Usuario usuarioAutor = new Usuario(username: 'autor@um.edu.mx', password: 'autor').save(flush: true)
            UsuarioRol.create(usuarioAutor, autor, true)
        }

        Integer usuarios = Usuario.countByRole('ROLE_USER')
        if (usuarios == 0) {
            Usuario usuario = new Usuario(username: 'usuario@um.edu.mx', password: 'usuario').save(flush: true)
            UsuarioRol.create(usuario, user, true)
        }

        log.info('ESU ha iniciado')
    }
    def destroy = {
    }
}
