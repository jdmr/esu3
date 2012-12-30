package esu

class Usuario implements Serializable {

	transient springSecurityService

	String username
	String password
    String nombre
    String apellido
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
    Date dateCreated
    Date lastUpdated
    Integer articulos = 0
    Integer publicaciones = 0

	static constraints = {
		username blank: false, unique: true, email: true
		password blank: false
        nombre blank: false
        apellido blank: false
	}

	static mapping = {
        table 'usuarios'
		password column: '`password`'
	}

	Set<Rol> getAuthorities() {
		UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

    static Integer countByRole(String role) {
        List results = executeQuery('select count(u) from Usuario u, UsuarioRol ur, Rol r where ur.usuario.id = u.id and ur.rol.id = r.id and r.authority = :authority', [authority: role])
        return results[0]
    }

    String getNombreCompleto() {
        return "$nombre $apellido"
    }
}
