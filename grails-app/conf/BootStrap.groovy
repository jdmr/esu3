import esu.Rol
import esu.Trimestre
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
            Usuario usuarioAdmin = new Usuario(username: 'admin@um.edu.mx', password: 'admin', nombre:'Usuario', apellido: 'Administrador').save(flush: true)
            UsuarioRol.create(usuarioAdmin, admin, true)
        }

        Integer editores = Usuario.countByRole('ROLE_EDITOR')
        if (editores == 0) {
            Usuario usuarioEditor = new Usuario(username: 'editor@um.edu.mx', password: 'editor', nombre:'Usuario', apellido: 'Editor').save(flush: true)
            UsuarioRol.create(usuarioEditor, editor, true)
        }

        Integer autores = Usuario.countByRole('ROLE_AUTOR')
        if (autores == 0) {
            Usuario usuarioAutor = new Usuario(username: 'autor@um.edu.mx', password: 'autor', nombre:'Usuario', apellido: 'Autor').save(flush: true)
            UsuarioRol.create(usuarioAutor, autor, true)
        }

        Integer usuarios = Usuario.countByRole('ROLE_USER')
        if (usuarios == 0) {
            Usuario usuario = new Usuario(username: 'usuario@um.edu.mx', password: 'usuario', nombre:'Usuario', apellido: 'Normal').save(flush: true)
            UsuarioRol.create(usuario, user, true)
        }

        log.debug('Trimestres')

        Integer trimestres = Trimestre.count()
        if (trimestres == 0) {
            new Trimestre(
                    nombre: '2011t2'
                    , fecha: new GregorianCalendar(2011, Calendar.MARCH, 26).time
            ).save(flush: true)
            new Trimestre(
                    nombre: '2011t3'
                    , fecha: new GregorianCalendar(2011, Calendar.JUNE, 25).time
            ).save(flush: true)
            new Trimestre(
                    nombre: '2011t4'
                    , fecha: new GregorianCalendar(2011, Calendar.SEPTEMBER, 24).time
            ).save(flush: true)
            new Trimestre(
                    nombre: '2012t1'
                    , fecha: new GregorianCalendar(2011, Calendar.DECEMBER, 31).time
            ).save(flush: true)
            new Trimestre(
                    nombre: '2012t2'
                    , fecha: new GregorianCalendar(2012, Calendar.MARCH, 31).time
            ).save(flush: true)
            new Trimestre(
                    nombre: '2012t3'
                    , fecha: new GregorianCalendar(2012, Calendar.JUNE, 30).time
            ).save(flush: true)
            new Trimestre(
                    nombre: '2012t4'
                    , fecha: new GregorianCalendar(2012, Calendar.SEPTEMBER, 29).time
            ).save(flush: true)
            new Trimestre(
                    nombre: '2013t1'
                    , fecha: new GregorianCalendar(2012, Calendar.DECEMBER, 29).time
            ).save(flush: true)
        }

        log.info('ESU ha iniciado')
    }
    def destroy = {
    }
}
