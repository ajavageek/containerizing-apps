# docker build -t spring-in-docker:1.2 .

FROM eclipse-temurin:23-jdk-alpine AS build

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN --mount=type=cache,target=/root/.m2,rw ./mvnw package -DskipTests

FROM eclipse-temurin:23-jre-alpine

COPY --from=build target/spring-in-docker-1.2.jar spring-in-docker.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "spring-in-docker.jar"]
