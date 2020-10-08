# docker build -t spring-in-docker:1.2 .

FROM adoptopenjdk/openjdk11:alpine-slim as build

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw package -DskipTests

FROM adoptopenjdk/openjdk11:alpine-jre

COPY --from=build target/spring-in-docker-1.2.jar spring-in-docker.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "spring-in-docker.jar"]