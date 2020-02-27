FROM openjdk:11
LABEL maintainer="rakeshv.com@gmail.com"
EXPOSE 8081
VOLUME /var/tmp
ENV JAVA_OPTS=""
ARG JAR_FILE=./target/demo-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} generator.jar
WORKDIR /var/tmp
ENTRYPOINT ["sh", "-c","java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /generator.jar"]