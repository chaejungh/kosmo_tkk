# 1단계: Gradle로 빌드
FROM --platform=linux/amd64 eclipse-temurin:21-jdk AS builder
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew clean build -x test


# 2단계: 실행 전용 (JAR만 복사)
FROM eclipse-temurin:21-jdk
#로그 파일 저장시 경로
VOLUME /tmp
# 빌더 스테이지에서 jar 파일 복사
COPY --from=builder /app/build/libs/*.jar /app.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "/app.jar", "--logging.level.root=ERROR", "--logging.file.name=/tmp/app.log"]

#docker buildx build --platform linux/amd64 -t yhsmam0817/thekuku-spring:0.0.1 --push .
#sudo docker run -d --name app -p 443:443 yhsmam0817/thekuku-spring:0.0.3
