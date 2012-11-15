import de.walkampf.user.SecRole;

class BootStrap {

    def init = { servletContext ->
		
		def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
		def userFacebookRole = SecRole.findByAuthority('ROLE_FACEBOOK') ?: new SecRole(authority: 'ROLE_FACEBOOK').save(failOnError: true)
    }
    def destroy = {
    }
}
