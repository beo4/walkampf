package de.walkampf.facebook

import de.walkampf.user.SecUser;
import de.walkampf.user.facebook.FacebookUser;
import grails.plugins.springsecurity.Secured;

class WhoamiController {
	def springSecurityService
	def facebookAuthService

	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def index() {
		def user = SecUser.get(springSecurityService.principal.id)
		FacebookUser fbUser = FacebookUser.findByUser(user)
		
		[fbUser]
		
	}
}
