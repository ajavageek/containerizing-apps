# docker build -t spring-in-docker:3.0 .

FROM eclipse-temurin:23-jdk-alpine AS build

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw package -DskipTests

FROM eclipse-temurin:23-jre-alpine AS layers

COPY --from=build target/spring-in-docker-3.0.jar spring-in-docker.jar

RUN java -Djarmode=layertools -jar spring-in-docker.jar extract

FROM eclipse-temurin:23-jre-alpine

COPY --from=layers dependencies/ .
COPY --from=layers snapshot-dependencies/ .
COPY --from=layers spring-boot-loader/ .
COPY --from=layers application/ .

ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
