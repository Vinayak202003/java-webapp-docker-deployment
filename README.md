# Java Web Application Deployment using Docker and AWS EC2

A simple Java web application packaged with Maven, containerized using Docker and Apache Tomcat, pushed to Docker Hub, and deployed on an AWS EC2 instance.

## Technologies Used

- Java
- Maven
- Apache Tomcat
- Docker
- Docker Hub
- AWS EC2

## Deployment Architecture

```
Java Web Application
        ↓
      Maven
        ↓
      WAR File
        ↓
   Docker Image
        ↓
    Docker Hub
        ↓
     AWS EC2
        ↓
 Docker Container
        ↓
    Tomcat :8080
        ↓
Web Application
```

## 1. Build the Java Application

The application was created using the Maven Web Application archetype.

```bash
mvn archetype:generate -DgroupId=org.scopeindia -DartifactId=my-web-app -DarchetypeArtifactId=maven-archetype-webapp -DarchetypeVersion=1.4 -DinteractiveMode=false
```

Build the WAR file:

```bash
mvn clean package
```

The generated WAR file is:

```text
target/my-web-app.war
```

## 2. Dockerfile

The WAR file is deployed into the Tomcat `webapps` directory.

```dockerfile
FROM tomcat:latest
MAINTAINER vinayak<vhvinayak2@gmail.com>

COPY target/my-web-app.war /usr/local/tomcat/webapps/

EXPOSE 8080
```

## 3. Build the Docker Image

```bash
docker build -t my-web-app .
```

Check the image:

```bash
docker images
```

## 4. Push the Image to Docker Hub

Docker Hub repository:

**vhvinayak/my-web-app**

Commands used:

```bash
docker login
docker tag my-web-app vhvinayak/my-web-app:latest
docker push vhvinayak/my-web-app:latest
```

## 5. Run the Container on AWS EC2

The application runs on Tomcat port `8080` inside the container. Port `8999` on the EC2 host is mapped to container port `8080`.

```bash
docker run -d -p 8999:8080 my-web-app
```

Check the running container:

```bash
docker ps
```

Example:

```text
0.0.0.0:8999->8080/tcp
```

## 6. AWS Security Group

An inbound rule was added to allow TCP traffic on port **8999**.

The application can then be accessed using:

```text
http://<EC2-PUBLIC-IP>:8999/my-web-app/
```

## 7. Application Result

The deployed website displays:

- Java Web Application
- Deployment success message
- Technologies used
- Deployment process
- Application running inside a Docker container

The application was successfully accessed through the EC2 public IP and port **8999**.

## Useful Docker Commands

Check running containers:

```bash
docker ps
```

Check all containers:

```bash
docker ps -a
```

Check Docker images:

```bash
docker images
```

Stop a container:

```bash
docker stop <container-id>
```

Remove a container:

```bash
docker rm <container-id>
```

## Project Outcome

This project demonstrates a complete basic deployment workflow:

**Maven → WAR → Docker Image → Docker Hub → AWS EC2 → Docker Container → Tomcat → Web Application**

It was a hands-on practice project for learning Docker containerization and cloud deployment with AWS EC2.
