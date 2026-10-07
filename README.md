# Java Web Application Deployment using Docker and AWS EC2

A simple Java web application built with Maven, packaged as a WAR file, containerized with Docker and Apache Tomcat, published to Docker Hub, and deployed on an AWS EC2 instance.

## Technologies

- Java
- Maven
- Apache Tomcat
- Docker
- Docker Hub
- AWS EC2

## Deployment Flow

Java Web Application
→ Maven
→ WAR File
→ Docker Image
→ Docker Hub
→ AWS EC2
→ Docker Container
→ Tomcat
→ Web Application

## Build the WAR

```bash
mvn clean package
```

The WAR file is generated in the `target/` directory.

## Dockerfile

The application WAR is copied into Tomcat's `webapps` directory.

## Build the Docker Image

```bash
docker build -t my-web-app .
```

## Run the Container

```bash
docker run -d -p 8080:8080 --name java-webapp my-web-app
```

Check the running container:

```bash
docker ps
```

## Push to Docker Hub

```bash
docker login
docker tag my-web-app <dockerhub-username>/my-web-app:latest
docker push <dockerhub-username>/my-web-app:latest
```

## AWS EC2

The Docker container was deployed on an EC2 instance. The application port was allowed through the EC2 Security Group.

The application can then be accessed using:

```text
http://<EC2-PUBLIC-IP>:8080/<application-context>/
```

## Project Result

The Java web application was successfully packaged, containerized, published to Docker Hub, and deployed on AWS EC2.
