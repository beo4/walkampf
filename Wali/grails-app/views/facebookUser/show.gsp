
<%@ page import="de.wali.user.facebook.FacebookUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'facebookUser.label', default: 'FacebookUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-facebookUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-facebookUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list facebookUser">
			
				<g:if test="${facebookUserInstance?.uid}">
				<li class="fieldcontain">
					<span id="uid-label" class="property-label"><g:message code="facebookUser.uid.label" default="Uid" /></span>
					
						<span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${facebookUserInstance}" field="uid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facebookUserInstance?.accessToken}">
				<li class="fieldcontain">
					<span id="accessToken-label" class="property-label"><g:message code="facebookUser.accessToken.label" default="Access Token" /></span>
					
						<span class="property-value" aria-labelledby="accessToken-label"><g:fieldValue bean="${facebookUserInstance}" field="accessToken"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facebookUserInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="facebookUser.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="secUser" action="show" id="${facebookUserInstance?.user?.id}">${facebookUserInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${facebookUserInstance?.id}" />
					<g:link class="edit" action="edit" id="${facebookUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
