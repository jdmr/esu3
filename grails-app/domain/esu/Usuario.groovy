package esu

class Usuario {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false

	static constraints = {
		username blank: false, unique: true, email: true
		password blank: false
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
}
