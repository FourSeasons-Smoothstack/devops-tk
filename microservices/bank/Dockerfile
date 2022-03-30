# syntax=docker/dockerfile:1
FROM alpine

RUN apk update && \
    apk add openjdk11-jre

EXPOSE 8083

ENV APP_PORT=8083

COPY . /app
WORKDIR /app

ENTRYPOINT ["java", "-jar", "bank-microservice-0.1.0.jar"]