#!/bin/bash

# REPOSITORY 변수에 JAR 파일이 저장된 디렉토리 경로 지정
REPOSITORY=/home/ubuntu/app/build/libs

# PROJECT_NAME 변수에 프로젝트 이름 지정
PROJECT_NAME="project"

# 현재 실행 중인 애플리케이션의 PID 확인
CURRENT_PID=$(pgrep -f "java -jar $REPOSITORY/$PROJECT_NAME-0.0.1-SNAPSHOT.jar")

# 현재 애플리케이션이 실행 중이면 종료
if [ -n "$CURRENT_PID" ]; then
  kill -15 $CURRENT_PID
  sleep 5
fi

# JAR 파일 이름 가져오기
JAR_NAME=$(ls -tr $REPOSITORY/$PROJECT_NAME-0.0.1-SNAPSHOT.jar | tail -n 1)

# JAR 파일에 실행 권한 추가
chmod +x $REPOSITORY/$PROJECT_NAME-0.0.1-SNAPSHOT.jar

# JAR 파일 실행
nohup java -jar $REPOSITORY/$PROJECT_NAME-0.0.1-SNAPSHOT.jar > $REPOSITORY/nohup.out 2>&1 &