FROM maven:latest AS build
WORKDIR app
COPY . .
RUN mvn clean install

FROM openjdk:11-jre-slim
WORKDIR app
COPY --from=build /app/target/my-app-1.0.1.jar /app
CMD ["java", "-jar", "my-app-1.0.1.jar"]

