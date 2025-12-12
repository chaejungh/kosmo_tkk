FROM --platform=linux/amd64 eclipse-temurin:21-jdk

COPY build/libs/tkk-0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]

#docker buildx build --platform linux/amd64 -t yhsmam0817/thekuku-spring:0.0.1 --push .
