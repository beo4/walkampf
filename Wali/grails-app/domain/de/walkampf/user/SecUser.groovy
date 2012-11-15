package de.walkampf.user

class SecUser {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	String firstname
	String lastname
	String email

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
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
	
	@Override
	public String toString() {
		return firstname + ' ' + lastname;
	}
}
