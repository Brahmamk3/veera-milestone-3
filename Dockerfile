FROM tomcat:9.0-jdk17
COPY target/addressbook.war /usr/local/tomcat/webapps/addressbook.war
