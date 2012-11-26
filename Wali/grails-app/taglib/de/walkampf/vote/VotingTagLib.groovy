package de.walkampf.vote

class VotingTagLib {

	static namespace = "walkampf"
	
	def voting = { attrs, body ->
		out << '<div class="btn-group btn-group-vertical" data-toggle="buttons-radio">'
		out << '<button type="button" class="btn">1</button>'
		out << '<button type="button" class="btn">2</button>'
		out << '</div>'
	}
	
}
