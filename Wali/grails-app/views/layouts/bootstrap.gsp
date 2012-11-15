<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
		<meta name="description" content="">
		<meta name="author" content="">

		<meta name="viewport" content="initial-scale = 1.0">

		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<r:require modules="scaffolding"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">
		
		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					
					<a class="brand" href="${createLink(uri: '/')}">Walkampf</a>

					<div class="nav-collapse">
						<ul class="nav">							
							<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>
							<sec:ifNotGranted roles="ROLE_FACEBOOK,ROLE_TWITTER">
							<li class="dropdown">
						    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						      Login
						      <b class="caret"></b>
						    </a>
						    <ul class="dropdown-menu">
						      <sec:ifNotGranted roles="ROLE_FACEBOOK">
						      <li>
						      	<div><facebookAuth:connect permissions="read_stream,publish_actions,user_about_me,user_birthday,user_education_history,user_interests,user_religion_politics,user_work_history" /></div>
						      </li>
						      </sec:ifNotGranted>
						    </ul>
						  </li>
						  </sec:ifNotGranted>
						  
						  <sec:ifAnyGranted roles="ROLE_FACEBOOK,ROLE_TWITTER">
						  <li class="dropdown">
						    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						      Logout
						      <b class="caret"></b>
						    </a>
						    <ul class="dropdown-menu">
						      <sec:ifAllGranted roles="ROLE_FACEBOOK">
						      <li>
						      	<div><g:javascript>
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
					
					                <g:link uri="/j_spring_security_logout" onclick="return doLogout()">Logout</g:link></div>
						      </li>
						      </sec:ifAllGranted>
						    </ul>
						  </li>
						  </sec:ifAnyGranted>
						</ul>
					</div>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<g:layoutBody/>

			<hr>

			<footer>
				<p>&copy; Walkampf</p>
			</footer>
		</div>

		<r:layoutResources/>

	</body>
</html>