grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        // runtime 'mysql:mysql-connector-java:5.1.20'
		runtime 'org.springframework.social:spring-social-facebook:1.0.2.RELEASE'
		runtime 'org.springframework.social:spring-social-core:1.0.2.RELEASE'
    }

    plugins {
        compile ":hibernate:$grailsVersion"
		compile ':joda-time:1.4'
		
        runtime ":jquery:1.8.2"
		runtime ":jquery-ui:1.8.24"
        runtime ":resources:1.1.6"
		
		runtime ':spring-security-core:1.2.7.3'
		runtime ':spring-security-facebook:0.9'
		//runtime ':spring-security-twitter:0.4.3'
		runtime ':spring-security-ui:0.2'
		//runtime ':spring-social-core:0.1.31'
		//runtime ':spring-social-facebook:0.1.32'
		//runtime ':spring-social-twitter:0.1.31'
		
        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"
		runtime ":twitter-bootstrap:2.2.1"
		runtime ':fields:1.3'
		//compile ':less-resources:1.3.0.2'
		
        compile ":tomcat:$grailsVersion"

        runtime ':database-migration:1.1'

        compile ':cache:1.0.0'
    }
}