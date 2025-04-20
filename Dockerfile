# Stage 1: Build
FROM maven:3.8.5-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jdk

LABEL maintainer="Devshree"

VOLUME /tmp

EXPOSE 9090

# Copy the jar, using wildcard in case of version/SNAPSHOT suffix
COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]
