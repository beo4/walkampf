<%@ page import="de.walkampf.party.Party" %>



<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'color', 'error')} ">
	<label for="color">
		<g:message code="party.color.label" default="Color" />
		
	</label>
	<g:textField name="color" value="${partyInstance?.color}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="party.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${partyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'shortname', 'error')} ">
	<label for="shortname">
		<g:message code="party.shortname.label" default="Shortname" />
		
	</label>
	<g:textField name="shortname" value="${partyInstance?.shortname}"/>
</div>

