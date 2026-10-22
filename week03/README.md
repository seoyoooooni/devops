# Week 03

## 학습 목표

- 반복해서 입력하는 명령을 실행 가능한 셸 스크립트로 만든다.
- shebang, 실행 권한, 작업 디렉터리와 스크립트 위치의 차이를 이해한다.
- 환경 변수와 조건문으로 실행 설정과 오류 처리를 구현한다.


### start.sh
``` bash
#!/bin/bash
cd "$(dirname "$0")" || exit 1
exec python3 chat.py
```
[`qwen-web/start.sh`](qwen-web/start.sh)는 스크립트가 있는 디렉터리로 이동한 다음 `chat.py`를 실행하도록 만든 파일이다.

#!: 셔뱅
- 어떤 인터프리터로 실행할지 os에 알려주는 부분으로 파일의 첫 줄에 작성한다.
- 이 파일을 실행할 때, 바로 뒤에 적힌 프로그램으로 이 파일을 해석하라

cd "$(dirname "$0")" || exit 1
- 해당 스크립트가 있는 디렉토리로 이동하고, 이동 실패 시 스크립트 종료

exec
- 현재 셸 프로세스를 뒤에 나오는 프로그램으로 변경한다.

cat > filename << 'EOF'
-- EOF입력시 입력 종료

ps aux | head -5
- 프로세스 정보 앞 5줄

ps aux | grep bash
- bash를 포함하는 프로세스
