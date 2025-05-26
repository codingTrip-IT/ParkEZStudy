# 1. Java 17이 설치된 가볍고 빠른 Linux 기반 이미지 사용 (Alpine은 매우 경량화된 리눅스)
FROM eclipse-temurin:17-jdk-alpine

# 2. Gradle 빌드로 생성된 JAR 파일을 컨테이너 내부로 복사
#    - 경로: 로컬의 build/libs 디렉토리
#    - *SNAPSHOT.jar: 보통 개발용 빌드에 붙는 이름 (ex. myapp-0.0.1-SNAPSHOT.jar)
#    - project.jar: 복사한 JAR 파일의 컨테이너 내부 이름 (실행용 이름으로 통일)
COPY ./build/libs/*SNAPSHOT.jar project.jar

# 3. 컨테이너가 실행되면 자동으로 이 명령어가 실행됨
#    - Java 실행: java -jar project.jar (Spring Boot 앱 실행)
ENTRYPOINT ["java", "-jar", "project.jar"]