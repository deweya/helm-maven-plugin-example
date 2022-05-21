FROM docker.io/openjdk:8u332-jre-slim
RUN groupadd -r user && useradd -r -g user user
USER user
WORKDIR /app
COPY target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]