# Custom Spring Boot generator

A simple Java applicaton developed using Spring boot generators to\
quickly bootstrap a customized spring boot application

## Description

You can use this custom generator to quickly build a web application\
with preconfigured artifactid, groupid, names and specific dependencies.

When generating projects from standard generators like start.spring.io,\
you need to rename the artifactid, groupid, name and add some dependencies.

With one single command line you can do all the above using this generator.

## Prerequisites

Below are the softwares that needs to be installed as a dependency

```
Maven
Docker (to build Docker image)
httpie (command line tool) or curl is also good enough
```

## Getting started

You can either clone this repo, build the application or run the docker container

```bash
docker pull rakgenius/springboot-generator:v1
```

and run the image image using

```bash
docker run -it -d -p 8081:8081 rakgenius/springboot-generator:v1
```

Then navigate to
```
http://localhost:8081
```

This will display all the supported actions.

## Running the application manually

1 . Git clone the repo to any machine

2 . Build the packages using the command
```bash
mvnw package -DskipTests
```

4 . Run the application using
```bash
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

Below are the useful commands

### To create a default project:
```bash
http http://localhost:8081/starter.zip -d
```

### To create a web project using Java 11:
```bash
http http://localhost:8081/starter.zip dependencies==web javaVersion==11 -d
```

### To create a web/data-jpa gradle project unpacked:
```bash
http http://localhost:8081/starter.tgz dependencies==web,data-jpa type==gradle-project baseDir==my-dir | tar -xzvf -
```

### To generate a Maven POM with war packaging and specific dependencies:
```bash
http http://localhost:8081/pom.xml packaging==war -o pom.xml dependencies==web,data-jpa,thymeleaf,actuator
```


## Building the docker images

Below are the command to build the docker image and to publish it to docker hub

1 . Build the docker image using
```bash
docker build -t springboot-generator .
```

2 . Run the docker image using
```bash
docker run -d -it -p 8081:8081 --name springboot-generator springboot-generator
```

3 . Create your own image which has to be pushed to the docker hub
```bash
docker image ls
```

Get the "IMAGE ID" of "springboot-generator" image

Set the tag to your image

```bash
docker tag <IMAGE TAG OBTAINED ABOVE> <your dockerhub username>/springboot-generator:latest
```

4 . Now push the docker image to docker hub
```bash
docker push <your docker hub username>/springboot-generator
```

6 . Now you can pull the image on any machine anywhere using
```bash
docker pull <your dockerhub username>/springboot-generator
```

And run it using the command mentioned in step 2.

## Built With

* [Maven](https://maven.apache.org/) - Dependency Management


## Authors
Rakesh Venkatesh