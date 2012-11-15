package de.walkampf.user

import org.springframework.security.core.GrantedAuthority;

class SecRole implements GrantedAuthority{

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
