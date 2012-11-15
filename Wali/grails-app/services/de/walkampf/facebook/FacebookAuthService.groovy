package de.walkampf.facebook

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils;
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.facebook.api.impl.FacebookTemplate

import com.the6hours.grails.springsecurity.facebook.FacebookAuthToken;

import de.walkampf.user.SecUser;
import de.walkampf.user.SecUserSecRole;
import de.walkampf.user.facebook.FacebookUser;

class FacebookAuthService {
	static final List NO_ROLES = [new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)]
	def facebookAPIService

	SecUser createAppUser(FacebookUser user, FacebookAuthToken token) {
		log.info("Create app user for facebook user $token.uid")
		SecUser userInstance = new SecUser()
		userInstance.username = "app_$token.uid"
		userInstance.password = token.accessToken.accessToken
		userInstance.enabled = true
		userInstance.accountExpired = false
		userInstance.accountLocked = false
		userInstance.passwordExpired = false
		FacebookProfile profile = facebookAPIService.getProfile(token.accessToken.accessToken)
		//userInstance.username = profile.username
		userInstance.firstname = profile.firstName
		userInstance.lastname = profile.lastName
		userInstance.email = profile.email
		
		userInstance.save(failOnError: true)
		
		return userInstance
	}
	
   
}
