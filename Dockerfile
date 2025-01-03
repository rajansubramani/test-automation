# First stage: Build the project using Maven
FROM maven:3.8.1-openjdk-17-slim as build

# Set the working directory in the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Run Maven to package the app (this creates the WAR/JAR file in target/ directory)
RUN mvn clean package

# Second stage: Use a lightweight base image for the final app
FROM openjdk:17-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage into the final image
COPY --from=build /app/target/sample-java-project-1.0-SNAPSHOT.jar /app/sample-java-project-1.0-SNAPSHOT.jar

# Expose the port the app will run on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "/app/sample-java-project-1.0-SNAPSHOT.jar"]
