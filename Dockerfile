# FROM openjdk:21
# EXPOSE 8080
# ADD target/*.jar demo.jar
# ENTRYPOINT ["java", "-jar", "/demo.jar"]


FROM openjdk:21 AS builder

WORKDIR /app

COPY pom.xml ./
RUN mvn package

FROM openjdk:21

WORKDIR /app

COPY target/*.jar demo.jar
EXPOSE 8080

CMD ["java", "-jar", "demo.jar"]