# syntax=docker/dockerfile:1
FROM alpine

RUN apk update && \
    apk add openjdk11-jre
    
EXPOSE 8073

ENV APP_PORT=8073 

COPY . /app
WORKDIR /app

ENTRYPOINT ["java", "-jar", "transaction-microservice-0.1.0.jar"]