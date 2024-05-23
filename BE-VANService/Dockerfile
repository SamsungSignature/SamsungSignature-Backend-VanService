FROM eclipse-temurin:17-jdk-alpine
ARG JAR_FILE=build/libs/*.jar
WORKDIR /app
COPY ${JAR_FILE} van-service.jar
ENTRYPOINT ["java", "-jar", "/app/van-service.jar"]