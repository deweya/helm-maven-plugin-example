FROM docker.io/maven:3.8.5-jdk-8-slim AS builder
COPY . /src
WORKDIR /src
RUN mvn clean package && \
    mv target/*.jar target/app.jar

FROM docker.io/openjdk:8u332-jre-slim
RUN groupadd -r user && useradd -r -g user user
USER user
WORKDIR /app
COPY --from=builder --chown=user:user /src/target/app.jar .
CMD ["java", "-jar", "app.jar"]