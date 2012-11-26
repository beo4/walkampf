package de.walkampf.vote

import de.walkampf.user.SecUser;
import de.walkampf.party.Party;

class Vote {
	
	static belongsTo = [party:Party, user:SecUser]
	
	Party party
	SecUser user

    static constraints = {
    }
}
