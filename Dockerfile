# docker build -t spring-in-docker:0.5 .

FROM eclipse-temurin:23-jre

COPY target/spring-in-docker-0.5.jar spring-in-docker.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "spring-in-docker.jar"]
