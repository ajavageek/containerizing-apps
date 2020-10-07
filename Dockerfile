# docker build -t spring-in-docker:1.0 .

FROM eclipse-temurin:23-jdk-alpine

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src
RUN ./mvnw package -DskipTests

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "target/spring-in-docker-1.0.jar"]
