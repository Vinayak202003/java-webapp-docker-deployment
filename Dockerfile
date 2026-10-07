FROM tomcat:9

COPY target/my-web-app.war /usr/local/tomcat/webapps/

EXPOSE 8080
