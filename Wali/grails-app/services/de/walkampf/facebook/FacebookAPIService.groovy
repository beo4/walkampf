package de.walkampf.facebook

import org.springframework.social.facebook.api.FacebookProfile
import org.springframework.social.facebook.api.impl.FacebookTemplate
import org.springframework.social.facebook.api.Facebook

class FacebookAPIService {

    FacebookProfile getProfile(String accessToken) {
        Facebook facebook = new FacebookTemplate(accessToken)
        FacebookProfile fbProfile = facebook.userOperations().userProfile
        return fbProfile
    }
}
