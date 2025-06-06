# Use an official Ubuntu base image
FROM ubuntu:20.04

# Metadata about the image
LABEL authors="kaish"

# Install required packages: Maven, JDK 17, and other dependencies
RUN apt-get update && \
    apt-get install -y maven openjdk-17-jdk curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for Java and Maven
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV MAVEN_HOME=/usr/share/maven
ENV PATH="${MAVEN_HOME}/bin:${JAVA_HOME}/bin:${PATH}"


# Set the working directory
WORKDIR /usr/src/app

# Copy the entire Maven project to the container
COPY . .

# Build the project (uncomment if you want to build it here)
RUN mvn clean package

# Specify the JAR file to copy (assuming it's named "registry-app-1.0.1.jar" after build)
# Make sure this matches the actual output JAR name from your Maven build
COPY target/registry-app-1.0.2.jar registry-app-1.0.2.jar

# Run the jar file
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "registry-app-1.0.2.jar"]