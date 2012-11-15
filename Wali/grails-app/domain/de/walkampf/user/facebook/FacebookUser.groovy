package de.walkampf.user.facebook


import de.walkampf.user.SecUser

class FacebookUser {

	long uid
    String accessToken
	
	static belongsTo = [user: SecUser]

	static constraints = {
		uid unique: true
	}
	
	@Override
	public String toString() {
		return 'me'
	}
}
