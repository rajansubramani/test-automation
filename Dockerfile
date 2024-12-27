# Step 1: Use a base image with OpenJDK and Maven pre-installed
FROM maven:3.8.4-openjdk-17-slim as build

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy your Maven project files into the container
COPY . /app

# Step 4: Run Maven to build the project (equivalent to 'mvn clean install')
RUN mvn clean install

# Step 5: Create the final image with just the JRE (for runtime)
FROM openjdk:17-slim

# Step 6: Set the working directory in the container
WORKDIR /app

# Step 7: Copy the WAR file from the build container to the runtime container
COPY --from=build /app/target/mybook.war /app/mybook.war

# Step 8: Expose the port that your Java application will run on
EXPOSE 8080

# Step 9: Set the command to run the WAR file using the OpenJDK runtime
CMD ["java", "-jar", "/app/mybook.war"]
