# Build stage
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory
WORKDIR /build

# Copy files to the working directory
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package

# Runtime stage
FROM openjdk:17-jdk

# Set the working directory
WORKDIR /app

# Define an argument to accept the JAR file name
ARG JAR_FILE=/build/target/webapp-0.0.1-SNAPSHOT.jar

# Copy the packaged Spring Boot JAR file from the build stage to the working directory
COPY --from=build ${JAR_FILE} /app/app.jar

# Expose the application's port
EXPOSE 8080

# Start the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
