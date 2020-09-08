# docker build -t spring-in-docker:0.5 .

FROM adoptopenjdk/openjdk11:alpine-jre

COPY target/spring-in-docker-0.5.jar spring-in-docker.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "spring-in-docker.jar"]