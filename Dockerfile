# USER Below command to build image
#docker build -t two-app-conatiner-img .
#USER below command to Run container 
#docker container run -P -d two-app-conatiner-img

# Use an official OpenJDK 21 JDK slim image as the base
FROM openjdk:21

# Add metadata to the image
LABEL authors="Mritunjay Singh"

# Set the working directory to /app
WORKDIR /app

# Copy the Spring Boot JAR files into the container
COPY mks-sb-actuator.jar /app/mks-sb-actuator.jar
COPY docker-sb-first-app.jar /app/docker-sb-first-app.jar

# Expose different ports for each Spring Boot application
EXPOSE 8080
EXPOSE 8082


# Use a script to run both applications
CMD ["sh", "-c", "java -jar /app/mks-sb-actuator.jar --server.port=8080 & java -jar /app/docker-sb-first-app.jar --server.port=8082"]

# USER Below command to build image
#docker build -t two-app-conatiner-img .