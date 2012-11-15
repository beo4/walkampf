package de.walkampf.vote

import de.walkampf.user.SecUser;
import de.walkampf.party.Party;

class Vote {
	
	static belongsTo = [party:Party, user:SecUser]

    static constraints = {
    }
}
