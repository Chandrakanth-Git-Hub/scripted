# Use an eclipse base image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy the jar file from target/
COPY target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]

