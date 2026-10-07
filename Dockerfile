FROM tomcat:latest
MAINTAINER vinayak<vhvinayak2@gmail.com>
COPY target/my-web-app.war /usr/local/tomcat/webapps/

EXPOSE 8080
