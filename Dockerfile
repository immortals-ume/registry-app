# ---------- Stage 1: Build ----------
FROM maven:3.9.6-eclipse-temurin-17 AS builder

LABEL stage="builder"

# Set work directory inside the builder
WORKDIR /build

# Copy pom.xml and download dependencies first (to cache layers)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the rest of the source code
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# ---------- Stage 2: Runtime ----------
FROM eclipse-temurin:17-jre as runtime

LABEL authors="kaish"

# Set the working directory in the runtime image
WORKDIR /app

# Copy the JAR from the builder stage
COPY --from=builder /build/target/registry-app-1.0.2.jar ./app.jar

# Expose the application port (adjust if needed)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
