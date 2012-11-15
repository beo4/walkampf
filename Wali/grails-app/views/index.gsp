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
					<h1>Walkampf</h1>
					 <sec:ifNotGranted roles="ROLE_FACEBOOK">
					 <p>Sei dabei beim Walkampf</p>
					
					<p>Mach mit bei der Umfrage zur Wahl auf <em>Walkampf.org</em>. Einfach mit Facebook anmelden und los gehts</p>
		                <facebookAuth:connect permissions="read_stream,publish_actions,user_about_me,user_birthday,user_education_history,user_interests,user_religion_politics,user_work_history"  />
		            </sec:ifNotGranted>
					 <sec:ifAllGranted roles="ROLE_FACEBOOK">
		                Hallo <sec:username/>
		                		
		
		                <g:javascript>
		                function doLogout() {
		                    if (typeof(FB) === 'object') {
		                        FB.logout(function() {
		                            window.location.href = "${createLink(uri: '/j_spring_security_logout')}";
		                        });
		                        return false;
		                    }
		                    return true;
		                }
		                </g:javascript>
		
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
