# docker build -t spring-in-docker:1.2 .

FROM eclipse-temurin:23-jdk-alpine AS build

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw package -DskipTests

FROM eclipse-temurin:23-jre-alpine

COPY --from=build target/spring-in-docker-1.2.jar spring-in-docker.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "spring-in-docker.jar"]
