<%@ page import="de.walkampf.vote.Vote" %>



<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'party', 'error')} required">
	<label for="party">
		<g:message code="vote.party.label" default="Party" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="party" name="party.id" from="${de.walkampf.party.Party.list()}" optionKey="id" required="" value="${voteInstance?.party?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="vote.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${de.walkampf.user.SecUser.list()}" optionKey="id" required="" value="${voteInstance?.user?.id}" class="many-to-one"/>
</div>

