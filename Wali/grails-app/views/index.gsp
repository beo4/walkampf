<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>Walkampf</title>
		<facebookAuth:init />
	</head>

	<body>
		<div class="row-fluid">
			
			<section id="main" class="span12">

				<div class="hero-unit">
					<h1>Stell dir vor es ist Wahl</h1>
					<p>und du bist schon da!</p>
					 <sec:ifNotGranted roles="ROLE_FACEBOOK">
					
					<p>Deine Stimme für <em>Walkampf.org</em>. Einfach mit deinem Facebookkonto anmelden und los gehts!</p>
		                <facebookAuth:connect permissions="read_stream,publish_actions,user_about_me,user_birthday,user_education_history,user_interests,user_religion_politics,user_work_history"  />
		            </sec:ifNotGranted>
					 <sec:ifAllGranted roles="ROLE_FACEBOOK">
		                Hallo <sec:username/>
		                
		                wenn heute Bundestagswahl wäre welche Parte würdest du wählen?
		                
						<g:form class="form-horizontal" action="create" controller="vote" >
							<fieldset>
								 <f:input bean="vote" property="party"/>
							
								<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.create.label" default="Create" />
								</button>
							</div>
							</fieldset>
						</g:form>		                		
		
		                <g:link uri="/j_spring_security_logout" onclick="return doLogout()">Logout</g:link>
		            </sec:ifAllGranted>
		
				</div>
					
				<div class="row-fluid">
					
					<div class="span4">
					</div>

					<div class="span4">
						
					</div>
					
					<div class="span4">
					
					</div>

				</div>

			</section>
		</div>
	</body>
</html>
