<%@page import="de.walkampf.party.Party"%>
<div class="input-prepend">
	
	<div class="btn-group btn-group-vertical" data-toggle="buttons-radio">
<%
	def party = Party.listOrderByRank()
	party.each(){
		out << '<button type="button" class="btn">' + it.shortname + '</button>'
	}
%>
	</div>
</div>