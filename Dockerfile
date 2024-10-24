#docker build -t spring-in-docker:6.5 .
FROM container-registry.oracle.com/graalvm/native-image:23 AS build

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN --mount=type=cache,target=/root/.m2,rw ./mvnw -Pnative native:compile -DskipTests

FROM busybox:1.37-glibc

COPY --from=build /app/target/spring-in-docker spring-in-docker

EXPOSE 8080

ENTRYPOINT ["./spring-in-docker"]
